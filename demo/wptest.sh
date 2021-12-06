#for i in {0..10};\
for i in {0..20};\
do \
#kubectl apply -n test$i -f .
#kubectl delete deploy -n test$i nginx
kubectl delete -n test$i -f .
#kubectl delete -n test$i pvc mysql-data-mysql-0
done;
