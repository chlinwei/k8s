1.查看某个资源的标签
kubectl get pods --show-labels
kubectl get pod  podName --show-labels
kubectl nodes --show-labels
kubectl node podName --show-labels



2.设置某个资源的标签
kubectl label pod podName k1=v1
kubectl label node master1 nodeName k1=v1



3.删除某个标签
kubectl label pod  podName k1-
kubectl label node nodeName  k1-


