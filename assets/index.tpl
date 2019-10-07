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
            <p id="jsonData" hidden>{{ json_data }}</p>
            <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=b82b407e-9d44-4439-bd5d-ecd991b142bb" type="text/javascript"></script>
            <script type="text/javascript">
            function fetch_json() {
                return fetch('/get_points?date={{ response_date }}')
                    .then(res => res.json());
            }

            async function get_points(fetch) {
                let promise = new Promise((resolve, reject) => {
                    setTimeout(() => resolve(fetch), 1000)
                });
                result = await promise;
                return get_json_data(result);
            }

            function get_json_data(result) {
                console.log('this is res', result);
                jsonData = result; // done
                showMap(result)
            }

            function showMap(jsonData) {
                ymaps.ready(init);

                console.log(typeof(jsonData));
                console.log('this is json data heeelloo', jsonData);

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
                        center: [(jsonData[0].latitude), (jsonData[0].longitude)],
                        zoom: 10
                    }, {
                        searchControlProvider: 'yandex#search'
                    });

                    let routes = [];

                    for (var i = 0; i < jsonData.length; i++) {
                        routes[i] = [(jsonData[i].latitude), (jsonData[i].longitude)];
                        if (jsonData[i].acceleration > 6) {
                            setDot(myMap, routes[i])
                        } else {
                            setDotYe(myMap, routes[i])
                        }
                    }

                    console.log(routes);
                    setDotYe(myMap, [60.117892, 30.150051])

                }
            }

            get_points(fetch_json());
            </script>
            <div id="map" style="min-height: 500px"></div>
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
