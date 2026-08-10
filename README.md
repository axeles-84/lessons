Домашнее задание к занятию 1
Пункт 2
В нем пишется лог и все передается в открытом виде  поэтому данные фаил добавляем в gitignore, также не рекомендуется хранить ключи токены в папке проекта , на них следует указывать ссылками в не папке проекта.
tfstate
*.tfstate.*
personal.auto.tfvars

Задача 3 
Данные взяты из terraform.tfstate
"schema_version": 3,
          "attributes": {
            "bcrypt_hash": "$2a$10$8pyoHgm92YuMA40ClJ84guv9WeIKPe1V/vbkbM2pyptgMfG8aBOri",
            "id": "none",
            "keepers": null,
            "length": 16,
            "lower": true,
            "min_lower": 1,
            "min_numeric": 1,
            "min_special": 0,
            "min_upper": 1,
            "number": true,
            "numeric": true,
            "override_special": null,
            "result": "2y3C1no4TWAJ9zBs",
            "special": false,
            "upper": true

Пункт 4 
 Ошибка в названии resource "docker_container" "1nginx"
Опечатка большая буква T
name  = "example_${random_password.random_string_FAKE.resulT}"
Пункт 5 
resource "docker_image" "nginx"{
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_FAKE.result}"
  #name  = "nginx"

user@ubuntu:~/repo/ter-homeworks/01/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
8113b05016e1   5253dc86cc93   "/docker-entrypoint.…"   2 seconds ago   Up 2 seconds   0.0.0.0:9090->80/tcp   example_2y3C1no4TWAJ9zBs

Пункт 6
terraform apply -auto-approve Данный ключ автоматически подтверждает выполнения кода , и если ошибиться то можно удалить или изменить чтото важное , в проде не рекомендуется испольозвать. В тестовых средах и не критичных объектов , также скриптах и тд для автоматизации. 
ser@ubuntu:~/repo/ter-homeworks/01/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
69dc2eeaacca   5253dc86cc93   "/docker-entrypoint.…"   5 seconds ago   Up 5 seconds   0.0.0.0:9090->80/tcp   hello_world

Пункт 7


![Image alt](https://github.com/axeles-84/lessons/blob/main/tfsate.PNG)


Пункт 8
esource "docker_image" "nginx"{
  name         = "nginx:latest"
  keep_locally = true Предотвращает удаление контейнера 
}
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

https://library.tf/providers/kreuzwerker/docker/latest/docs/resources/image#:~:text=keep_locally%20(Boolean)%20If%20true%2C%20then%20the%20Docker%20image%20won%27t%20be%20deleted%20on%20destroy%20operation.%20If%20this%20is%20false%2C%20it%20will%20delete%20the%20image%20from%20the%20docker%20local%20storage%20on%20destroy%20operation.









   
   
