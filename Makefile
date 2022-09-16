
deploy-test-production: deploy-production test-production 

deploy-production:
	ansible-playbook -i hosts.yaml deploy.yaml --extra-vars "target=production"

deploy-test-preprod: deploy-preprod test-preprod 

deploy-preprod:
	ansible-playbook -i hosts.yaml deploy.yaml --extra-vars "target=preprod"

deploy-test-all: deploy-all test-prod test-preprod

deploy-all:
	ansible-playbook -i hosts.yaml deploy.yaml --extra-vars "target=all"

test-prod: 
	curl http://10.0.0.11/

test-prod-db:
	curl http://10.0.0.11/test-db

test-preprod: 
	curl http://10.0.0.12/

test-preprod-db:
	curl http://10.0.0.12/test-db

show-tags:
	ansible-playbook -i hosts.yaml deploy.yaml --extra-vars "target=all" --list-tags