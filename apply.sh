export TF_VAR_public_key=

if [[ -z "${TF_VAR_public_key}" ]]; then
  echo "TF_VAR_public_key is not set. Please update apply.sh and set TF_VAR_public_key with your public key for EC2 keypair"
  exit 1
fi

export TERRAFORM_VERSION=0.12.29
export TERRAFORM_TEMP_FILE="/tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

wget -O ${TERRAFORM_TEMP_FILE} https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip -o ${TERRAFORM_TEMP_FILE} -d .
rm -f ${TERRAFORM_TEMP_FILE}
chmod +x ./terraform

./terraform init
./terraform apply -auto-approve