<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Админ-панель</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="http://kantegory.site/web_form/font-awesome.min.css" rel="stylesheet">
</head>

<body>
    <style>
        .bg-fpc {
			background: #bb1e10;
		}
	</style>
    <header>
        <nav id="top-nav" class="navbar navbar-dark fixed-top mb-1 bg-fpc flex-md-nowrap p-2 shadow w-100">
            <a href="" class="navbar-brand navbar-brand col-sm-3 col-md-2 mr-0">РЖД</a>
        </nav>
    </header>
    <div class="container-fluid mt-5">
            <main role="main" class="bg-light p-3">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Отчёт за {{ date }}</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">Экспортировать</button>
                        </div>
                        <form action="/" method="get">
                            <input type="date" name="date" class="btn btn-sm btn-outline-secondary">
                            <button type="submit" class="ml-1 btn bg-fpc text-white"><i class="fa fa-filter"></i></button>
                        </form>
                    </div>
                </div>
                <script type="text/javascript">
                    ymaps.ready(init);

                    let jsonData = {{ json_data }};


                    function setDot(map, coord) {
                      console.log(coord);
                      myMap = map;
                      myMap.geoObjects
                      .add(new ymaps.Placemark(coord, {
                        balloonContent: 'координаты проблемной точки: ' + coord,
                    }, {
                          preset: 'islands#redAttentionIcon',
                          iconCaptionMaxWidth: '50'
                        }));
                    }

                    function setDotYe(map, coord) {
                      console.log(coord);
                      myMap = map;
                      myMap.geoObjects
                      .add(new ymaps.Placemark(coord, {
                        balloonContent: 'координаты проблемной точки: ' + coord,
                    }, {
                          preset: 'islands#yellowAttentionIcon',
                          iconCaptionMaxWidth: '50'
                        }));
                    }


                    function init() {
                      // Создаем карту.
                      var myMap = new ymaps.Map("map", {
                        center: [(jsonData.Point[0].coordinate.latitude),(jsonData.Point[0].coordinate.longitude)],
                        zoom: 10
                      }, {
                        searchControlProvider: 'yandex#search'
                      });
                    let routes = [];

                    for(var i = 0; i < jsonData.Point.length; i++) {
                    routes[i] = [(jsonData.Point[i].coordinate.latitude),(jsonData.Point[i].coordinate.longitude)];
                      if (jsonData.Point[i].acceleration > 6){
                        setDot(myMap, routes[i])
                      } else {
                        setDotYe(myMap, routes[i])
                      }
                    }

                    console.log(routes);
                    setDotYe(myMap, [60.117892, 30.150051])

                      // Не создаем ломаную, используя класс GeoObject.

                      /* Создаем ломаную с помощью вспомогательного класса Polyline.
                      var myPolyline = new ymaps.Polyline(
                        routes, {
                        // Описываем свойства геообъекта.
                        // Содержимое балуна.
                        balloonContent: "Ломаная линия"
                      }, {
                        // Задаем опции геообъекта.
                        // Отключаем кнопку закрытия балуна.
                        balloonCloseButton: false,
                        // Цвет линии.
                        strokeColor: "#00ab66",
                        // Ширина линии.
                        strokeWidth: 7,
                        // Коэффициент прозрачности.
                        strokeOpacity: 0.8
                      });
                      //описываем вектор от точки до маршрута
                       var myPoint = new ymaps.Placemark([55.45, 37.35]);
                      setDot(myMap, [55.50, 37.40])
                       var normalVec = new ymaps.Polyline([
                          myPolyline.geometry.getClosest(myPoint.geometry.getCoordinates())
                          .position,
                          myPoint.geometry.getCoordinates()
                      ]); */
                      // Добавляем линии на карту.
                      //myMap.geoObjects
                       // .add(myPolyline)
                        /* add(myPoint) */
                        /* .add(normalVec) */



                    }


                </script>
                <iframe src="map" class="w-100" style="overflow: hidden;min-height: 500px;">

                </iframe>
                <h2>Подробные данные</h2>
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Широта</th>
                                <th>Долгота</th>
                                <th>Значение датчика</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <h2>Настройка</h2>
                <form name="critical_parameters" method="get" action="/">
                    <input placeholder="Введите среднее критическое значение"><input placeholder="Введите наиболее высокое критическое значение">
                </form>
            </main>
        </div>
</body>

</html>