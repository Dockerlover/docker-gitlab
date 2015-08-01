# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID gitlab
# 安装相关依赖包
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
RUN apt-get install -y git-core ruby2.1 gitlab-ce nginx && rm -rf /var/lib/apt/lists/*
COPY gitlab.rb /etc/gitlab/gitlab.rb
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
