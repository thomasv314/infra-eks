# eks sandbox w/ argocd + istio + external-dns

## Launch cluster

`eksctl create cluster -f cluster.yaml`

## Destroy cluster

`eksctl delete cluster -f cluster.yaml`

## Bootstrap ArgoCD

`kubectl kustomize argo-bootstrap | kubectl apply -f`
