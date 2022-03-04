# oathtool
A backup of these [scripts](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/) used for oathtool OTP in CLI.<br>
Author: [Vivek Gite](https://www.cyberciti.biz/) under GPL v 2.x or above <br>
## Instructions:
1. Install the required dependencies.
```
sudo apt update && sudo apt upgrade
sudo apt install oathtool gnupg2
```
2. Make the required directories.
```
mkdir ~/.2fa/
cd ~/.2fa/
```
3. Generate gpg2 keys, or use your preexisting keys.
```
gpg2 --full-gen-key
gpg --list-secret-keys --keyid-format LONG
```
4. Place the encrypt and decrypt scripts inside ~/.2fa/ and edit the scripts to include your KID and UID keys.
5. Create a service directory to host the TOTP secret key.
```
mkdir example.com
echo -n '<TOTP secret key>' > ~/.2fa/example.com/.key
```
6. Encrypt the TOTP secret key with gpg. Make sure to remove the regulare file (example.com/.key) when prompted.
```
./encrypt.key.sh example.com
```
7. Run decrypt.key.sh to decrypt the key and generate the 2fa code.
```
./decrypt.key.sh example.com
```
