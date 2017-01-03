# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

let todos = Todo.create([
  {title: 'get a dog', body: 'we need to get a dog', done: false},
  {title: 'wash a dog', body: 'we need to wash a dog', done: false},
  {title: 'get a car', body: 'we needed to get a car', done: true},
  {title: 'wash a car', body: 'we washed a car', done: true}
])
