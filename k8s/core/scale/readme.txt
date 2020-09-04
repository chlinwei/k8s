比如原本副本数位:3

1.给deployment扩容
kubectl scale deployment deploymentName --replicas=4

2.给deployment缩容
kubectl scale deployment deploymentName --replicas=2
