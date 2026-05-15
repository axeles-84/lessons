# lessons 1
Задание 1 
Яндекс заблокировал мой аакунт и не дает создать VM , все пункты по созданиб VM прлшел.
Активировал промокод , написал заявку в ТП яндекса жду ответа.
<img width="461" height="424" alt="image" src="https://github.com/user-attachments/assets/564a70c8-0574-4696-b5cc-277e2452a119" />

lessons
Задача 2 
Вопрос:высоконагруженная база данных MySql, критичная к отказу;
Отвеет:виртуализация уровня ОС; Максимальная производительность, кластризация, при использовании схд, кластризации уменьшить время простоя 
Вопрос:различные web-приложения;
Отвект:виртуализация уровня ОС; Docker бытрое развртывание , версионность можно запускать различныее версии веб приложений,изоляция друг от друга приложений
Вопрос:Windows-системы для использования бухгалтерским отделом;
Ответ:паравиртуализация;HyperV,Virtual Box Просст в использовании  
Вопрос:системы, выполняющие высокопроизводительные расчёты на GPU.
Ответ:Физический сервер.Нужно максимальное количество ресурсов и на скока мне известно Gpu плохо вертцууализируется 

Задача 3
Сценарии 
1.VMware vSphere,Hyper-V
2.ProxMox,Microsoft Hyper-V Server 2019
3.Microsoft Hyper-V Server 2019
4.Docker

Задача 4
1.Нет единой точки управления
2.Пдоходы и приемы управления разными средами виртуализации 
3.Разлиные форматы хранения виртуальных машин
4.Различные способы резервированого копирования виртуальных машин 
5.Большоу время простоя при выходе одного типа гипервизора и пернос виртуальных машин на другой , Live migration можно забыть 
Для минимилизации рисков требует выробать стратегию к переходу на один типа гипервизиров.слибы возможность не создавал.
Lesson2
Задача 3
[mydebian.json](https://github.com/user-attachments/files/27788328/mydebian.json)
{
    "builders": [
        {
            "type": "yandex",
            "token": "XXXXXXXXXXXXXXXX",
            "folder_id": "XXXXXXXXXXXXXXXX",
            "zone": "ru-central1-a",
            "image_name": "debian-11-docker",
            "image_description": "my custom debian with docker",
            "source_image_family": "debian-11",
            "subnet_id": "XXXXXXXXXXXXXX",
            "use_ipv4_nat": true,
            "disk_type": "network-hdd",
            "ssh_username": "debian"
        }
    ],
    "provisioners": [
        {
            "type": "shell",
            "inline": [
                "echo 'hello from packer'",
                "sudo sed -i '/bullseye-backports/d' /etc/apt/sources.list",
                "sudo apt-get update -y",
                "sudo apt-get install htop tmux docker docker-compose -y",
                "docker --version", "docker-compose version"
]
        }
    ]
}

source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-dockerv2"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  token               = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
"echo 'hello from packer'",
"sudo sed -i '/bullseye-backports/d' /etc/apt/sources.list",
"sudo apt-get update -y",
"sudo apt-get install htop tmux docker docker-compose -y",
"docker --version", "docker-compose version"]
  }

}
