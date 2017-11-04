start:
	docker-compose up -d

stop:
	docker-compose stop

nuke: stop
	docker-compose down

config:
	@[ -e config.inc ] || ln -s config-dev.inc config.inc
	@[ -e docker-compose.yml ] || ln -s docker-compose-dev.yml docker-compose.yml

floors:
	floor-import/floor-import.sh

setup:  config
	docker-compose up -d elasticsearch kibana 
	@echo "Waiting 60s for Elasticsearch first-time startup..."
	@sleep 60
	@echo "Inserting metadata into Elasticsearch"
	@. ./config.inc
	for s in scripts/* ; do echo "Executing $$s"; $$s ; echo ""; done
	@echo "Starting logstash and filebeat to populate sample index"
	docker-compose up -d logstash filebeat
	@[ -d data ] || mkdir data
	@echo "First drop one or more CSV files into data/"
	@echo "Next open http://elastic:changeme@localhost:5601/ and configure index pattern sample-*"
