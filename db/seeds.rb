bob = User.create(username: "generic", email: "a@gmail.com", password: "password")
tim = User.create(username: "brother", email: "brother@gmail.com", password: "password")
laura = User.create(username: "mother", email: "mother@gmail.com", password: "password")


question1 = Question.create(title:'help please', text:'i am stuck in the mud', user: bob)
question2 = Question.create(title:'How old are monkeys', text:'its a serious question', user: tim)
question3 = Question.create(title:'I want to be', text:'I am not', user: laura)


answer1 = Answer.create(text:'no', question:question1, user:laura)
answer2 = Answer.create(text:'no', question:question2, user:tim)
answer3 = Answer.create(text:'i dont like you question 1', question:question1, user:tim)

answer_comment = Comment.create(text:'answer comment', commentable: answer1, user: tim)

question_comment = Comment.create(text:'question comment', commentable: question1, user: laura)

vote1 = Vote.create(user:bob, voteable:answer1, vote_direction:1)
vote1 = Vote.create(user:laura, voteable:answer1, vote_direction:1)
vote1 = Vote.create(user:tim, voteable:answer1, vote_direction:1)

vote2 = Vote.create(user:laura, voteable:answer2, vote_direction:-1)
