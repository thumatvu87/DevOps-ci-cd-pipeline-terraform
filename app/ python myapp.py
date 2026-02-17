# app.py
from flask import Flask
import logging

app = Flask(__name__)

@app.route("/")
def home():
    app.logger.info("Home endpoint was reached.")
    return "Hello from CI/CD pipeline!"

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    app.run(host='0.0.0.0', port=5000)
