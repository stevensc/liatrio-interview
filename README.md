# liatrio-interview

|Tools & Languages used|
|----------------------|
|           Spring Boot|
|                JRE 17|
|        Github Actions|
|       Terraform Cloud|
|     Artifact Registry|
|         GKE Autopilot|

## Prerequisites
In order to run this, you will need to have a Terraform Cloud and GCP account already created.  
Any references to the accounts used in this project will need to be replaced.  
In addition, a service account created in GCP with the Owner role will need to be created.  
Create a json auth key for the service account and save the key as a secret to Terraform Cloud and Github.  
I used variables "gcp_credentials" and "TF_API_TOKEN" respectivly. This key will be used for Terraform Cloud and Github to authenticate to GCP.  

Other variables are also stored in Terraform Cloud Variable Sets and Github Actions variables.  
These can be moved to other locations like a variables file in Terraform. 

## Deploying
If running from this repository, all that will be needed is to create a new pull request to the "main" branch with your changes.  This will trigger the TF run and Github action.

## Cleanup
Issuing a Destroy Plan through Terraform Cloud should destroy all resources created in GCP. Deleting the GCP account should cleanup the rest. The rest would be to delete the Github repositroy.
