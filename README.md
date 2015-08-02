# docker-gitlab

docker化gitlab

## 镜像特点

- 2015/8/2 继承基础镜像docker-ubuntu
- 2015/8/2 默认暴露22 80端口

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-gitlab.git
        cd docker-gitlab

- 获取gitlab-ce安装包

    gitlab-ce_7.13.2-ce.0 [ubuntu:14.04](https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_7.13.2-ce.0_amd64.deb/download)

  
- 构建代码

        docker build -t docker-gitlab .

- 运行容器[run.sh]

        docker run -it -d --name gitlab -v /var/data/gitlab:/var/opt/gitlab -v /var/log/gitlab:/var/log/gitlab -p 10080:80 -p 10022:22  docker-gitlab
