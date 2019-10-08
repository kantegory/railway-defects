import smtplib
from .db_manage import critical_parameter_select, parameter_select_by_date, parameter_add
import json
import datetime
import matplotlib.pyplot as plt


def add_new_data(json_data):
    print(type(json_data))
    json_data = json_data['data']

    for point in json_data:
        parameter_add(point)


def create_report_by_date(date):
    data = {'time': date}
    report_parameters = parameter_select_by_date(data)
    print('this', report_parameters)
    return report_parameters


def mark_points(report_parameters):

    marked_points = []
    critical_middle = critical_parameter_select([{'type': 'middle'}])[0]['acceleration']
    critical_high = critical_parameter_select([{'type': 'high'}])[0]['acceleration']

    for parameter in report_parameters:

        acceleration = parameter['acceleration']
        mark = 'good'

        if acceleration < critical_middle:
            mark = 'good'

        elif critical_middle < acceleration < critical_high or acceleration > critical_high:
            mark = 'bad'

        marked_point = {
            'longitude': parameter['coordinate']['longitude'],
            'latitude': parameter['coordinate']['latitude'],
            'acceleration': parameter['acceleration'],
            'time': parameter['time'],
            'mark': mark
        }

        marked_points.append(marked_point)

    return marked_points


def paint_plot(points):
    pass


def send_email_func(msg):
    email_sender = 'rzhd_info@mail.ru'
    email_receiver = 'receiver_1234@mail.ru'

    connection = smtplib.SMTP_SSL('smtp.mail.ru', 465)

    connection.login(email_sender, 'strong_password')
    connection.sendmail(email_sender, email_receiver, msg)

    connection.quit()
msg = 'Hi! this email is from python...'
send_email_func(msg)

# HardCode
area = 0.01
example = [[1.0, 1.2, 10], [1.0001, 1.2001, 10], [100, 120, 10]]


def clusterize():
    clusters = list()
    parameters = example
    parameters = sorted(parameters, key = lambda x: x[0])
    for i in range(len(parameters)):
        count = 0
        clusters.append([parameters[i][0], parameters[i][1], 0])
        for j in range(i + 1, len(parameters)):
            if (parameters[i][0] + area < parameters[j][0]):
                break
            if (parameters[i][1] + area < parameters[j][1]):
                continue
            count += 1
        clusters[i][2] = count

    print(clusters)


clusterize()


def get_date_from_request(request_params):

    date = request_params.date if request_params.date else datetime.datetime.now().strftime('%Y-%m-%d')
    date = date.split('-')
    date = '{}.{}.{}'.format(date[2], date[1], date[0])

    return date
