1.下载两个工具cfssl cfssljson
2.cd /etc/kubernetes/pki
3. 
cfssl gencert -ca=ca.crt -ca-key=ca.key -profile=kubernetes /root/k8s/k8s/core/authentication/crt/devuser-csr.json | cfssljson -bare devuser

4.设置集群参数
cd /root/k8s/k8s/core/authentication/crt
export KUBE_APISERVER="http://192.168.230.131:6443"
kubectl config set-cluster kubernetes \ 
--certificate-authority=/etc/kubernetes/pki/ca.crt \
--embed-certs=true \
--server=${KUBE_APISERVER} \
--kubeconfig=devuser.kubeconfig

此时会在/root/k8s/k8s/core/authentication/crt目录下生成个devuser.kubeconfig文件



5.设置客户端认证参数
cd /root/k8s/k8s/core/authentication/crt
kubectl config set-credentials devuser \ 
--client-certificate=/etc/kubernetes/pki/devuser.pem \
--client-key=/etc/kubernetes/pki/devuser-key.pem \
--embed-certs=true \
--kubeconfig=devuser.kubeconfig


6.设置上下文
cd /root/k8s/k8s/core/authentication/crt
kubectl config set-context kubernetes \
--cluster=kubernetes \ 
--user=devuser \ 
--namespace=dev  \
--kubeconfig=devuser.kubeconfig


