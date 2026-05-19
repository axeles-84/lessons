Домашнее задание к занятию 4
Задача 1
https://hub.docker.com/repository/docker/axeles84/custom-nginx/general
![Image alt](https://github.com/axeles-84/lessons/blob/main/1.PNG)
Задача 3
1)docker attach db0a002d27e0 
2)Выполнил произашла остановка контейнера
3) ![Image alt](https://github.com/axeles-84/lessons/blob/main/11.PNG)
4) Перезапустил контейнер docker start db0a002d27e0
5) docker exec -it custom-nginx-t2  /bin/bash
6)apt install mc
7)mcedit /etc/nginx/conf.d/default.conf
8)Выполнено
9)exit
10)Пробро порта настроен с 8080 на 80 ,а мы в docker контейнере nginx перенастроили на 81 порт. Поэтому сейчас ничего не работает.
11)Останавливаем docker. Нужно исправить значения в файлах  hostconfig.json и config.v2.json в папке с контейнером ,ищем параметры PortBindings и ExposedPorts меняем на 81 порт. Запускаем docker , запускаем контейнер.
12)docker rm -f custom-nginx-t2
![Image alt](https://github.com/axeles-84/lessons/blob/main/2.PNG)
![Image alt](https://github.com/axeles-84/lessons/blob/main/3.PNG)
![Image alt](https://github.com/axeles-84/lessons/blob/main/4.PNG)
Задача 4
Debian
![Image alt](https://github.com/axeles-84/lessons/blob/main/Debian.PNG)
Centos
![Image alt](https://github.com/axeles-84/lessons/blob/main/Centos.PNG?raw=true)
