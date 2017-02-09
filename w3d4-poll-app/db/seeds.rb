# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Archibald McButterpants")
User.create(user_name: "Harry Harrypants")
User.create(user_name: "Nelson Poopypants")

Poll.create(title: "All Your Faves", user_id: 1)
Poll.create(title: "FOOD", user_id: 2)
Poll.create(title: "Citys", user_id: 2)

Question.create(poll_id: 1, text: "What's your favorite animal?")
AnswerChoice.create(text: "Cheetah", question_id: 1)
AnswerChoice.create(text: "Bobcat", question_id: 1)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 1)


Question.create(poll_id: 1, text: "What's your favorite color?")
AnswerChoice.create(text: "Turqiouse", question_id: 2)
AnswerChoice.create(text: "Burgundy", question_id: 2)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 2)

Question.create(poll_id: 1, text: "What's your favorite movie?")
AnswerChoice.create(text: "Elf", question_id: 3)
AnswerChoice.create(text: "Dune", question_id: 3)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 3)

Question.create(poll_id: 1, text: "What's your favorite band?")
AnswerChoice.create(text: "Tool", question_id: 4)
AnswerChoice.create(text: "The Weeknd", question_id: 4)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 4)


Question.create(poll_id: 2, text: "What's your favorite food?")
AnswerChoice.create(text: "Pasta", question_id: 5)
AnswerChoice.create(text: "The YAM", question_id: 5)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 5)

Question.create(poll_id: 2, text: "Tomato or cucumber?")
AnswerChoice.create(text: "tomato", question_id: 6)
AnswerChoice.create(text: "Cucumber", question_id: 6)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 6)

Question.create(poll_id: 3, text: "New York or San Francisco?")
AnswerChoice.create(text: "SF", question_id: 7)
AnswerChoice.create(text: "New York", question_id: 7)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 7)

Question.create(poll_id: 3, text: "Pick your favorite city?")
AnswerChoice.create(text: "Rome", question_id: 8)
AnswerChoice.create(text: "Milan", question_id: 8)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 8)

Question.create(poll_id: 3, text: "Which Coast")
AnswerChoice.create(text: "West", question_id: 9)
AnswerChoice.create(text: "East", question_id: 9)
AnswerChoice.create(text: "Ivory", question_id: 9)
AnswerChoice.create(text: "Giraffe!!!!!!!!", question_id: 9)

Response.create(user_id: 3, answer_id: 1)
Response.create(user_id: 2, answer_id: 2)
Response.create(user_id: 2, answer_id: 4)
Response.create(user_id: 3, answer_id: 8)
Response.create(user_id: 2, answer_id: 9)
Response.create(user_id: 1, answer_id: 9)
Response.create(user_id: 2, answer_id: 28)
Response.create(user_id: 3, answer_id: 13)
Response.create(user_id: 2, answer_id: 12)
Response.create(user_id: 3, answer_id: 11)
Response.create(user_id: 2, answer_id: 6)
Response.create(user_id: 1, answer_id: 2)
Response.create(user_id: 3, answer_id: 14)
Response.create(user_id: 2, answer_id: 22)
Response.create(user_id: 1, answer_id: 25)
