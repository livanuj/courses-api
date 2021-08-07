Technologies
- ruby 3.0.1
- Rails 6.1.4

For local setup:

Clone the repository with:

git clone git@github.com:livanuj/courses-api.git

make sure postgres is installed

Inside main folder:

- rails db:create --- to create database
- rails db:migrate --- to migrate database
- rails db:seed --- to seed default data
- rails s --- to start server at port 3000


Deployed at heroku:

BASE_URL = http://courses-api-anuj.herokuapp.com

OR

BASE_URL = http://localhost:3000

Endpoints:

- Index             -> GET ${BASE_URL}/api/v1/courses
- Index with filter -> GET ${BASE_URL}/api/v1/courses?filter[self-assignable]=true
- Show              -> GET ${BASE_URL}/api/v1/courses/:id
- Create            -> POST ${BASE_URL}/api/v1/courses
                     -d '{"data": {"type":"courses", "attributes":{"name":"Ruby on Rails Course", "self-assignable": true}, "relationships":{"coach": {"data":                                {"type": "coaches", "id": 1}}}}}'




