1.下载helm客户端
wget https://get.helm.sh/helm-v2.16.6-linux-amd64.tar.gz

2.下载服务端tiller镜像
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.16.6

3.创建ServiceAccount和clusterrolebind
kubectl create -f  rbac-config.yaml

4.
export HELM_HOME=/data/helm
helm init --service-account tiller-sa --skip-refresh --tiller-image registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.16.6


5.测试安装是否成功
helm version


6.更新和查看helm仓库
helm repo update
helm repo list






如何卸载helm ?
kubectl get -n kube-system secrets,sa,clusterrolebinding -o name|grep tiller|xargs kubectl -n kube-system delete
kubectl delete deployment tiller-deploy -n kube-system
kubectl delete svc tiller-deploy -n kube-system

