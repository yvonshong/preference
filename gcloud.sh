#  https://cloud.google.com/sdk/docs/install?hl=zh-cn
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh # 如需将 gcloud CLI 添加到您的 PATH 并启用命令补全功能，请在出现提示时回答 Y。
./google-cloud-sdk/bin/gcloud init

