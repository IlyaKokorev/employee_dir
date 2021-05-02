# Тестовое задание для ФГБУ «ФРЦ» Минздрава России

Данное приложение представляет справочник должностей.
В симтеме сотрудники являются её же пользователями. 
Регистрации пользователей нет, создаются в ручную при наличии
прав администратора. Доступ в систему без аутентификации запрещен.

Администратор - может просматривать реестр сотрудников, создавать новых, 
устанавливать или удалять любую информацию и сотрудников.

Сотрудник - может просматривать реестр сотрудников, имеет доступ только к редактированию
своей карточки, а именно может изменять пароль, телефон или email.

Всем пользователям доступна выгрузка реестра сотрудников в виде Exel файла.

При работе использовано: 
* Сборка ассетов через webpack;
* UI - Bootstrap 4;
* Формы созданы gem simple_form;
* Авторизация пользователя через gem pundit;
* Роли задаются с помощью gem rolify;
* Поигрался с CSS (сквозь боль и слезы).

## Версии

* Rails 6.0.3.6
* Ruby 2.7.0p0

## Установка и запуск

```
$ git clone https://github.com/IlyaKokorev/employee_dir.git
$ bundle
$ rake db:migrate 
$ rake db:seed
$ bin/webpack-dev-server
$ rails s