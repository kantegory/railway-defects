import bottle
from bottle import request, route, template, static_file
from utils.reports import create_report_by_date, add_new_data, get_date_from_request, get_critical_from_request
from utils.db_manage import critical_parameter_update, critical_parameter_select
import json

app = bottle.app()


@route('/', method='GET')
def show_main():
    date = get_date_from_request(request.params)
    rows = create_report_by_date(date)
    report_date = json.loads(rows)[0]['time']
    medium_critical = critical_parameter_select({'type': 'medium'})
    high_critical = critical_parameter_select({'type': 'high'})
    medium_critical = medium_critical['acceleration'] if len(medium_critical) != 0 else 0
    high_critical = high_critical['acceleration'] if len(high_critical) != 0 else 0

    return template('assets/index', date=report_date, rows=rows, json_data=rows, response_date=request.params.date,
                    medium_critical=medium_critical, high_critical=high_critical)


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


@route('/set_critical', method='GET')
def set_critical():
    parameters = get_critical_from_request(request.params)
    critical_parameter_update(parameters)


@route('/js', method='GET')
def get_js():
    script_name = request.params.script_name
    script = {
        'path': 'js/',
        'name': '{}'.format(script_name)
    }
    js = '{}{}'.format(script['path'], script['name'])
    return static_file(js, root='assets')


def main():
    bottle.run(app=app, port=8081)


if __name__ == '__main__':
    main()
