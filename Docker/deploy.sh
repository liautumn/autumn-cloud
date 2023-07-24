#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [ port | base | admin | nginx | stop | rm ]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=8887/tcp --permanent
	firewall-cmd --add-port=9997/tcp --permanent
	firewall-cmd --add-port=9999/tcp --permanent
	firewall-cmd --add-port=9001/tcp --permanent
	firewall-cmd --add-port=9000/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent
	firewall-cmd --add-port=6379/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=8808/tcp --permanent
	firewall-cmd --add-port=8088/tcp --permanent
	firewall-cmd --add-port=8081/tcp --permanent
	firewall-cmd --add-port=8082/tcp --permanent
	firewall-cmd --add-port=8083/tcp --permanent
	firewall-cmd --add-port=8084/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
	docker-compose up -d autumn-mysql autumn-redis autumn-nacos autumn-minio
}

admin(){
  system
  auth
  gateway
  file
  generate
  xxl-job
}

# 启动系统服务
system(){
  docker-compose stop autumn-system
  docker-compose rm -f autumn-system
  docker rmi -f autumn-system:latest
  docker-compose build autumn-system
	docker-compose up -d autumn-system
}

# 启动认证服务
auth(){
  docker-compose stop autumn-auth
  docker-compose rm -f autumn-auth
  docker rmi -f autumn-auth:latest
  docker-compose build autumn-auth
	docker-compose up -d autumn-auth
}

# 启动网关服务
gateway(){
  docker-compose stop autumn-gateway
  docker-compose rm -f autumn-gateway
  docker rmi -f autumn-gateway:latest
  docker-compose build autumn-gateway
	docker-compose up -d autumn-gateway
}

# 启动文件服务
file(){
  docker-compose stop autumn-file
  docker-compose rm -f autumn-file
  docker rmi -f autumn-file:latest
  docker-compose build autumn-file
	docker-compose up -d autumn-file
}

# 任务调度服务
xxl-job(){
  docker-compose stop autumn-xxl-job
  docker-compose rm -f autumn-xxl-job
  docker rmi -f autumn-xxl-job:latest
  docker-compose build autumn-xxl-job
	docker-compose up -d autumn-xxl-job
}

# 启动代码生成服务
generate(){
  docker-compose stop autumn-generate
  docker-compose rm -f autumn-generate
  docker rmi -f autumn-generate:latest
  docker-compose build autumn-generate
	docker-compose up -d autumn-generate
}

#启动前端
nginx(){
  docker-compose stop autumn-nginx
  docker-compose rm -f autumn-nginx
  docker rmi -f autumn-nginx:latest
  docker-compose build autumn-nginx
	docker-compose up -d autumn-nginx
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rm(){
	docker-compose rm
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"admin")
	admin
;;
"nginx")
	nginx
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
