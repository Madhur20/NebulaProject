from flask import Flask, jsonify
from pathlib import Path
import requests
import json
import re
import pickle
from flask_cors import CORS


app = Flask(__name__)
CORS(app)
RateMyProfURL = "https://www.ratemyprofessors.com/search/teachers?query="
users = {}


@app.route('/getProfessordetails/<name>', methods=['GET'])
def getproff(name):
    r = requests.get(RateMyProfURL+name+"&sid=U2Nob29sLTEyNzM=")
    value = r.text.split("<script>\n          window.__RELAY_STORE__ = ")
    value = value[1].split("window.process = ")
    value = value[0][:-12]
    keyVal = value.split("\"node\":{\"__ref\":\"")[1].split("\"")[0]

    print(value.split("\"node\":{\"__ref\":\"")[1].split("\"")[0])

    jsonObj = json.loads(value)
    print(jsonObj[keyVal]["avgRating"])

    return jsonObj[keyVal]


@app.route('/login/email=<email>/password=<password>', methods=['GET'])
def login(email, password):
    if email in users.keys():
        print(users[email]["password"])
        if users[email]["password"] == password:
            print("returning true")
            return jsonify({"auth": True, "data": users[email]})

    print("returning false")
    return jsonify({"auth": False})


@app.route('/register/name=<name>/email=<email>/password=<password>', methods=['GET'])
def register(name,  email, password):
    if email in users.keys():
        return jsonify({"auth": False})
    users[email] = {"name": name, "email": email, "password": password}
    pickle.dump(users, open('users.p', 'wb'))
    return jsonify({"auth": True})


@app.route('/courseInfo/prefix=<prefix>/number=<number>', methods=['GET'])
def courseInfo(prefix,  number):

    return jsonify({
        "course_number": "6363",
        "grading": "grading",
        "corequisites": {
            "name": "name",
            "options": [{}, {}],
            "required": 0
        },
        "description": "CS 6363 Design and Analysis of Computer Algorithms (3 semester credit hours) The study of efficient algorithms for various computational problems. Algorithm design techniques. Sorting, manipulation of data structures, graphs, matrix multiplication, and pattern matching. Complexity of algorithms, lower bounds, NP completeness. Prerequisites: CS 5333 and CS 5343. (3-0) S",
        "internal_course_number": "internal_course_number",
        "laboratory_contact_hours": "laboratory_contact_hours",
        "title": "DESIGN & ANALYS-COMP ALGORITHM",
        "offering_frequency": "offering_frequency",
        "prerequisites": {
            "name": "name",
            "options": [{}, {}],
            "required": 0
        },
        "subject_prefix": "CS",
        "class_level": "class_level",
        "school": "ECSS",
        "activity_type": "activity_type",
        "_id": "_id",
        "lecture_contact_hours": "lecture_contact_hours",
        "credit_hours": "3"
    })


@app.route('/sections/prefix=<prefix>/number=<number>/term=<term>', methods=['GET'])
def sectionInfo(prefix,  number, term):

    return jsonify({"details": [{
        "course_reference": "course_reference",
        "instruction_mode": "in-person",
        "internal_class_number": "internal_class_number",
        "syllabus_uri": "https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget",
        "section_corequisites": {
            "name": "name",
            "options": [{}, {}],
            "required": 0
        },
        "grade_distribution": [0, 0],
        "professors": ["Neeraj Gupta"],
        "meetings": [{
            "end_date": "end_date",
            "start_time": "11:00 AM",
            "modality": "modality",
            "meeting_days": ["Tuesday", "Friday"],
            "end_time": "12:45 PM",
            "location": {
                "map_uri": "map_uri",
                "building": "ECSS",
                "room": "2.402"
            },
            "start_date": "start_date"
        }, {
            "end_date": "end_date",
            "start_time": "start_time",
            "modality": "modality",
            "meeting_days": ["meeting_days", "meeting_days"],
            "end_time": "end_time",
            "location": {
                "map_uri": "map_uri",
                "building": "building",
                "room": "room"
            },
            "start_date": "start_date"
        }],
        "_id": "_id",
        "teaching_assistants": [{
            "role": "role",
            "last_name": "last_name",
            "first_name": "first_name",
            "email": "email"
        }, {
            "role": "role",
            "last_name": "last_name",
            "first_name": "first_name",
            "email": "email"
        }],
        "academic_session": {
            "end_date": "10/2/5",
            "name": "name",
            "start_date": "10/5/5"
        },
        "core_flags": ["020", "050"],
        "section_number": "003"
    }, {
        "course_reference": "course_reference",
        "instruction_mode": "in-person",
        "internal_class_number": "internal_class_number",
        "syllabus_uri": "https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget",
        "section_corequisites": {
            "name": "name",
            "options": [{}, {}],
            "required": 0
        },
        "grade_distribution": [0, 0],
        "professors": ["Neeraj Gupta"],
        "meetings": [{
            "end_date": "end_date",
            "start_time": "start_time",
            "modality": "modality",
            "meeting_days": ["Monday", "Wednesday"],
            "end_time": "end_time",
            "location": {
                "map_uri": "map_uri",
                "building": "building",
                "room": "room"
            },
            "start_date": "start_date"
        }, {
            "end_date": "end_date",
            "start_time": "start_time",
            "modality": "modality",
            "meeting_days": ["meeting_days", "meeting_days"],
            "end_time": "end_time",
            "location": {
                "map_uri": "map_uri",
                "building": "building",
                "room": "room"
            },
            "start_date": "start_date"
        }],
        "_id": "_id",
        "teaching_assistants": [{
            "role": "role",
            "last_name": "last_name",
            "first_name": "first_name",
            "email": "email"
        }, {
            "role": "role",
            "last_name": "last_name",
            "first_name": "first_name",
            "email": "email"
        }],
        "academic_session": {
            "end_date": "10/2/5",
            "name": "name",
            "start_date": "10/5/5"
        },
        "core_flags": ["020", "050"],
        "section_number": "003"
    }]})


if __name__ == "__main__":

    path = Path("user.p")
    if path.is_file():
        users = pickle.load(open('users.p', 'rb'))
    app.run(debug=True)
