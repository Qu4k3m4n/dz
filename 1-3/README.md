# Задача 1
- https://hub.docker.com/repository/docker/qu4k3m4n/custom-nginx/general
# Задача 2
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/%D0%A1%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%2006-06-2024%20184140.jpg)
# Задача 3
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/1-1-3.jpg)
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/2-1-3.jpg)
CTRL-С отправляет в контейнер SIGINT. Если контейнер был запущен с -i и -t , вы можете отсоединиться от контейнера и оставить его работающим с помощью последовательности клавиш CTRL-p CTRL-q.
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/3-1-3.jpg)
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/4-1-3.jpg)
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/5-1-3.jpg)
ss -tlpn не покажет порт 8080, так как Nginx слушает порт 81 внутри контейнера.
docker port покажет сопоставление портов (если оно настроено), но не гарантирует, что приложение внутри контейнера слушает этот порт.
curl вернет ошибку, т.к. на хост-машине порт 8080 не прослушивается
# Зачада 4
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/1-3-4-1.jpg)
tail -f /dev/null: Эта команда будет "следить" за пустым файлом (/dev/null) и не даст контейнеру завершиться
# Задача 5
Путь по умолчанию для файла Compose — compose.yaml (предпочтительный) или compose.yml он находится в рабочем каталоге. Compose также поддерживает docker-compose.yaml обратную docker-compose.yml совместимость более ранних версий. Если оба файла существуют, Compose предпочитает канонический compose.yaml.
docker compose down
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/1-3-5-1.jpg)
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/1-3-5-2.jpg)
![Иллюстрация к проекту](https://github.com/Qu4k3m4n/dz/blob/main/images/1-3-5-3.jpg)
WARN[0000] Found multiple config files with supported names: /home/qu4k3m4n/dz/1-3/compose.yaml, /home/qu4k3m4n/dz/1-3/docker-compose.yaml 
WARN[0000] Using /home/qu4k3m4n/dz/1-3/compose.yaml
WARN[0000] Found multiple config files with supported names: /home/qu4k3m4n/dz/1-3/compose.yaml, /home/qu4k3m4n/dz/1-3/docker-compose.yaml
WARN[0000] Using /home/qu4k3m4n/dz/1-3/compose.yaml
WARN[0000] /home/qu4k3m4n/dz/1-3/docker-compose.yaml: `version` is obsolete
WARN[0000] /home/qu4k3m4n/dz/1-3/compose.yaml: `version` is obsolete
[+] Running 2/2
 ✔ Container 1-3-portainer-1  Removed                                                                                                                              0.7s 
 ✔ Container 1-3-registry-1   Removed  
- Это предупреждение о то что несколько конфигурационных файлов (манифестов)
