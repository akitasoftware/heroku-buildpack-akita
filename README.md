Heroku Buildpack integration.

# How to Use

## 1. Add your Akita API key ID and secret as configuration variables in Heroku.

```shell
heroku config:add AKITA_API_KEY_ID={KEY_ID}
heroku config:add AKITA_API_KEY_SECRET={KEY_SECRET}
```

## 2. Add this buildpack to Heroku

It may appear anywhere in the list. This buildpack downloads a statically compiled 
release of the Akita CLI and installs it in your app, but does not configured
it to automatically run.

```shell
heroku buildpacks:add --index 1 \
  https://github.com/akitasoftware/heroku-buildpack-akita.git
```

## 3. Add the Akita CLI in daemon mode as a worker

Edit your Heroku Procfile to add the Akita CLI:

```
worker: bin/akita daemon --name <name>
```

Choose a name for the daemon that will help you identify it on the Akita web console.

The Daemon listens for traffic on port 50080 by default. You can choose a different
port with the `--port` command line flag. This port is not visible outside of the
Heroku dyno. 

## 4. Configure your application to use Akita middleware

The Akita CLI cannot perform packet captures in a Heroku Dyno, because it lacks root
access.  Instead, your application must use middleware to capture requests and responses,
and send them to the Akita daemon for upload.

## 5. Start traces from the Akita web console

After building and deploying your Heroku app, you can start traces at any time via
the Akita web console.  See https://docs.akita.software/docs/django-on-heroku for an 
Example.


