# elk-docker-vagrant

## Description

just a ELK (<b>elasticsearch</b>, <b>redis</b>, <b>logstash</b>) pulled by <b>docker</b> in a <b>vagrant</b> for development/testing

<b>version will be updated based on docker image</b>

## Before RUN it

<a href="https://www.virtualbox.org/wiki/Downloads">virtualbox</a>, <a href="https://www.vagrantup.com/downloads.html">vagrant</a> are needed 

## File Structure

<b>esdata/</b> 			data stored for elasticsearch
			 
<b>logstash_conf/</b> 		shipper.conf and index.conf for logstashs

<b>sample_log/</b> 		log data file

## Configuration

#####Vagrantfile

###### mount folder (not suggested to change it since the paths are used in docker as well)

	config.vm.synced_folder "logstash_conf", "/home/logstash_conf"
  
	config.vm.synced_folder "sample_log", "/home/sample_log"
  
	config.vm.synced_folder "esdata", "/home/esdata"

## start the vagrant

> vagrant up

## After RUN it

http://localhost:5601/   kibana index page

http://localhost:9200/  elasticsearch welcome page
