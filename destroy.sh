export TF_VAR_public_key=

if [[ -z "${TF_VAR_public_key}" ]]; then
  echo "TF_VAR_public_key is not set. Please update destroy.sh and set TF_VAR_public_key with your public key for EC2 keypair"
  exit 1
fi

./terraform destroy