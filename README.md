docker run -d -v /home/mayur/Desktop/infra_cloud_Task/csvserver/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest 

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker run -d  --network prom-net  --env CSVSERVER_BORDER:Orange  -p 9393:9300  -v /home/mayur/Desktop/infra_cloud_Task/csvserver/solution/inputFile:/csvserver/inputdata 8cb989ef80b5
==============================================================================================


5ed084a95fbdc14da833252affe26382aed5306a90131de5015542e0dd5223d6
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker ps 
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                       NAMES
5ed084a95fbd   8cb989ef80b5   "/csvserver/csvserver"   3 seconds ago   Up 2 seconds   0.0.0.0:9393->9300/tcp, :::9393->9300/tcp   happy_bell
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ 

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker exec -it 5ed084a95fbd /bin/bash
[root@5ed084a95fbd csvserver]# hostname
5ed084a95fbd
[root@5ed084a95fbd csvserver]# ls -all
total 8108
drwxr-xr-x 1 root root    4096 Oct 25 12:28 .
drwxr-xr-x 1 root root    4096 Oct 25 12:28 ..
-rwxrwxr-x 1 root root 8290304 Mar 10  2021 csvserver
-rwxrwxrwx 1 1001 1001      79 Oct 25 05:37 inputdata
[root@5ed084a95fbd csvserver]# cat inputdata 
0, 1117
1, 6771
2, 2162
3, 5267
4, 2185
5, 9967
6, 1340
7, 3061
8, 2447
9, 595
[root@5ed084a95fbd csvserver]#
==============================================================================================

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker container stop 5ed084a95fbd
==============================================================================================

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker container rm 5ed084a95fbd
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker ps 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ 
===============================================================================================

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ wget -O ./part-1-output http://localhost:9393/raw
Will not apply HSTS. The HSTS database must be a regular and non-world-writable file.
ERROR: could not open HSTS store at '/home/mayur/.wget-hsts'. HSTS will be disabled.
--2021-10-25 19:11:23--  http://localhost:9393/raw
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:9393... connected.
HTTP request sent, awaiting response... 200 OK
Length: 160 [text/plain]
Saving to: ‘./part-1-output’
./part-1-output                   100%[============================================================>]     160  --.-KB/s    in 0s      
2021-10-25 19:11:23 (10.8 MB/s) - ‘./part-1-output’ saved [160/160]
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ 

mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker-compose -f docker-compose.yaml up -d
Creating network "solution_Prom-net" with driver "bridge"
Creating csvserver             ... done
Creating solution_prometheus_1 ... done
mayur@mayur:~/Desktop/infra_cloud_Task/csvserver/solution$ docker-compose ps
        Name                       Command               State                     Ports                  
----------------------------------------------------------------------------------------------------------
csvserver               /csvserver/csvserver             Exit 1                                           
solution_prometheus_1   /bin/prometheus --config.f ...   Up       0.0.0.0:9090->9090/tcp,:::9090->9090/tcp


