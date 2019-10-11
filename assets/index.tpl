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
                <h1 class="h2" id="report_name">Отчёт за {{ date }}</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary" id="export">Экспортировать</button>
                    </div>
                    <form action="/" method="get">
                        <input type="date" name="date" class="btn btn-sm btn-outline-secondary" value="{{ response_date }}">
                        <button type="submit" class="ml-1 btn bg-fpc text-white"><i class="fa fa-filter"></i></button>
                    </form>
                </div>
            </div>
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

                function show_point(point) {
                    document.getElementById('map').innerHTML = '';

                    var myMap = new ymaps.Map("map", {
                        center: [(point.latitude), (point.longitude)],
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

                }

                function showMap(jsonData) {
                    ymaps.ready(init);


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
                            if (jsonData[i].acceleration >  6) { // заменить 6 на high_critical
                                setDot(myMap, routes[i])
                            } else {
                                setDotYe(myMap, routes[i])
                            }
                        }

                        console.log(routes);
                        setDotYe(myMap, [60.117892, 30.150051])

                    }



                    function init_table() {
                        for (let i = 0; i < jsonData.length; i++) {
                            document.querySelector('tbody').innerHTML += `
                                            <tr onclick='show_point(` + JSON.stringify(jsonData[i]) + `)'>
                                                <td>` + i + `</td>
                                                <td>` + jsonData[i].latitude + `</td>
                                                <td>` + jsonData[i].longitude + `</td>
                                                <td>` + jsonData[i].acceleration + `</td>
                                            </tr>
                                        `
                        }
                    }
                    init_table();


                }

                get_points(fetch_json());
            </script>
            <div id="map" style="min-height: 500px"></div>
            <h2>Подробные данные</h2>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Широта</th>
                            <th>Долгота</th>
                            <th>Значение датчика</th>
                        </tr>
                    </thead>
                    <tbody style="cursor: pointer;">
                    </tbody>
                </table>
            </div>
            <h2>Настройка</h2>
            <div id="pre-success">
            </div>
            <form class="form-group" method="get" action="/">
                <div class="form-group m-1 w-25">
                    <label for="medium_critical_parameter">Среднее критическое значение:</label>
                    <input id="medium_critical_parameter" class="form-control" placeholder="Среднее крит. значение" value="{{ medium_critical }}">
                </div>
                <div class="form-group m-1 w-25">
                    <label for="high_critical_parameter">Высокое критическое значение:</label>
                    <input id="high_critical_parameter" class="form-control" placeholder="Высокое крит. значение" value="{{ high_critical }}">
                </div>
                <button type="button" onclick="set_critical()" class="m-1 btn btn-secondary">Сохранить</button>
            </form>

            <script>
                function set_critical() {
                    let medium = document.getElementById('medium_critical_parameter').value;
                    let high = document.getElementById('high_critical_parameter').value;
                    
                    fetch('/set_critical?medium=' + medium + '&high=' + high);
                    success()
                }

                function success() {
                    document.getElementById('pre-success').innerHTML = `
                        <div class="alert alert-success w-25" id="success">
                          Изменения успешно внесены.
                        </div>`;
                    setTimeout("document.getElementById('success').remove()", 5000)
                }
                
                var tableToExcel = (function() {
                    var uri = 'data:application/vnd.ms-excel;base64,'
                    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
                    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
                    , format = function(s, c) {
                        return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; })
                    }
                    , downloadURI = function(uri, name) {
                        var link = document.createElement("a");
                        link.download = name;
                        link.href = uri;
                        link.click();
                    };

                    return function(table, name, fileName) {
                        if (!table.nodeType) table = document.getElementById(table);
                            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML};
                        var resuri = uri + base64(format(template, ctx));
                        downloadURI(resuri, fileName);
                    }
                })();
                    let table_name = document.getElementById('report_name').innerText;
                    document.getElementById('export').onclick = function () {tableToExcel('table', table_name, table_name + '.xls')};

            </script>
        </main>
    </div>
</body>

</html>
