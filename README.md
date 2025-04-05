# Порт для Static Jinja Plus

Данный проект упаковывает [Static Jinja Plus](https://github.com/MrDave/StaticJinjaPlus) в Docker-контейнеры. 
Это позволяет быстро развернуть у себя проект и приступить к его использованию.
Ссылка на репозиторий в [DockerHub](https://hub.docker.com/repository/docker/mikeresting/static-jinja-plus/general)

## Описание версий
Версии основываются на двух образах: Ubuntu 24.04 и Python-slim 3.12. 
Если в названии указана приписка **slim**, то образ основан на python-slim. В **другом случае** он основан на ubuntu.

- **Development** - самая последняя версия, может быть не стабильной.
- **Latest** - последняя стабильная версия.

## Установка
Файлы требуют установленный [Docker](https://www.docker.com/).
Введите нужную команду в директории скачанного репозитория
- **develop**
  ```bash
  docker build -f develop.Dockerfile -t static-jinja-plus:develop .
  ```
- **develop-slim**
  ```bash
  docker build -f develop-slim.Dockerfile -t static-jinja-plus:develop-slim .
  ```
- **latest**
  ```bash
  docker build -f latest.Dockerfile -t static-jinja-plus:latest .
  ```
- **latest-slim**
  ```bash
  docker build -f latest-slim.Dockerfile -t static-jinja-plus:latest-slim .
  ```
- **0.1.0**
  ```bash
  docker build -f 0.1.0.Dockerfile -t static-jinja-plus:0.1.0 .
  ```
- **0.1.0-slim**
  ```bash
  docker build -f 0.1.0-slim.Dockerfile -t static-jinja-plus:0.1.0-slim .
  ```
- **0.1.1**
  ```bash
  docker build -f 0.1.1.Dockerfile -t static-jinja-plus:0.1.1 .
  ```
- **0.1.1-slim**
  ```bash
  docker build -f 0.1.1-slim.Dockerfile -t static-jinja-plus:0.1.1-slim .
  ```

## Пример использования
Зайдите в папку где есть папка templates с подготовленными для обработки файлами.
Запустите команду типа

```bash
docker run -it --rm \
  -v $(pwd)/templates:/opt/static-jinja-plus/templates \
  -v $(pwd)/build:/opt/static-jinja-plus/build \
  your-image-name
```

Также можно использовать все флаги из документации Static Jinja Plus. Пример запуска latest версии с флагом для отслеживания изменений
```bash
docker run -it --rm \
  -v $(pwd)/templates:/opt/static-jinja-plus/templates \
  -v $(pwd)/build:/opt/static-jinja-plus/build \
  static-jinja-plus:latest -w
```

## Цель проекта
Код написан в учебных целях — это урок в курсе по Python и веб-разработке на сайте [Devman](https://dvmn.org/)
