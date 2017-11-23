# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Usuario.create(nombre: 'Jose', correo: 'jose@gmail.com',password:'1234567890',apellido: 'Liscano',telefono: '122122',rol: 0,activated: 1,activated_at: Time.now)
Usuario.create(nombre: 'Juan', correo: 'coordinador@gmail.com',password:'1234567890',apellido: 'Bolivar',telefono: '122422',rol: 1,activated: 1,activated_at: Time.now)
Usuario.create(nombre: 'Carlos', correo: 'psicologo@gmail.com',password:'1234567890',apellido: 'Perez',telefono: '123122',rol: 2,activated: 1,activated_at: Time.now)
Usuario.create(nombre: 'Maria', correo: 'psiquiatra@gmail.com',password:'1234567890',apellido: 'Martinez',telefono: '122622',rol: 3,activated: 1,activated_at: Time.now)
Usuario.create(nombre: 'Ana', correo: 'colaborador@gmail.com',password:'1234567890',apellido: 'Valvuena',telefono: '122522',rol: 4,activated: 1,activated_at: Time.now)
