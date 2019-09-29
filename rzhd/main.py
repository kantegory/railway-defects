import bottle
from bottle import auth_basic, request, route, template
from utils.reports import create_report_by_date, add_new_data
import json
import datetime

app = bottle.app()


@route('/', method='GET')
def show_main():
    if request.params:
        date = request.params.date.split('-')
        date = '{}.{}.{}'.format(date[2], date[1], date[0])
    else:
        date = datetime.datetime.now().strftime('%d.%m.%Y')
    rows = create_report_by_date(date)
    print(rows)

    return template('assets/index', date=date, rows=rows, json_data=rows)


@route('/new_report', method='GET')
def show_report():
    json_data = request.params.data
    print(json_data)
    add_new_data(json.loads(json_data))
    return json.loads(json_data)


@route('/map')
def show_map():
    return template('assets/polyline.html')


def main():
    bottle.run(app=app)


if __name__ == '__main__':
    main()
