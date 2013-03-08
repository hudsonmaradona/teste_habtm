# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

puts 'Cadastro Permissões USER '
Role.create([
                { :name => 'admin' },
                { :name => 'user' },
                { :name => 'VIP' }
            ], :without_protection => true)

#puts 'Permissões' << role.name

puts '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'

puts 'Configurações Padrão Login'

user = User.create! :name => 'Web Developer TecSis',
                    :email => 'wwwtecsis@gmail.com',
                    :password => '12345678',
                    :password_confirmation => '12345678'
user.confirm!

puts 'Novo Usuário Cadastrado: ' << user.name


puts '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'

puts 'Categoria de Novelas'

NovelCategory.create([
                { :title => 'Novela das 8' },
                { :title => 'Novela das 9' },
                { :title => 'Novela das 10' }
                ])
