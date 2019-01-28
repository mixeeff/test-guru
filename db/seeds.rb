# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {name: 'Иван Петров', login: 'ipetrov', password: '12345', email: 'ivanpetrov@superpupermail.ru'},
  {name: 'Мария Иванова', login: 'masha888', password: 'butterfly34', email: 'masha888@superpupermail.ru'}
  ])

categories = Category.create!([
  {title: 'музыка'},
  {title: 'кино'}
  ])

tests = Test.create!([
  {title: 'Hard Rock группы', level: 1, category_id: categories[0].id, author_id: users[0].id},
  {title: 'Французские комедии', level: 2, category_id: categories[1].id, author_id: users[1].id},
  {title: 'Кино СССР', level: 3, category_id: categories[1].id}
  ])

questions = Question.create!([
  {test_id: tests[0].id, body: "Имя первого вокалиста группы ACDC"},
  {test_id: tests[0].id, body: "Название первого альбома группы 'Jethro Tull'"},
  {test_id: tests[1].id, body: "Актер игравший жандарма в серии комедий"},
  {test_id: tests[1].id, body: "Партнер Пьера Ришара в фильме 'Невезучие'"},
  {test_id: tests[2].id, body: "Режиссер фильма 'Иваново детство'"},
  {test_id: tests[2].id, body: "Название планеты на которой происходит действие фильма 'Кин-дза-дза'"}
  ])

answers = Answer.create!([
  {question_id: questions[0].id, body: 'Бон Скотт', correct: true},
  {question_id: questions[0].id, body: 'Брюс Дикинсон'},
  {question_id: questions[1].id, body: 'Benefit', correct: true},
  {question_id: questions[1].id, body: 'Aqualung'},
  {question_id: questions[2].id, body: 'Луи де Фюнес', correct: true},
  {question_id: questions[2].id, body: 'Жан Поль Бельмондо'},
  {question_id: questions[3].id, body: 'Клод Моне'},
  {question_id: questions[3].id, body: 'Жерар Депардье', correct: true},
  {question_id: questions[4].id, body: 'Никита Михалков'},
  {question_id: questions[4].id, body: 'Андрей Тарковский', correct: true},
  {question_id: questions[5].id, body: 'Плюк', correct: true},
  {question_id: questions[5].id, body: 'Шелезяка'}
  ])

tests_users = TestsUser.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[0].id, test_id: tests[2].id},
  {user_id: users[1].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id}
  ])
