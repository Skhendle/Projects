# Covid Data
Configure variables in the .env file to run application in different environments.
Solution was built in on Linux debian

## Database Configurations
https://blog.miguelgrinberg.com/post/how-to-add-flask-migrate-to-an-existing-project

```bash
$ export FLASK_CONFIG="/home/sandile/Documents/Projects/Zenysis/backend/config.py"
$ flask db init
$ flask db migrate
$ flask db upgrade
```
### To run in terminal as process 
```bash
# Give bash script permission
$ chmod u+x runapp.sh
```

### To run application using Docker  
```bash
# Building Application image
$ docker image build -t pythonapp .

# Running application with out db service
$ docker run -p 5000:5000 -d pythonapp

# Running application with Postgres DB service 
$ docker-compose  up
```
