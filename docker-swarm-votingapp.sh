 docker network create -d overlay backend

 docker network create -d overlay frontend

 docker service create --name vote -p 80:80 --network frontend --replica 2 bretfisher/examplevotingapp_vote

 docker service create --name redis --network frontend --replicas 1 redis:3.2

 docker service create --name worker --network frontend --network backend --replicas 1 bretfisher/examplevotingapp_worker

 docker service create --name db --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data --replicas 1 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4

 docker service create --name result -p 5001:80 --network backend --replicas 1 bretfisher/examplevotingapp_result