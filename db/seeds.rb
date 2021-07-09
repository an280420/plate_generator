# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Template.destroy_all

user = User.create(name: 'Vasya', email: 'Vasya@email.com', password: '123456')

templates = Template.create([
  {name: 'Шаблон первый', body: 'КУРС название курса {{course.name}} сложность курса {{course.level}}'},
  {name: 'Шаблон второй', body: 'КУРС название курса {{course.name}} сложность курса {{course.level}} длительность курса {{course.volume}} пользователь курса {{user.name}}'}
])

courses = Course.create(
  [
    { name: 'Ruby', level: 'hard', volume: '150 hours', user_id: user.id, template_id: templates.first.id },
    { name: 'Golang', level: 'hard', volume: '250 hours', user_id: user.id, template_id: templates.first.id },
    { name: 'Html', level: 'soft', volume: '100 hours', user_id: user.id, template_id: templates.last.id },
    { name: 'CSS', level: 'medium', volume: '150 hours', user_id: user.id, template_id: templates.last.id }
  ]
)