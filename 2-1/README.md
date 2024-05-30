### Задание 1


2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?


- **personal.auto.tfvars**
3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

- **"result": "3y7r2hjQyF5GBE9g",**
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

- Отсутствие имени для ресурса docker_image. было resource "docker_image" { правильно resource "docker_image" "nginx_image"{ 
- Неверное имя ресурса docker_container (имя не может начинаться с цифры)
- 31:   name  = "example_${random_password.random_string_FAKE.resulT}"
A managed resource "random_password" "random_string_FAKE" has not been declared in the root module.
- 31:   name  = "example_${random_password.random_string.resulT}"
This object has no argument, nested block, or exported attribute named "resulT". Did you mean "result"?
- docker_image.nginx.image_id на docker_image.nginx_image.image_id**


5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.
docker ps
- CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                  NAMES
313acd17b2b1   e784f4560448   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:9090->80/tcp   example_3y7r2hjQyF5GBE9g
6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.

- CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS         PORTS                  NAMES
1d30b83891d9   e784f4560448   "/docker-entrypoint.…"   10 seconds ago   Up 9 seconds   0.0.0.0:9090->80/tcp   hello_world3y7r2hjQyF5GBE9g

- авто апрув длинее писать чем yes и больше лень, не лишнем было бы посмотреть терраформ план перед апплу, пригодится может возможно при автоматизации, типа какого-нибудь пайплайна
8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.
- {
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 11,
  "lineage": "2171cbaa-58d0-de88-c400-1f21aeecb49a",
  "outputs": {},
  "resources": [],
  "check_results": null
}

9. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )
- resource "docker_image" "nginx_image" { 
  name         = "nginx:latest"
  keep_locally = true  # <-- Вот почему
}

- Из документации:
keep_locally - (Optional, Boolean) If true, then the Docker image won't be deleted after the resource is removed.
https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#optional
------

### Задание 2*

terraform@terraform:~$ docker exec mysql_container env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

HOSTNAME=eb014bdb7558

MYSQL_ROOT_HOST=%

MYSQL_ROOT_PASSWORD=4s}bL$wXU3G0_Hrp

MYSQL_DATABASE=wordpress

MYSQL_USER=wordpress

MYSQL_PASSWORD=uT$$A-8>ZocZpkRT

GOSU_VERSION=1.17

MYSQL_MAJOR=8.4

MYSQL_VERSION=8.4.0-1.el9

MYSQL_SHELL_VERSION=8.4.0-1.el9
HOME=/root
------
