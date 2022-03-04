# oathtool
A backup of the [scripts](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/), used for oathtool OTP.<br>

## Instructions:
1. Install the required dependencies.
```
sudo apt update && sudo apt upgrade
sudo apt install oathtool gnupg2
```
2. Generate gpg2 keys, or use your preexisting keys.
```
gpg2 --full-gen-key
gpg --list-secret-keys --keyid-format LONG
```
3. Make the required directories.
```
mkdir ~/.2fa/
cd ~/.2fa/
```
4. Place the encrypt and decrypt scripts inside ~/.2fa/
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
