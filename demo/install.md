## master

masterノードにkubeadm/kubelet/kubectlをインストールして、masterとして初期化

```
apt-get install -y kubeadm kubelet kubectl
kubeadm init --pod-network-cidr=10.244.0.0/16
```

出力される```kubeadm join```コマンドをコピーする

## worker

各workerノードにkubeadm/kubeletをインストールして、masterにjoin

```
apt-get install -y kubeadm kubelet
kubeadm join master:6443 --token xxxxxxxxxxxxxxxxxxxxxxx \
    --discovery-token-ca-cert-hash sha256:yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
```


## master

master上で生成されたKUBECONFIGファイルを利用して、クラスターにflannelをインストール

```
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml
```
