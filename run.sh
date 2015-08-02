docker run -it -d --name gitlab -v /var/data/gitlab:/var/opt/gitlab -v /var/log/gitlab:/var/log/gitlab -p 10080:80 -p 10022:22  docker-mongodb
