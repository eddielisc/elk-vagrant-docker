sudo yum -y update
sudo yum install -y docker
sudo systemctl enable docker.service
sudo systemctl start docker
sudo service docker start
sudo docker run -d -p 9200:9200 -v "/home/esdata":/usr/share/elasticsearch/data --name elasticsearch --restart always elasticsearch
sudo docker run --link elasticsearch:elasticsearch -d -p 5601:5601  --name kibana --restart always kibana
sudo docker run --name redis -p 6379:6379 -d --restart always redis
sudo docker run -d --restart always --name shipper -p 9600:9600 --link redis:redis -v "/home/logstash_conf":/config-dir  -v "/home/sample_log":/home/sample_log logstash -f /config-dir/shipper.conf
sudo docker run -d --restart always --name indexer -p 9601:9600 --link redis:redis --link elasticsearch:elasticsearch -v "/home/logstash_conf":/config-dir logstash -f /config-dir/indexer.conf