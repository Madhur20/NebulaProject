from flask import Flask, jsonify
from pathlib import Path
import requests
import json
import re
import pickle
from flask_cors import CORS
import os
from dotenv import load_dotenv

load_dotenv()

NEBULA_KEY = os.getenv('NEBULA_API_KEY')
nebulaURL = "https://api.utdnebula.com/"
courseID = ""

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
    header = {'x-api-key': NEBULA_KEY}
    r = requests.get(nebulaURL+"course?subject_prefix=" +
                     prefix+"&course_number="+number, headers=header)
    jsonObj = r.json()
    courseID = jsonObj["data"][0]["_id"]
    print(courseID)
    return jsonObj["data"][0]


@app.route('/sections/course_reference=<courseID>', methods=['GET'])
def sectionInfo(courseID):
    header = {'x-api-key': NEBULA_KEY}
    r = requests.get(
        nebulaURL+"section/?academic_session.name=17F&course_reference="+courseID, headers=header)
    jsonObj = r.json()
    print(jsonObj)
    return jsonObj


# @app.route('/professor/<professorID>', methods=['GET'])
# def profInfo(professorID):
#     header = {'x-api-key': NEBULA_KEY}
#     r = requests.get(
#         nebulaURL+"professor/"+professorID, headers=header)
#     jsonObj = r.json()
#     print(jsonObj)
#     return jsonObj


if __name__ == "__main__":

    path = Path("user.p")
    if path.is_file():
        users = pickle.load(open('users.p', 'rb'))
    app.run(debug=True)
