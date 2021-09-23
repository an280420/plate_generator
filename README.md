# Plate generator

Простой генератор печатных форм на Ruby on Rails.
Приложение позволяет зарегестрированным пользователям зайти и посмотреть свои курсы.
У каждого курса имеется свой печатный шаблон
Для примера базу данных можно заполнить из файла *seeds.rb*

### Ветка Docker
1. Скачайте репозиторий
1. Перейдите в корень проекта
1. Переключитесь на ветку docker
    ```
    git checkout docker
    ```
1. Создайте в корне проекта файл  **.env**  со следюущим текстом
    ```
    DATABASE_NAME=plate_generator_development
    DATABASE_USER=plate_generator
    DATABASE_PASSWORD=123456
    DATABASE_HOST=database
    REDIS_HOST=redis

    ```
1. Выполните сборку образов docker и запуск служб
    ```
    docker-compose up -d
    ```
1.  Создайте базу данных
    ```
    docker-compose exec app bundle exec rails db:setup db:migrate
    ```
1. Оставив службы работать, откройте в браузере адрес `localhost:3000`

1. Для запуска webpack и подключения стилей наберите в консоле
    ```
    docker-compose exec app bin/webpack-dev-server
    ```
1. Если вебпак не компилится автоматически, то можете попробовать совершить следующие шаги:
    - остановите rails server a также webpack-dev-server
    - закомментируйте строку в файле /app/javascript/packs/application.js (например //import "../stylesheet/application")
    - стартаните rails server (webpack-dev-server не запускайте)
    - расскоментируйте ранее закоментированную строку
    - обновите страницу. Вебпак должен скомпилироваться
 
### Ветка Master

1. Скачайте или клонируйте данный репозиторий
1. Перейдите в папку с репозиторием
1. Установите небходимые библиотеки с помощью команд
    ```
    bundle
    yarn
    ```
1. Создайте базу данных и заполните ее из файла *seeds.rb* для этого наберите в консоле
    ```
    rails db:create
    rails db:seed
    ```
1. Для старта приложения наберите в консоле
    ```
    rails s
    ```
1. Если webpack, отвечающий за стили и js, не автокомпилится, то в отдельном окне терминала наберите команду
    ```
    bin/webpack-dev-server
    ```
1. Используйте тестовый логин и пароль для входа на ресурс

    login: `Vasya@email.com`

    password: `123456`

1. Успешно залогинившись вы сможет видеть ваши курсы и шаблоны курсов. По нажатию кнопки `savePDF` вы можете сохранять шаблон курса в pdf формате в директории `./pdfs/` вашего проекта.

1. Сохранение шаблонов в формате pdf реализовано через обратчик фоновых задач Sidekiq
Чтобы сохранение файлов в pdf работало, необходимо запустить Sidekiq, для этого в новом окне терминал наберите команду
    ```
    sidekiq
    ```
После чего функция сохранения файлов будет работать
Все сохраненные файлы вы сможете найти в директории *./pdfs/*


* Ruby version 3.0.0

* System dependencies

* Configuration

* Database creation `rails db:create`

* Database initialization `rails db:migrate` and generate examples for database `rails db:seed`

* Services: sidekiq
