#Version: 1.0.0
#Essential tools and utilities post install

# 1.Install Chromium and Chromium flashplayer
sudo apt install -y chromium-browser
cat <<EOF | sudo tee /etc/apt/sources.list.d/non-free.list
deb http://www.deb-multimedia.org stretch main non-free
EOF
URL=http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/
wget -q ${URL}/deb-multimedia-keyring_2016.8.1_all.deb
sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb || \
  (sudo apt -f install -y && \
      sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb)
rm -f deb-multimedia-keyring_2016.8.1_all.deb
sudo apt update -y
sudo apt install -y flashplayer-chromium

#Install SAP HANA monitoring agents for slackdriver monitoring in GCP

curl https://storage.googleapis.com/gcm-ext/gcm_install.sh | bash -x

#Additional Configuration required after Install
# In /etc/default/gcm following has to be setup depending on servers
# ---
# config:
#   timestamps_in_output: no
#   debug_messages: yes
#   skip_default_queries: yes
#   queries_directory: /tmp/tmp.kUbZiUaGHa/queries
#   spool_directory: /tmp/tmp.kUbZiUaGHa/staging
#   enabled_instances:
#     - [INSTANCE_NAME]
#   instances:
#     - name: [INSTANCE_NAME]
#       host: [INSTANCE_IP]
#       port: [PORT_NUMBER]
#       user: [DB_USERNAME]
#       password: [YOUR_PASSWORD]
#       type: [INSTANCE_TYPE]
#     - name: [INSTANCE_NAME_2]
#       host: [INSTANCE_IP_2]
