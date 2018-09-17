#Version: 1.0.0
#Essential tools and utilities post install

sudo apt install -y chromium-browser
cat <<EOF | sudo tee /etc/apt/sources.list.d/non-free.list
deb http://www.deb-multimedia.org stretch main non-free
EOF
wget -q ${URL}/deb-multimedia-keyring_2016.8.1_all.deb
sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb || \
  (sudo apt -f install -y && \
      sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb)
rm -f deb-multimedia-keyring_2016.8.1_all.deb
sudo apt update -y
sudo apt install -y flashplayer-chromium
