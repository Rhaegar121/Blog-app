first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author_id: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: first_user, title: 'Hello World', text: 'This is my second post')
third_post = Post.create(author_id: second_user, title: 'Hi', text: 'This is my third post')
fourth_post = Post.create(author_id: second_user, title: 'Hi World', text: 'This is my fourth post')

Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!')
Comment.create(post_id: second_post, author_id: first_user, text: 'Hi Lilly!')
Comment.create(post_id: third_post, author_id: second_user, text: 'Hi , this is my first comment')
Comment.create(post_id: fourth_post, author_id: first_user, text: 'Hi , this is my second comment')
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi , this is my third comment')
Comment.create(post_id: second_post, author_id: first_user, text: 'Hi , this is my fourth comment')

Like.create(post_id: first_post, author_id: second_user)
Like.create(post_id: second_post, author_id: first_user)
