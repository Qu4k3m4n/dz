https://hub.docker.com/repository/docker/qu4k3m4n/custom-nginx/general


docker run -d --name "qu4k3m4n-custom-nginx-t2" -p 127.0.0.1:8080:80 qu4k3m4n/custom-nginx:1.0.0
3f0bf1aac39217e843544cb0639c662402d996949741c7de71782db330a0a1b1
docker rename "qu4k3m4n-custom-nginx-t2" custom-nginx-t2
Get-Date -Format "dd-MM-yyyy HH:mm:ss.fffffff K"
Start-Sleep -Milliseconds 150
docker ps
netstat -ano | findstr ":8080"
docker logs custom-nginx-t2 -n1
docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html #Переделан под винду
What's next?
  Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug custom-nginx-t2
  Learn more at https://docs.docker.com/go/debug-cli/
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> Get-Date -Format "dd-MM-yyyy HH:mm:ss.fffffff K"
26-05-2024 20:31:39.8516079 +03:00
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> Start-Sleep -Milliseconds 150
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> docker ps
CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS         PORTS
      NAMES
aa6ec72484da   qu4k3m4n/custom-nginx:1.0.0   "/docker-entrypoint.…"   4 minutes ago   Up 4 minutes   127.0.0.1:8080->80/tcp   custom-nginx-t2
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> netstat -ano | findstr ":8080"
  TCP    127.0.0.1:8080         0.0.0.0:0              LISTENING       25604
  TCP    127.0.0.1:8080         127.0.0.1:51484        TIME_WAIT       0
  TCP    127.0.0.1:8080         127.0.0.1:51496        TIME_WAIT       0
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> docker logs custom-nginx-t2 -n1
172.17.0.1 - - [26/May/2024:17:31:11 +0000] "\x16\x03\x01\x06\xC0\x01\x00\x06\xBC\x03\x03\xDB\xB1\x0E\x9F\x1F.\xC14m:\xACAa" 400 157 "-" "-" "-"
PS C:\Users\Quakeman\PycharmProjects\custom-nginx> docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html


