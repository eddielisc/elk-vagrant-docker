# elk-docker-vagrant

## Description

just a ELK (<b>elasticsearch</b>, <b>logstash</b>, <b>kibana</b>, <b>redis</b>) in a <b>vagrant</b> with <b>docker-compose</b> feature for development/testing

<b>version will be updated based on docker image</b>

what in the vagrant box installed with docker & docker compose

logs files -> shipper -> redis - > indexer -> elasticsearch <- kibana

## Before RUN it

please install the followning

<a href="https://www.virtualbox.org/wiki/Downloads">virtualbox</a>

<a href="https://www.vagrantup.com/downloads.html">vagrant</a>

<a href="https://github.com/leighmcculloch/vagrant-docker-compose">vagrant docker compose</a>

## File Structure

| path	        	| description           				| 
| -----------------	|---------------------------------------| 
| logstash_conf     | config of logstash(indexer & shipper)      						|
| sample_log 		| log files       						|


## start the vagrant

> vagrant up

## view the vagrant

> vagrant ssh

> docker ps -a

```bash
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                              NAMES
f97a6f2a6853        logstash            "/docker-entrypoint.s"   About a minute ago   Up About a minute   0.0.0.0:9601->9600/tcp             vagrant_indexer_1
3c859162f460        kibana              "/docker-entrypoint.s"   About a minute ago   Up About a minute   0.0.0.0:5601->5601/tcp             vagrant_kibana_1
18592652c144        elasticsearch       "/docker-entrypoint.s"   About a minute ago   Up About a minute   0.0.0.0:9200->9200/tcp, 9300/tcp   vagrant_elasticsearch_1
c06e21c02c1c        logstash            "/docker-entrypoint.s"   10 minutes ago       Up About a minute   0.0.0.0:9600->9600/tcp             vagrant_shipper_1
1ced6396c037        redis               "docker-entrypoint.sh"   10 minutes ago       Up About a minute   0.0.0.0:6379->6379/tcp             vagrant_redis_1
```

## After RUN it

####kibana

http://localhost:5601/

####elasticsearch

http://localhost:9200/

1 log record should be able to store in elasticsearch and can view the sample json in follow link

http://localhost:9200/logstash-*/_search


####sample json

```javascript
{"took":9,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"logstash-2016.12.23","_type":"logs","_id":"75fa1b3824dd6e70989a1aac8112ec8ac7eddf83","_score":1.0,"_source":{"path":"/home/sample_log/hello.log","@timestamp":"2016-12-23T13:00:45.913Z","@uuid":"4f2907b2-fc3a-4e76-926c-74bcdf2adc8a","@version":"1","host":"c06e21c02c1c","fingerprint":"75fa1b3824dd6e70989a1aac8112ec8ac7eddf83","message":"hello, see it becoz u make it","tags":[]}}]}}
```


