from .db import Parameters, Users, CriticalParameters, session
import datetime
import json
import numpy as np


def user_add(data):
    s = session()
    rows = s.query(Users).all()
    check = []
    for row in rows:
        check.append(row.email)
    for curr_row in data:
        if str(curr_row["email"]) not in check:
            users = Users(
                full_name=curr_row["full_name"],
                email=curr_row["email"],
                password=curr_row["password"]
            )
            s.add(users)
    s.commit()


def parameter_add(data):
    s = session()

    s.add(Parameters(
        longitude=float(data["coordinate"]["longitude"]),
        latitude=float(data["coordinate"]["latitude"]),
        acceleration=float(data["acceleration"]),
        time=datetime.datetime.fromtimestamp(data["time"]).strftime("%d.%m.%Y")
        ))
    s.commit()


def critical_parameter_add(data):
    s = session()
    parameters = CriticalParameters(
        acceleration=data["acceleration"],
        type=data["type"]
    )
    s.add(parameters)
    s.commit()


def critical_parameter_update(data):

    s = session()

    for parameter in data:
        print(parameter)
        check = len(critical_parameter_select(parameter))
        print(check)
        if check == 0:
            print('checked')
            critical_parameter_add(parameter)
        else:
            s.query(CriticalParameters).filter(CriticalParameters.type == parameter["type"]).update({"acceleration": parameter["acceleration"]})
            s.commit()


def user_auth(data):
    s = session()
    rows = s.query(Users).filter(Users.email == data["email"] and Users.password == data["password"]).all()
    auth = True if rows else False
    return auth


def unique(arr):
    arr = np.array(arr)
    return np.unique(arr)


def get_last_date(arr):
    arr = unique(arr)
    last_date = arr[-1]

    return last_date


def parameter_select_by_date(data):
    s = session()

    rows = s.query(Parameters).filter(Parameters.time == data["time"]).all()

    if len(rows) == 0:

        dates_arr = s.query(Parameters).filter(Parameters.time).all()
        dates_arr = [dates_arr[i].time for i in range(len(dates_arr))]
        last_date = get_last_date(dates_arr)

        rows = s.query(Parameters).filter(Parameters.time == last_date).all()

    result = [
        {
            "longitude": rows[i].longitude,
            "latitude": rows[i].latitude,
            "acceleration": rows[i].acceleration,
            "time": rows[i].time
        }
        for i in range(len(rows))
    ]
    return json.dumps(result)


def critical_parameter_select(data):
    s = session()
    rows = s.query(CriticalParameters).filter(CriticalParameters.type == data["type"]).all()
    result = {
        "acceleration": rows[0].acceleration
    }
    return result
