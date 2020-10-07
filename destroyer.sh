cd live/prod/services/webserver-cluster
terraform destroy -lock=false
cd ../../
cd ./data-stores/mysql
terraform destroy -lock=false
cd ../../../
cd ./stage/services/webserver-cluster
terraform destroy -lock=false
cd ../../
cd ./data-stores/mysql
terraform destroy -lock=false