## My daily scripts
主要记录自己平时在ubuntu20.04 x86架构使用下，用到的一些脚本

- `basic_utils.sh`: 更换阿里源并安装一些基础工具
- `change.sh`: 更改一些主机配置， 修改主机名称， 关闭swap，防火墙等 `sudo ./change.sh hostname`



### maven

- `maven.sh` 安装maven环境， 会先安装java8




### k8s: k8s集群安装
**先安装docker 在进行kubernetes的安装**

- `docker_install.sh`: docker的安装，将本机所有docker配置全部删除 可以使用,`sudo ./docker_install.sh`
- `docker_office_install.sh`: docker 官方的安装， 感觉比上面的靠谱点？
- `remove_docker`从主机彻底删除docker
- `docker_updateVersion.sh` ：docker版本更新，（升级的话， 前面的删除步骤可以省略）
- `k8s_install.sh` 后面添加版本号，  `sudo ./k8s_install.sh 1.19.8` ， 不写的话默认1.19.8， （注意 kubernetes 1.20版本之后逐渐弃用docker）
- `k8s_gxrcio.sh` 更换国内，镜像， 加快速度



### docker_common：

一些常用的docker镜像：

- `dokcer_utils.sh` : 私有的镜像仓库
- `docker_gui` ： docker可视化工具




### zsh: 安装zsh， 并进行相应的配置(强烈案例这个shell， 太好用了)
- `zsh_downLoad.sh`: zsh的安装 `./zsh.sh`
- `zsh.sh` : 安装oh-my-zsh以及zsh的插件， 这里有两个（高亮以及自动补全） `./zsh.sh`



### ELK：

elk搭建（之前在centos上用的学长的， ubuntu的暂时没改）



