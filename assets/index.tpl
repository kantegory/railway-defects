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
        .logo {
            width: 80px;
            fill: #fff;
        }
    </style>
    <header>
        <nav id="top-nav" class="navbar navbar-dark fixed-top mb-1 bg-fpc flex-md-nowrap p-2 shadow w-100">
            <a href="" class="navbar-brand navbar-brand col-sm-3 col-md-2 mr-0">
                <svg xmlns="http://www.w3.org/2000/svg" id="Слой_1" data-name="Слой 1" viewBox="0 0 2268.2 1162.83" class="logo" >
                  <path class="cls-1" d="M1707.17,408.6c-2.29-.16-3.73-.34-5.17-.34q-113.49,0-227-.1c-3.49,0-5.41,1.34-7.35,3.94q-46.07,61.65-92.23,123.21c-6,8-11.75,16.18-17.13,24.59-6,9.46-10.29,19.72-11.48,31.08-1.91,18.2,3.5,34.52,14.11,48.77,23.56,31.66,47.21,63.29,71.91,94,16.14,20.09,36.22,35.76,61.34,43.89,19.54,6.31,39.75,8.31,60.07,8.72,28.15.57,56.32.48,84.48.4,36.48-.1,73-.14,109.45-.86a308.68,308.68,0,0,0,77.38-11.27c53.15-14.86,93.35-45.72,117.71-95.9,16-33.06,23.16-68.41,24-104.81,1-43.14.47-86.31.41-129.47,0-27.92-3.24-55.49-11.09-82.36-19.51-66.68-61.86-110.78-129.08-130.29-33.58-9.75-68-12.54-102.74-12.72-63.49-.34-127-.12-190.48-.06a152.14,152.14,0,0,0-16.93,1c-24,2.71-42.67,20.16-45.25,44.19-1.68,15.66-1,31.58-1.33,47.38,0,.45.33.9.73,1.88h6.23q116.73,0,233.47.05a172,172,0,0,1,19.91,1.22c24.1,2.83,40.1,17.16,44.88,40.91a137.93,137.93,0,0,1,2.53,26.76q.29,120.5,0,241a173.45,173.45,0,0,1-1.66,22.88c-3.06,22.67-16.67,38.17-38.49,43.24a108.72,108.72,0,0,1-23.74,2.58c-43.33.24-86.66.16-130,0a122.11,122.11,0,0,1-17.4-1.3c-26.39-3.86-39.68-26.46-29.59-51.16A105.78,105.78,0,0,1,1551,617q76.1-101.9,152.6-203.49C1704.65,412.07,1705.67,410.64,1707.17,408.6Zm-1088.45,378c1.82.13,2.62.23,3.43.23q114.75,0,229.49-.13a8.64,8.64,0,0,0,5.94-3.19q49.2-65.25,98.07-130.73a219.26,219.26,0,0,0,13.05-19.5c14.17-23.92,14.4-48-.34-71.73-6.59-10.59-13.92-20.76-21.52-30.65-18.66-24.3-37.06-48.84-56.7-72.33-24-28.75-55.11-45.3-92.88-47.69-21.75-1.37-43.56-2.4-65.35-2.53-58.33-.34-116.67-.17-175-.1q-117.73.14-235.47.43c-17.7,0-33.6,4.53-45.53,18.66-6.18,7.31-10.42,15.76-11.12,25.22-1.23,16.52-1.53,33.12-2.25,50.34h95.57V976.18H547V509.44c0-6.58,0-6.59,6.42-6.59q90.24,0,180.49,0c6.82,0,13.66.31,20.45.91,30.6,2.72,45.17,27.67,32.15,55.47a111,111,0,0,1-11.82,19.05Q713.13,660.8,651.24,743.09C640.56,757.33,629.94,771.6,618.72,786.61ZM1423,408.54c-2.44-.13-4-.29-5.65-.29q-112.74,0-225.49-.09a9.13,9.13,0,0,0-8.29,4.09q-138.29,184.62-276.75,369.1c-1.15,1.54-2.26,3.11-4,5.5h5.82q112.74,0,225.49.09c4,0,6.24-1.3,8.56-4.41q133.92-178.8,268-357.48C1414.63,419.78,1418.54,414.47,1423,408.54Z"></path>
                  <path d="M1707.17,408.6c-1.5,2-2.52,3.47-3.58,4.88Q1627.24,515.18,1551,617a105.78,105.78,0,0,0-13.29,22.75c-10.09,24.7,3.2,47.3,29.59,51.16a122.11,122.11,0,0,0,17.4,1.3c43.33.11,86.66.19,130,0a108.72,108.72,0,0,0,23.74-2.58c21.82-5.07,35.43-20.57,38.49-43.24a173.45,173.45,0,0,0,1.66-22.88q.17-120.48,0-241A137.93,137.93,0,0,0,1776,355.7c-4.78-23.75-20.78-38.08-44.88-40.91a172,172,0,0,0-19.91-1.22q-116.74-.12-233.47-.05h-6.23c-.4-1-.74-1.43-.73-1.88.34-15.8-.35-31.72,1.33-47.38,2.58-24,21.23-41.48,45.25-44.19a152.14,152.14,0,0,1,16.93-1c63.5-.06,127-.28,190.48.06,34.69.18,69.16,3,102.74,12.72,67.22,19.51,109.57,63.61,129.08,130.29,7.85,26.87,11.05,54.44,11.09,82.36.06,43.16.56,86.33-.41,129.47-.82,36.4-7.93,71.75-24,104.81-24.36,50.18-64.56,81-117.71,95.9A308.68,308.68,0,0,1,1748.2,786c-36.48.72-73,.76-109.45.86-28.16.08-56.33.17-84.48-.4-20.32-.41-40.53-2.41-60.07-8.72-25.12-8.13-45.2-23.8-61.34-43.89-24.7-30.76-48.35-62.39-71.91-94-10.61-14.25-16-30.57-14.11-48.77,1.19-11.36,5.43-21.62,11.48-31.08,5.38-8.41,11.15-16.59,17.13-24.59q46-61.66,92.23-123.21c1.94-2.6,3.86-4,7.35-3.94q113.49.16,227,.1C1703.44,408.26,1704.88,408.44,1707.17,408.6Z"></path>
                  <path d="M618.72,786.61c11.22-15,21.84-29.28,32.52-43.52Q713,660.72,774.73,578.32a111,111,0,0,0,11.82-19.05c13-27.8-1.55-52.75-32.15-55.47-6.79-.6-13.63-.9-20.45-.91q-90.24-.11-180.49,0c-6.41,0-6.42,0-6.42,6.59V976.18H358.11V502.91H262.54c.72-17.22,1-33.82,2.25-50.34.7-9.46,4.94-17.91,11.12-25.22,11.93-14.13,27.83-18.63,45.53-18.66q117.74-.24,235.47-.43c58.33-.07,116.67-.24,175,.1,21.79.13,43.6,1.16,65.35,2.53,37.77,2.39,68.84,18.94,92.88,47.69,19.64,23.49,38,48,56.7,72.33,7.6,9.89,14.93,20.06,21.52,30.65,14.74,23.68,14.51,47.81.34,71.73a219.26,219.26,0,0,1-13.05,19.5q-48.89,65.48-98.07,130.73a8.64,8.64,0,0,1-5.94,3.19q-114.74.24-229.49.13C621.34,786.84,620.54,786.74,618.72,786.61Z"></path>
                  <path d="M1423,408.54c-4.41,5.93-8.32,11.24-12.28,16.51q-134,178.73-268,357.48c-2.32,3.11-4.61,4.42-8.56,4.41q-112.74-.18-225.49-.09h-5.82c1.72-2.39,2.83-4,4-5.5q138.4-184.53,276.75-369.1a9.13,9.13,0,0,1,8.29-4.09q112.74.16,225.49.09C1418.9,408.25,1420.51,408.41,1423,408.54Z"></path>
                </svg>

            </a>
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
