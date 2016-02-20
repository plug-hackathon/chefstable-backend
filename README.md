## Deploy to production

### Build production image if it has changed

Build

```bash
docker build -t chefstable/rails-server -f ./Dockerfile.production .
```

Push to docker repo

```bash
docker push chefstable/rails-server
```

### Setup database containers

Create a docker container to store the database data

```bash
docker create -v /var/lib/postgresql/data --name db-data postgres:9.5 /bin/true
```

Create the database server

```bash
docker run -d --name db-server --volumes-from db-data postgres:9.5
```

### Setup the production rails container

```bash
docker run -d --name rails-server --link db-server -p 80:80 -e SECRET_KEY_BASE=`rake secret` chefstable/rails-server
```

You may need to run

```bash
docker exec rails-server rake db:create  # If this is the first deployment of your stack
docker exec rails-server rake db:migrate # If database needs to be migrated
```

