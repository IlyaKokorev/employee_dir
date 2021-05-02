
require 'faker'
require 'database_cleaner'
require 'rolify'

DatabaseCleaner.clean_with(:truncation)

Position.create!({name: "Designer"})
Position.create!({name: "Programmer"})

test1 = User.create!({ surname: "test1",
               name: "test1",
               patronymic: "test1",
               date_employment: "20.04.2020",
               phone: "123456",
               email: "test1@mail.com",
               login: "test1",
               position_id: 1,
               password: '123123' })

test1.add_role :user

user2 = User.create!({ surname: "test2",
               name: "test2",
               patronymic: "test2",
               date_employment: "20.04.2020",
               phone: "654321",
               email: "test2@mail.com",
               login: "test2",
               position_id: 2,
               password: '123123' })

user2.add_role :user

Position.create!({name: "HR-director"})

admin = User.create!({ surname: "Admin",
                       name: "Admin",
                       patronymic: "Admin",
                       date_employment: "20.04.2020",
                       phone: "123123",
                       email: "admin@mail.com",
                       login: "admin",
                       position_id: 3,
                       password: 'admin' })

admin.add_role :admin
