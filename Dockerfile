# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID gitlab
# 安装相关依赖包
RUN apt-get update && apt-get install -y ruby2.0 && rm -rf /var/lib/apt/list/*
COPY gitlab-ce_7.13.2-ce.0_amd64.deb /var/install/gitlab/gitlab-ce.deb
RUN dpkg -i /var/install/gitlab/gitlab-ce.deb && rm -rf /var/install/gitlab/*
COPY gitlab.rb /etc/gitlab/gitlab.rb
RUN gem sources --remove https://rubygems.org/ && gem sources -a https://ruby.taobao.org/ && gem sources -l
EXPOSE 80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
