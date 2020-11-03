## Let’s Cook ‘Compliance as Code’ with Chef InSpec

Supporting code base for the blogpost
(https://notsosecure.com/lets-cook-compliance-as-code-with-chef-inspec/)[https://notsosecure.com/lets-cook-compliance-as-code-with-chef-inspec/]

Below are the instructions to setup the Redis Docker container and running Inspec. 

## Setting-up the Redis Docker Container :
----

Clone the Git repository https://github.com/NotSoSecure/InSpec-redis and navigate to the directory ``` redis-lab ```

 ``` cd redis-lab ```

This folder contains a Dockerfile and a custom ``` redis.conf ``` file. A docker image is built using this Dockerfile that copies the ``` redis.conf ``` file that is eventually used to run the Redis Server as our target.  

Build a docker image using the below command. Enlist all the docker images, you should see the newly created docker image.


``` sudo docker build --tag redis-nss:1.0 . ``` 

``` sudo docker images ```

Identify the newly created image, and make a note of the ``` Image ID```. 

Run the docker container with the above image.


``` sudo docker run <Image ID>  ```

Run ``` sudo docker ps ```  to identify the container ID:

Make a  note of the aforementioned ``` Container_ID ```, this will be used subsequently to specify the target for InSpec.

## Example: Redis server compliance requirements.
---

Chef InSpec profile for runing the below compliance checks on a Redis Server:

1. The Redis Configuration file should be owned by user ‘redis_admin’ and only the ‘redis_admin’ user should have ‘write’ privileges. 
1. The Redis server should only bind to the localhost.
1. The Redis server should not run on the default port (6379).
1. The Redis server should have authentication enabled and if so, the password must contain at least one letter, at least one number, and be longer than18 characters.
1. The Redis server must disable dangerous commands.


## Running the Redis InSpec Profile: 
---
Finally fire the below InSpec command to run the InSpec-redis profile on the docker container. 
(Replace container_ID with the redis docker container ID.)

``` inspec exec InSpec-redis/ -t docker://container_ID ```

-------
