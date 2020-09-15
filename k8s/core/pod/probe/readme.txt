probe:是在主容器ready和running后开始进行检测的

probe(探针):是由kubelet对容器之执行的定期诊断,kubelet调用容器实现的
handler,有三种类型的处理程序:
  ExecAction: 在容器内执行指定命令,命令返回为0表示诊断成功
  TCPSocketAction: 对执行端口上的容器的ip地址进行tcp检查，如果端口打开，则诊断成功
  HTTPGetAction:对执行的端口和路径上的容器的ip地址执行HTTP get请求，如果相应的状态
  码大于等于200且小于400,则诊断成功



每次探测有三种结果:
1)成功:容器通过了诊断,为ready状态
2)失败:容器未通过了诊断,不为ready状态
3)未知:诊断失败，因此不会采取任何行动



探测分为两种：
  readinessProbe:指示容器是否准备好服务请求,如果探测失败，控制器将从与Pod匹配的所有Servie的端点中删除该Pod的ip地址,
  初始化之前的就绪状态默认为failure
  livenessProbe:指示容器是否正常运行,如果存在探测失败，则kubelet会杀死容器，重启将收到重启策略的影响,如果容器不提供livenessProbe,则默认状态为Success


