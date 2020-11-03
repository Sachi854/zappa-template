from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>貧乳はステータスだ！</h1>'

# Required for local debugging.
if __name__ == '__main__':
    app.run()