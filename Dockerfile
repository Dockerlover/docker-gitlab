# 基础镜像
FROM docker-ruby:2.2
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID gitlab
# 复制deb安装包
COPY gitlab-ce_7.13.2-ce.0_amd64.deb /var/install/gitlab/gitlab-ce.deb
# 安装gitlab-ce
RUN dpkg -i /var/install/gitlab/gitlab-ce.deb && rm -rf /var/install/gitlab/*
# 拷贝gitlab.rb
COPY gitlab.rb /etc/gitlab/gitlab.rb
# 默认暴露80端口和22端口
EXPOSE 80 22
# 挂载目录
VOLUME ["/etc/gitlab", "/var/opt/gitlab", "/var/log/gitlab"]
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
