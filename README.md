# sentry（smtp发送+钉钉机器人）

官方sentry版本修复smtp邮件发送失败问题
可使用dockerfile自行build
也可以使用registry.cn-hangzhou.aliyuncs.com/abm-ops/dc-sentry提供的镜像 latest等版本

# 1、由于sentry的发邮件是异步操作,记得同时修改sentry-deployment和sentry-worker-deployment中的镜像地址
# 2、增加钉钉机器人插件

需要在环境变量中新增:
SENTRY_SERVER_EMAIL

SENTRY_EMAIL_HOST

SENTRY_EMAIL_USER

SENTRY_EMAIL_PASSWORD

SENTRY_EMAIL_PORT

SENTRY_EMAIL_USE_TLS

