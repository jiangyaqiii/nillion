apt update
apt install -y sudo curl
curl -fssl https://get.docker.com | bash -s docker
sudo service docker start
docker pull nillion/verifier:v1.0.1

cd
mkdir -p nillion/accuser
docker run -v ./nillion/accuser:/var/tmp nillion/verifier:v1.0.1 initialise
