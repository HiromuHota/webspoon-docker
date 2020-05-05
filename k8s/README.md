# Run webspoon on Kubernetes

Clone this repository and run this command to create required resources (`Deployment` and `Service`).

```sh
$ kubectl create -f ./k8s
deployment.apps/webspoon created
service/webspoon created
```

Check that webspoon is running.

```sh
$ kubectl get pod
NAME                        READY   STATUS              RESTARTS   AGE
webspoon-78767c7f57-b9fzd   1/1     Running             0          5m7s
```

Do port forwarding of `8080` port of the service to local machine.

```sh
kubectl port-forward service/webspoon 8080:8080 &
```

While port forwarding, access to the port of local machine.

```
http://localhost:8080
```

