import flask
from flask import request, render_template
app = flask.Flask(__name__, template_folder="template")
app.config["DEBUG"] = True

from flask_cors import CORS
CORS(app)

# main index page route
@app.route('/')
def home():
    return render_template("index.html")


@app.route('/predict',methods=['GET'])
def predict():
    import joblib
    import os
    path = '/var/www/html/proj/crime_rate_prediction_model.ml'
    model = joblib.load(path)
    predicted_crime_rate = model.predict([[int(request.args['report_year']),
                            int(request.args['population']),
                            int(request.args['robberies']),
                        ]])
    return str(predicted_crime_rate)
    #return '<h1>Prdecting.....</h2>'


if __name__ == "__main__":
    app.run(debug=True)
