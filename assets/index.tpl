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
            <!-- Load Scripts -->
            <script>
                let scr = {"scripts":[
                    {"src" : "https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=b82b407e-9d44-4439-bd5d-ecd991b142bb", "async" : false},
                    {"src" : "js?script_name=export.js", "async" : false},
                    {"src" : "js?script_name=push.js", "async" : false}
                ]};!function(t,n,r){"use strict";var c=function(t){if("[object Array]"!==Object.prototype.toString.call(t))return!1;for(var r=0;r<t.length;r++){var c=n.createElement("script"),e=t[r];c.src=e.src,c.async=e.async,n.body.appendChild(c)}return!0};t.addEventListener?t.addEventListener("load",function(){c(r.scripts);},!1):t.attachEvent?t.attachEvent("onload",function(){c(r.scripts)}):t.onload=function(){c(r.scripts)}}(window,document,scr);
            </script>
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
                    jsonData = result; // done
                    showMap(result)
                }

                function setDot(map, coord) {
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
                        let point = jsonData[0];
                        show_point(point);
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

                get_points(fetch_json())

            </script>
        </main>
    </div>
</body>
</html>
