## My daily scripts
主要记录自己平时在ubuntu20.04 x86架构使用下，用到的一些脚本

- `basic_utils.sh`: 更换阿里源并安装一些基础工具
- `change.sh`: 更改一些主机配置， 修改主机名称， 关闭swap，防火墙等 `sudo ./change.sh hostname`






### k8s: k8s集群安装
**先安装docker 在进行kubernetes的安装**

- `docker_install.sh`: docker的安装，将本机所有docker配置全部删除, 里面的版本为5:19.03.1亲测有效， 可以使用,`sudo ./docker_install.sh`
- `docker_office_install.sh`: docker 官方的安装， 感觉比上面的靠谱点？
- `k8s_install.sh` `sudo ./k8s_install.sh 1.18.6` 默认1.18.6也是版本（注意 kubernetes 1.20版本之后逐渐弃用docker）
- `k8s_gxrcio.sh` 更换国内，镜像， 加快速度






### zsh: 安装zsh， 并进行相应的配置(强烈案例这个shell， 太好用了)
- `zsh_downLoad.sh`: zsh的安装 `./zsh.sh`
- `zsh.sh` : 安装oh-my-zsh以及zsh的插件， 这里有两个（高亮以及自动补全） `./zsh.sh`
