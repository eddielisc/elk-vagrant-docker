# elk-docker-vagrant

## Description

just a ELK (<b>elasticsearch</b>, <b>redis</b>, <b>logstash</b>) in a <b>vagrant</b> with <b>docker-compose</b> feature for development/testing

<b>version will be updated based on docker image</b>

## Before RUN it

<a href="https://www.virtualbox.org/wiki/Downloads">virtualbox</a>, <a href="https://www.vagrantup.com/downloads.html">vagrant</a> are needed

## File Structure

<b>esdata/</b> 			data stored for elasticsearch

<b>logstash_conf/</b> 		shipper.conf and index.conf for logstash

<b>sample_log/</b> 		log data file

## start the vagrant

> vagrant up

## After RUN it

http://localhost:5601/   kibana index page

http://localhost:9200/  elasticsearch welcome page
