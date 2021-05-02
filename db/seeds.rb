require 'database_cleaner'
require 'rolify'

DatabaseCleaner.clean_with(:truncation)

Position.create!({name: "HR-director"})

admin = User.create!({ surname: "Admin",
                       name: "Admin",
                       patronymic: "Admin",
                       date_employment: "20.04.2020",
                       phone: "123123",
                       email: "admin@mail.com",
                       login: "admin",
                       position_id: 1,
                       password: 'admin' })

admin.add_role :admin
