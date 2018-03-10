# Docker container for Dasher

Docker image for [Dasher](https://github.com/maddox/dasher) which can be used to bridge your Amazon Dash buttons to HTTP services.

To build the image, run the following:

```
docker build -t <image_name> .
```

To successfully setup your Docker container and run it, you'll need a configuration file. Create the configuration file in `<local_config_dir>/config.json`.

You can use the following example configuration or create one by following [the official instructions](https://github.com/maddox/dasher):

```
{"buttons":[
  {
    "name": "Amazon Dash Button (debug)",
    "address": "01:23:ab:c4:de:56",
    "debug": true
  }
]}
```

Now run it:

```
docker run -d \
  -v <local_config_dir>:/root/dasher/config \
  --net host \
  --hostname dasher \
  --name dasher <image_name>
```

Profit.
