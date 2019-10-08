import bottle
from bottle import auth_basic, request, route, template
from utils.reports import create_report_by_date, add_new_data, get_date_from_request
import json

app = bottle.app()


@route('/', method='GET')
def show_main():
    date = get_date_from_request(request.params)
    rows = create_report_by_date(date)
    return template('assets/index', date=date, rows=rows, json_data=rows, response_date=request.params.date)


@route('/new_report', method='GET')
def show_report():
    json_data = request.params.data
    add_new_data(json.loads(json_data))
    return json.loads(json_data)


@route('/map')
def show_map():
    return template('assets/polyline.html')


@route('/get_points', method='GET')
def get_points():
    date = get_date_from_request(request.params)
    rows = create_report_by_date(date)
    return rows


def main():
    bottle.run(app=app, port=8081)


if __name__ == '__main__':
    main()
