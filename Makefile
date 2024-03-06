TF_DEPLOYMENT_ENVIRONMENT := prod
TF_PLAN := ../tfplan/tfplan

tf-init:
	terraform -chdir=$(CURDIR)/terraform init -backend-config="bucket=$$TF_BACKEND_BUCKET" -backend-config="region=$$TF_BACKEND_REGION" -backend-config="dynamodb_table=$$TF_BACKEND_DYNAMODB_TABLE"
tf-init-refresh:
	terraform -chdir=$(CURDIR)/terraform init -backend-config="bucket=$$TF_BACKEND_BUCKET" -backend-config="region=$$TF_BACKEND_REGION" -backend-config="dynamodb_table=$$TF_BACKEND_DYNAMODB_TABLE" -backend=false
tf-plan:
	terraform -chdir=$(CURDIR)/terraform plan -var="aws_region=$$TF_BACKEND_REGION" -out=$(TF_PLAN)
tf-plan-destroy:
	terraform -chdir=$(CURDIR)/terraform plan -var="aws_region=$$TF_BACKEND_REGION" -out=$(TF_PLAN) -destroy
tf-apply:
	terraform -chdir=$(CURDIR)/terraform apply $(TF_PLAN) 
tf-fmt:
	terraform -chdir=$(CURDIR)/terraform fmt -recursive
