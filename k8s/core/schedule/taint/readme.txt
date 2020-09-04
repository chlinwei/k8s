污点(taint):可以给某个节点设置污点,某些pod无法容忍这个污点的话,就会执行污点的effect

污点组成如下：
Key=Value:effect


effect可选：
  Noschedule:表示k8s将不会将Pod调度到具有该污点的node上
  PreferNoSchedule:表示k8s将尽量避免将Pod调度到该具有污点的Node上
  NoExecute:表示k8s将不会将Pod调度到具有该污点的Node上，同时会将Node上已经存在的Pod删除(驱逐),如果是由deployment等控制的，肯定会在其他节点创建新的pod


查看节点污点:kubectl describe node master1



设置污点：
kubectl taint nodes master1 key1=value1:NoSchedule

去除污点(注意后面有个'-')：
kubectl taint nodes master1 key1:NoSchedule-
kubectl taint nodes master1 key1=value1:NoSchedule-


注意：master节点天生自带污点,可以去除




容忍(tolerations):就是可以容忍某个污点
pod.spec.tolerations
tolerations:
- key: k1
  operator: "Equal"
  value: v1
  effect: NoSchedule
  tolerationSeconds: 3600




想要容忍某个污点,key,value,effect要和Node上的污点一致
operator的值为Exists将会忽略value的值,即key,effect一样就可以容忍
tolerationSeconds:描述当Pod需要被删除(驱逐)时可以在Pod上继续保持运行的时间
  
特殊：
1.当不指定key值时,表示容忍所有的污点key
tolerations:
- operator: "Exists"

2.当不指定effect值时,表示容忍所有污点作用
tolerations:
- key: "key"
  operator: "Exists"

3.有多个Master存在时,防止资源浪费,可以如下设置
kubectl taint Node node-name node-role.kubernetes.io/master=:PreferNoSchedule


