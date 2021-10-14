# Exploring Grafana Loki & Tempo

## Setup

To handle shipping logs from docker, we need to install a docker plugin:
```sh
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

Once that's done, we can simple bring up the services:
```
docker-compose up -d
```

Once that's up you should be able to access the following services:  
* __The swagger documentation for the application:__  
http://localhost:5000/swagger  
* __Grafana__:  
http://localhost:3000/

After executing a call to the `/WeatherForecast` using the swagger docs, you should be able to see some logs in [grafana](http://localhost:3000/explore?orgId=1&left=%5B%22now-1h%22,%22now%22,%22Loki%22,%7B%22expr%22:%22%7Bcompose_project%3D%5C%22loki-tempo-dotnet%5C%22%7D%22%7D%5D). If you expand the `	
Getting weather forecast traceID=...` log, you should be able to click on a `Tempo` button to view the associated trace.

## ToDo
Currently, although a button appears on the trace span to view `Logs for this span`, this doesn't work. I assume there is some configuration on the Data Source that is required.



