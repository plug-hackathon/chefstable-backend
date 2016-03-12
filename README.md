## Deploy to production

### Regular deployment



### Build production image if it has changed


Create a file `./deploy_env` and set production secrets and configurations

```bash
# Example ./deploy_env


SECRET_KEY_BASE=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Twilio account
TWILIO_AUTH_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
TWILIO_ACCOUNT_SID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
TWILIO_NUMBER="+46000000000"

# Mailgun auth
MAILGUN_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

DOCKER_MACHINE_PRODUCTION_NAME=chefstable_prod
```

Now, just run `bin/deploy` and wait for it to complete

### Initial deployment to new server

Start by tell docker to use the correct environment

Example `eval "$(docker-machine env the_new_chefstable_server)"`

#### Setup database containers

Create a docker container to store the database data

```bash
docker create -v /var/lib/postgresql/data --name db-data postgres:9.5 /bin/true
```

Create the database server

```bash
docker run -d --name db-server --volumes-from db-data postgres:9.5
```

#### Setup the production rails container

```bash
source deploy_env

docker run -d --name rails-server \
  --link db-server \
  -p 80:80 \
  -e SECRET_KEY_BASE=$SECRET_KEY_BASE \
  -e TWILIO_AUTH_TOKEN=$TWILIO_AUTH_TOKEN \
  -e TWILIO_ACCOUNT_SID=$TWILIO_ACCOUNT_SID \
  -e TWILIO_NUMBER=$TWILIO_NUMBER \
  -e MAILGUN_API_KEY=$MAILGUN_API_KEY \
  chefstable/rails-server
```

You may also need to run

```bash
docker exec rails-server rake db:create  # If database is not yet created
docker exec rails-server rake db:migrate # If database needs to be migrated
```
