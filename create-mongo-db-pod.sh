kubectl run db --image mongo

kubectl get pods

docker exec -it k3d-mycluster-server-0 ctr container ls | grep mongo 

#kubectl delete pod db