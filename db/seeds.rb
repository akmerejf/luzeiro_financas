# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.new(name: "Administrador", code: 1)
func = Role.new(name: "Funcionário", code: 2)

admin.save
func.save

u = User.new(username: "admin", password: "admin1234", email: "admin@admin.com",password_confirmation:"admin1234", role: Role.find_by({code: 1}))
u.save
u = User.new(username: "user",email: "user@user.com", password: "user1234", password_confirmation:"user1234", role: Role.find_by({code: 2}))
u.save
c = Company.new(id: 1, name: "Luzeiro Navegação")
c.save
cc = ChartOfAccount.new(id: 1, title: "Balanço Patrimonial", company: c)


acc1 = Account.create(name: "Ativo", code: 1)
acc2 = Account.create(name: "Circulante", code: 1, parent: acc1)
acc3 = Account.create(name: "Disponível", code: 1, parent: acc2)
acc4 = Account.create(name: "Caixa", code: 1, parent: acc3)
acc5 = Account.create(name: "Caixa Luzeiro", code: 1, analytic: true, parent: acc4)
acc6 = Account.create(name: "Passivo", code: 2)
acc7 = Account.create(name: "Circulante", code: 1, parent: acc6)
acc8 = Account.create(name: "Disponível", code: 1, parent: acc7)
acc9 = Account.create(name: "Banco", code: 1, parent: acc8)
acc10 = Account.create(name: "Banco do Brasil", code: 1, analytic: true, parent: acc9)

