from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# Database connection
def get_db_connection():
    connection = mysql.connector.connect(
        host='db',  # Container name of the MySQL service in Docker Compose
        user='root',
        password='password',
        database='flaskdb'
    )
    return connection

@app.route('/')
def home():
    return "Welcome to the Flask MySQL Docker App!"

@app.route('/users')
def get_users():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users;")
    users = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(users)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
