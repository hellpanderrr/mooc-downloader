import sys
from bottle import static_file
from json import dumps
from bottle import route, run, template,post,request,get
import edx_dl

@get('/<filename:re:.*\.js>')
def javascripts(filename):
    return static_file(filename,  root='static/js')

@get('/<filename:re:.*\.css>')
def stylesheets(filename):
    return static_file(filename, root='static/css')

@get('/<filename:re:.*\.(jpg|png|gif|ico)>')
def images(filename):
    return static_file(filename, root='static/img')

@get('/<filename:re:.*\.(eot|ttf|woff|svg)>')
def fonts(filename):
    return static_file(filename, root='static/fonts')
@route('/index')
def index():
    return template('template')
@post('/hello/123')
def test():
    req =  request.json
    print req
    courses = edx_dl.main([req['email'], req['password'], req['platform']])
    courses = {n:[i[0],i[1],i[2]] for n,i in enumerate(courses)}
    return dumps(courses)
@post('/hello/<id>')
def process(id):
    print id
run(host='localhost', port=8080,reloader=True,debug=True)
