# oathtool
A fork of these [scripts](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/) used for oathtool OTP in CLI.<br>
Author: [Vivek Gite](https://www.cyberciti.biz/) under GPL.<br>
## Instructions:
1. Install the required dependencies.
```
sudo apt update && sudo apt upgrade
sudo apt install oathtool gnupg2 xclip
```
2. Make the required directories.
```
mkdir -m 700 ~/.2fa/
cd ~/.2fa/
```
3. Generate gpg2 keys or use your preexisting keys.
```
gpg2 --full-gen-key
gpg --list-secret-keys --keyid-format LONG
```
4. Place the scripts inside ~/.2fa/ and edit the scripts to include your KID and UID.
5. Execute add.key.sh to add new services.
```
./add.key.sh
Service name: example.com
TOTP secret: xxxxxxxxxxxxxxxx
```
6. Encrypt the TOTP secret key with gpg. Make sure to remove the regular file (example.com/.key) when prompted.
```
./encrypt.key.sh example.com
```
7. Run decrypt.key.sh to decrypt the key and generate the two-factor authentication code.
```
./decrypt.key.sh example.com
```
