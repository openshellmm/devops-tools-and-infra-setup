

- ကျွန်တော် ဒီ post လေးမှာ  beginner တွေအတွက် `Ubuntu 24.04 LTS`  ပေါ်မှာ docker install ပြုလုပ်ပုံကို လေ့လာလို့ရအောင် case study အနေနဲ့ ပြောပြပေးထားပါတယ်။
- နားလည်ပြီးသားသူတွေအနေနဲ့ ကတော့ အောက်ဆုံးမှာ `docker-setup.sh` script ကို အသုံးပြုလို့ရအောင် ထည့်ပေးထားပါတယ်။


## Update package manager repositories

- အရင်ဆုံး apt package manager ရဲ့ repository update ပြုလုပ်ရပါမယ်။ 

```bash
sudo apt-get update -y
```


## Install necessary dependencies

- လိုအပ်တဲ့ packages တွေနဲ့ သူတို့ရဲ့ dependencies တွေကို ထပ်မံ install ပြုလုပ်ပါမယ်။

```bas
fficial stable repository ကို အပေါက်က gpg key ကို အသုံးပြုပြီး signed ပြုလုပ်ကာ apt repo sources directory ကို ထည့်ပါမယ်။

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```


## Update package manager repositories

- `/etc/apt/sources.d` directory အောက်မှာ `docker.list` file name နဲ့ docker ရဲ့ official repo address ကို ထည့်ပြီးဆိုတော့ apt package manager ကို အသုံးပြုပြီး docker ရဲ့ repository က နေ update to date package information ကို `sudo apt update -y ` command ကို အသုံးပြုပြီး download ပြုလုပ်ပါမယ်။

```bash
sudo apt-get update
```

## Install Docker Packages

- update ပြုလုပ်ပြီးသွားရင်တော့ လိုအပ်တဲ့ docker packages တွေကို စတင် install ပြုလုပ်လို့ ရပါပြီ။

```bash

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- ပြီးသွားရင်တော့ docker ကို successfully installed ပြုလုပ်ပြီးသွားပြဖြစ်ဖြစ်ပါတယ်။



## Check Docke Service Status

- `sudo systemctl status docker.service` command ကို အသုံးပြုပြီး`docker` service run / မ run ကို verify ပြုလုပ်ကြည့်ပါမယ်။

```bash
sysadmin@OpenShellMM:~$ sudo systemctl status docker.service
[sudo] password for sysadmin:
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enab


ssion ကို တွေ့ရမှာ ဖြစ်ပါတယ်။ 

```bash

sysadmin@OpenShellMM:~$ docker ps -a
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.46/containers/json?all=1": dial unix /var/run/docker.sock: connect: permission denied

```

- လက်ရှိ user access အနေနဲ့ `sudo` command ကို အသုံးပြုပြီး root privileges နဲ့ အသုံးပြုမှဘဲ ရနိုင်သေးတာဖြစ်ပါတယ်။ 

```bash
sysadmin@OpenShellMM:~$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                PORTS   NAMES
```

- ဒါကြောင့် ကိုယ်လက်ရှိအသုံးပြုနေတဲ့ user အနေနဲ့ docker command ကို `sudo` access မလုပ်ပဲ အသုံးပြုချင်တဲ့ဆိုရင် docker group ထဲကို ကိုယ်လက်ရှိအသုံးပြုနေတဲ့ login account ကို docker group ထဲ ကို ထည့်ပေးရမှာ  ဖြစ်ပါတယ်။ 

## Add Current User to Docker Group

- အောက်ပါ command ကို အသုံးပြုပြီး docker group ကို ထည့်ပေးနိုင်ပါမယ်။ 

```bash
sudo usermod -aG docker $(whoami)
```

- ထည့်ပြီးသွားပြီ ဆိုရင်တော့ shell ကို logout and login ပြုလုပ်ပြီး docker command `sudo` access မလိုဘဲ အသုံးပြုလို့ ရပြီ ဖြစ်ပါတယ်။

```bash
sysadmin@OpenShellMM:~$  docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                PORTS   NAMES
```

- အခုအတိုင်းဆိုရင်တော့ ကိုယ့်ရဲ့ ubuntu server ပေါက်မှာ docker service ကို successfully installed ပြုလုပ်ပြီးသွားပြီ ဖြစ်ပါတယ်။ 


## Docker Install Script for Ubuntu 24.04 LTS

[docker-setup.sh](https://github.com/openshellmm/devops-tools-and-infra-setup/blob/main/docker/docker-setup.sh)


###  Install docker

- အောက်ပါ command ကို အသုံးပြုပြီး Ubuntu `20.04 LTS` , `24.04 LTS` စတဲ့ version တွေမှာ docker ကို အလွယ် install ပြုလုပ်နိုင်ပါတယ်။ အဆုံးထိ ဖတ်ပေးတဲ့ ကျေးဇူးတင်ပါတယ်။ အဆင် ပြေကြပါစေဗျာ။

```bash
curl -fsSL https://raw.githubusercontent.com/openshellmm/devops-tools-and-infra-setup/main/docker/docker-setup.sh | bash
```

m ကျွန်တော် ဒီ post လေးမှာ  beginner တွေအတွက် `Ubuntu 24.04 LTS`  ပေါ်မှာ docker install ပြုလုပ်ပုံကို လေ့လာလို့ရအောင် case study အနေနဲ့ ပြောပြပေးထားပါတယ်။
- နားလည်ပြီးသားသူတွေအနေနဲ့ ကတော့ အောက်ဆုံးမှာ `docker-setup.sh` script ကို အသုံးပြုလို့ရအောင် ထည့်ပေးထားပါတယ်။


## Update package manager repositories

- အရင်ဆုံး apt package manager ရဲ့ repository update ပြုလုပ်ရပါမယ်။ 

```bash
sudo apt-get update -y
```


## Install necessary dependencies

- လိုအပ်တဲ့ packages တွေနဲ့ သူတို့ရဲ့ dependencies တွေကို ထပ်မံ install ပြုလုပ်ပါမယ်။

```bash
sudo
fficial stable repository ကို အပေါက်က gpg key ကို အသုံးပြုပြီး signed ပြုလုပ်ကာ apt repo sources directory ကို ထည့်ပါမယ်။

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```


## Update package manager repositories

- `/etc/apt/sources.d` directory အောက်မှာ `docker.list` file name နဲ့ docker ရဲ့ official repo address ကို ထည့်ပြီးဆိုတော့ apt package manager ကို အသုံးပြုပြီး docker ရဲ့ repository က နေ update to date package information ကို `sudo apt update -y ` command ကို အသုံးပြုပြီး download ပြုလုပ်ပါမယ်။

```bash
sudo apt-get update
```

## Install Docker Packages

- update ပြုလုပ်ပြီးသွားရင်တော့ လိုအပ်တဲ့ docker packages တွေကို စတင် install ပြုလုပ်လို့ ရပါပြီ။

```bash

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- ပြီးသွားရင်တော့ docker ကို successfully installed ပြုလုပ်ပြီးသွားပြဖြစ်ဖြစ်ပါတယ်။



## Check Docke Service Status

- `sudo systemctl status docker.service` command ကို အသုံးပြုပြီး`docker` service run / မ run ကို verify ပြုလုပ်ကြည့်ပါမယ်။

```bash
sysadmin@OpenShellMM:~$ sudo systemctl status docker.service
[sudo] password for sysadmin:
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
 
# SetUm SonarQube
