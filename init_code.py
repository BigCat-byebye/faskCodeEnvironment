#!/usr/bin/python3

import os

### 容器环境初始化
## 设置git信息
def setGitInfo():
    if os.getenv("GIT_USEREMAIL") and os.getenv("GIT_USERNAME"):
        os.system("git config --global user.email {}".format(os.getenv("GIT_USEREMAIL")))
        os.system("git config --global user.name {}".format(os.getenv("GIT_USERNAME")))

## 设置ssh账户密码
def changePass():
    os.system("echo {}:{} | chpasswd".format(os.getenv("CODE_USERNAME"), os.getenv("CODE_PASSWORD")))

setGitInfo()
changePass()