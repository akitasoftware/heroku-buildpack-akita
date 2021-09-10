Heroku Buildpack integration.

# How to Use

## 1. Add your Akita API key ID and secret as configuration variables in Heroku.

```shell
heroku config:add AKITA_API_KEY_ID={KEY_ID}
heroku config:add AKITA_API_KEY_SECRET={KEY_SECRET}
```

Optionally, specify a daemon name and a port for it to listen to. The name of the 
Heroku dyno will be used as a suffix to the daemon name.

```shell
heroku config:add AKITA_DAEMON_PORT=50800
heroku config:add AKITA_DAEMON_NAME=heroku
```

## 2. Add this buildpack to Heroku

It may appear anywhere in the list. This buildpack downloads a statically compiled 
release of the Akita CLI and installs it in your app, and causes it to 
run automatically in daemon mode.

```shell
heroku buildpacks:add --index 1 \
  https://github.com/akitasoftware/heroku-buildpack-akita.git
```

## 3. Configure your application to use Akita middleware

The Akita CLI cannot perform packet captures in a Heroku Dyno, because it lacks root
access.  Instead, your application must use middleware to capture requests and responses,
and send them to the Akita daemon for upload.

 * Express.js middleware: https://github.com/akitasoftware/express-middleware 
 * Django middleware: https://github.com/akitasoftware/akita-django

## 4. Start traces from the Akita web console

After building and deploying your Heroku app, you can start traces at any time via
the Akita web console.  See https://docs.akita.software/docs/django-on-heroku for an 
example.


