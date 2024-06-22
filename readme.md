
Install k3d
```
 curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
 ```


k3d cluster create command to create
```
k3d cluster create mycluster
kubectl get nodes
```
The output of the latter command is as follows:
```
NAME                     STATUS   ROLES                  AGE     VERSION
k3d-mycluster-server-0   Ready    control-plane,master   2m50s   v1.21.5+k3s1
```
Creating a Pod with Mongo#
```
kubectl run db --image mongo
```
listing all the Pods in the cluster.
```
kubectl get pods
```
output:
```
NAME   READY   STATUS              RESTARTS  AGE
db     0/1     ContainerCreating   0         1m
```

In the output, we can see the following:

The name of the Pod
Its readiness
Its the status
The number of times it has restarted
For how long it has existed (its age)

We can now see that the Pod is ready. We can start using the Mongo database now

We can confirm that a container based on the mongo image is indeed running inside the cluster by listing all the containers based on the mongo image.
```
docker exec -it k3d-mycluster-server-0 ctr container ls | grep mongo kubectl get pods

```
The output of the above command is as follows (IDs are removed for brevity):
```
@harinisrinivas3000 ➜ /workspaces/kubernets-dev (main) $ docker exec -it k3d-mycluster-server-0 ctr container ls | grep mongo 
3a3e4b4723267446e17bb08ba35e3a5498c26681cbf9c9097a5e30ef8908626f    docker.io/library/mongo:latest                         io.containerd.runc.v2    
```
However, this is not the best way to run Pods so we’ll delete it.
```
kubectl delete pod db
```

