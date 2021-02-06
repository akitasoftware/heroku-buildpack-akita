Heroku Buildpack integration.

# How to Use

1. Configure your heroku project to:

    - Add Akita specific environment variables
    - Use this buildpack
    - Use the `apt` buildpack to install `libpcap` dependency.

```shell
# Enable dyno metadata so we can create a unique name for the trace collected on
# this instance of your app.
heroku labs:enable runtime-dyno-metadata -a $(heroku apps:info|grep ===|cut -d' ' -f2)

# apt buildpack to install dependencies
heroku buildpacks:add \
  --index 1 \
  heroku-community/apt

# This buildpack to install akita itself.
heroku buildpacks:add \
  --index 2 \
  https://github.com/akitasoftware/heroku-buildpack-akita.git

heroku config:add AKITA_API_KEY_ID={KEY_ID}
heroku config:add AKITA_API_KEY_SECRET={KEY_SECRET}
heroku config:add AKITA_SERVICE={SERVICE_NAME}
```

1. Add `Aptfile` to the root of your repo with the following content, which will
   be used by `apt` buildpack to install dependencies:

```
libpcap0.8
```
