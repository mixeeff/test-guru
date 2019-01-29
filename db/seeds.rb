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
  {title: 'Hard Rock группы', level: 1, category: categories[0], author: users[0]},
  {title: 'Французские комедии', level: 2, category: categories[1], author: users[1]},
  {title: 'Кино СССР', level: 3, category: categories[1]},
  {title: 'Art и Progressive Rock группы', level: 5, category: categories[1]}
  ])

questions = Question.create!([
  {test: tests[0], body: "Имя первого вокалиста группы ACDC"},
  {test: tests[0], body: "Название первого альбома группы 'Jethro Tull'"},
  {test: tests[1], body: "Актер игравший жандарма в серии комедий"},
  {test: tests[1], body: "Партнер Пьера Ришара в фильме 'Невезучие'"},
  {test: tests[2], body: "Режиссер фильма 'Иваново детство'"},
  {test: tests[2], body: "Название планеты на которой происходит действие фильма 'Кин-дза-дза'"},
  {test: tests[3], body: "Основатель, вокалист и композитор Van der Graaf Generator"},
  {test: tests[3], body: "Что изображено на обложке альбома Dark side of the moon"},
  ])

Answer.create!([
  {question: questions[0], body: 'Бон Скотт', correct: true},
  {question: questions[0], body: 'Брюс Дикинсон'},
  {question: questions[1], body: 'Benefit', correct: true},
  {question: questions[1], body: 'Aqualung'},
  {question: questions[2], body: 'Луи де Фюнес', correct: true},
  {question: questions[2], body: 'Жан Поль Бельмондо'},
  {question: questions[3], body: 'Клод Моне'},
  {question: questions[3], body: 'Жерар Депардье', correct: true},
  {question: questions[4], body: 'Никита Михалков'},
  {question: questions[4], body: 'Андрей Тарковский', correct: true},
  {question: questions[5], body: 'Плюк', correct: true},
  {question: questions[5], body: 'Шелезяка'},
  {question: questions[6], body: 'Роберт Фрипп'},
  {question: questions[6], body: 'Питер Хэммилл'},
  {question: questions[6], body: 'Йон Андерсон'},
  {question: questions[6], body: 'Джим Моррисон'},
  {question: questions[7], body: 'Призма'},
  {question: questions[7], body: 'Линза'},
  {question: questions[7], body: 'Калейдоскоп'}
  ])

tests_users = TestsUser.create!([
  {user: users[0], test: tests[0]},
  {user: users[0], test: tests[2]},
  {user: users[1], test: tests[0]},
  {user: users[1], test: tests[1]}
  ])
