# SETUP RASPBERRY PI

## Hidden wifi

```sh
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=PT

network={
        scan_ssid=1
        ssid="Your Hidden SSID"
        psk="Your SSID's Password"
        key_mgmt=WPA-PSK
}
```

## Setup LCD Screen

sudo rm -rf LCD-show 

git clone https://github.com/goodtft/LCD-show.git 

chmod -R 755 LCD-show 

cd LCD-show/

sudo ./LCD35-show
