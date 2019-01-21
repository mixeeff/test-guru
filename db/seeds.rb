# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {name: 'Иван Петров', login: 'ipetrov', password: '12345'},
  {name: 'Мария Иванова', login: 'masha888', password: 'butterfly34'}
  ])

categories = Category.create([
  {title: 'музыка'},
  {title: 'кино'}
  ])

tests = Test.create([
  {title: 'Hard Rock группы', level: 0, category_id: 1},
  {title: 'Французские комедии', level: 1, category_id: 2},
  {title: 'Кино СССР', level: 0, category_id: 2}
  ])

questions = Question.create([
  {test_id: 1, body: "Имя первого вокалиста группы ACDC"},
  {test_id: 1, body: "Название первого альбома группы 'Jethro Tull'"},
  {test_id: 2, body: "Актер игравший жандарма в серии комедий"},
  {test_id: 2, body: "Партнер Пьера Ришара в фильме 'Невезучие'"},
  {test_id: 3, body: "Режиссер фильма 'Иваново детство'"},
  {test_id: 3, body: "Название планеты на которой происходит действие фильма 'Кин-дза-дза'"}
  ])

answers = Answer.create([
  {question_id: 1, body: 'Бон Скотт', correct: true},
  {question_id: 1, body: 'Брюс Дикинсон'},
  {question_id: 2, body: 'Benefit', correct: true},
  {question_id: 2, body: 'Aqualung'},
  {question_id: 3, body: 'Луи де Фюнес', correct: true},
  {question_id: 3, body: 'Жан Поль Бельмондо'},
  {question_id: 4, body: 'Клод Моне'},
  {question_id: 4, body: 'Жерар Депардье', correct: true},
  {question_id: 5, body: 'Никита Михалков'},
  {question_id: 5, body: 'Андрей Тарковский', correct: true},
  {question_id: 6, body: 'Плюк', correct: true},
  {question_id: 6, body: 'Шелезяка'}
  ])

passed_tests = PassedTest.create([
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 3},
  {user_id: 2, test_id: 1},
  {user_id: 2, test_id: 2},
  ])
