# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

        2.5.1

* Database creation

        Конфигурация рассчитана на postgres

    rake db:create

    rake db:migrate

    rake db:seed

        В seed содержится небольшое количество рандомных данных. 

* Deployment instructions

        Используется puma.

    1. Необходимо указать гемсет 
    2. bundle install
    3. rails s
    
    
* Доступ к данным по API

Реализовано 2 версии api

 - V1
 
        http://localhost:3000/api/v1/users
        http://localhost:3000/api/v1/users/:id
        
        На данном этапе без указания user_id в параметрах 
        ответ будет содержать все курсы.
        http://localhost:3000/api/v1/courses
        http://localhost:3000/api/v1/courses/:id
        
        Если указать user_id, то ответ будет содержать курсы, 
        которые купил пользовать (принадлежность promo_codes пользователю)
        http://localhost:3000/api/v1/courses?user_id=2
        
        Без указания user_id и course_id ответ будет содержать все
        уроки по всем курсам        
        http://localhost:3000/api/v1/lessons
        http://localhost:3000/api/v1/lessons/id
        
        При указании пользователя и курса будут выбраны все доступные 
        для пользователя курса и показаны задачи для этого курса. 
        Соответственно, если курс недоступен пользователю, то ответ 
        будет содержать пустой массив.
        http://localhost:3000/api/v1/lessons?user_id=3&course_id=13
        
 - V2
  
         http://localhost:3000/api/v2/users
         http://localhost:3000/api/v2/users/:id
         
         http://localhost:3000/api/v2/users/:user_id/courses
         http://localhost:3000/api/v2/users/:user_id/courses/:id
         
         http://localhost:3000/api/v2/users/:user_id/courses/:course_id/lessons
         http://localhost:3000/api/v2/users/:user_id/courses/:course_id/lessons/:id
         
         Соответсвенно соблюдена иерархия и для конкретного пользователя ответ будет 
         содержать данные, которые доступны этому пользователю. 