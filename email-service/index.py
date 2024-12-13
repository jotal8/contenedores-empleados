from flask import Flask

helloworld = Flask(__name__)

@helloworld.route("/")
def run():
    return "Hello, World!"