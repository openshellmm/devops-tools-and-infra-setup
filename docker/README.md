
- ကျွန်တော် ဒီ post လေးမှာတော့   beginner တွေအတွက်  `Ubuntu 20.04 LTS`, `Ubuntu 24.04 LTS`  Server/Desktop version ပေါ်မှာ docker install ပြုလုပ်ပုံကို လေ့လာလို့ရအောင် case study အနေနဲ့ ပြောပြပေးထားပါတယ်။
- နားလည်ပြီးသားသူတွေအနေနဲ့ ကတော့ အောက်ဆုံးမှာ `docker-setup.sh` script ကို အသုံးပြုလို့ရအောင် ထည့်ပေးထားပါတယ်။


## Update package manager repositories

- အရင်ဆုံး apt package manager ရဲ့ repository update ပြုလုပ်ရပါမယ်။ 

```bash
sudo apt-get update -y
```


## Install necessary dependencies

- လိုအပ်တဲ့ packages တွေနဲ့ သူတို့ရဲ့ dependencies တွေကို ထပ်er အနေနဲ့ `docker ps -a ` command အသုံးပြုကြည့်မယ်ဆို အောက်ပါ permission ကို တွေ့ရမှာ ဖြစ်ပါတယ်။ 

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


