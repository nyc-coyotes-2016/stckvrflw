lindsay = User.create(username: "lindzlady", email: "lindsay@gmail.com", password: "password")
jason = User.create(username: "jpperlm", email: "jason@gmail.com", password: "password")
asiya = User.create(username: "asyaasha", email: "asiya@gmail.com", password: "password")
nan = User.create(username: "nanutza", email: "nan@gmail.com", password: "password")
generic = User.create(username: "genericperson", email: "generic@gmail.com", password: "password")
tim = User.create(username: "timmy", email: "tim@gmail.com", password: "password")

question1 = Question.create(title:'Which enumerable should I use?', text:'I am torn between using inject or reduce. Which enumerable is better?', user: generic)

question2 = Question.create(title:'What does ajax mean?', text:'I keep hearing about it in programming, but I thought it was a type of cleaner.', user: asiya)

question3 = Question.create(title:'Should I attend Dev Bootcamp?', text:'I hear that it is a cool place, but I am not sure. Any thoughts?', user: nan)

question4 = Question.create(title:'help please', text:'i am trapped in an infinite loop', user: jason)

question5 = Question.create(title:'Super serious question', text:'How do I put emojis in my commit messages?', user: lindsay)

question6 = Question.create(title:'Which programming language should I learn?', text:'I want to learn, but I cannot pick a language. What should I choose?', user: generic)


answer1 = Answer.create(text:'Team Inject!', question:question1, user:lindsay)
answer2 = Answer.create(text:'Team Reduce!', question:question1, user:tim)
answer3 = Answer.create(text:'Stands for Asynchronous JavaScript and XML', question:question2, user:nan)
answer4 = Answer.create(text:'I hear it works great on windows...', question:question2, user:tim)
answer5 = Answer.create(text:'Yes', question:question3, user:asiya)
answer6 = Answer.create(text:'Did you forget to increment your loop?', question:question4, user:generic)
answer7 = Answer.create(text:'My vote is for LOLCode', question:question6, user:jason)



question_comment = Comment.create(text:'I thought they were the same thing...', commentable: question1, user: nan)

answer_comment = Comment.create(text:'Is that a pun?', commentable: answer4, user: lindsay)

vote1 = Vote.create(user:jason, voteable:answer1, vote_direction:1)
vote2 = Vote.create(user:lindsay, voteable:answer2, vote_direction:-1)
vote3 = Vote.create(user:tim, voteable:answer1, vote_direction:1)
vote4 = Vote.create(user:asiya, voteable:answer2, vote_direction:-1)

 
