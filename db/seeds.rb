Ross = User.create(name: 'Ross', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
Monica = User.create(name: 'Monica', photo: 'https://picsum.photos/id/24/200', bio: 'Teacher from Poland.', posts_counter: 0)
Joey = User.create(name: 'Joey', photo: 'https://picsum.photos/id/25/200', bio: 'Teacher from USA.', posts_counter: 0)
Chandler = User.create(name: 'Chandler', photo: 'https://picsum.photos/id/26/200', bio: 'Teacher from Zambia.', posts_counter: 0)

first_post = Post.create(author_id: Ross.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: Monica.id, title: 'Hello World', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: Joey.id, title: 'Hi', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: Chandler.id, title: 'Hi World', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

Comment.create(post_id: first_post.id, author_id: Ross.id, text: 'Hi , Ross!')
Comment.create(post_id: second_post.id, author_id: Monica.id, text: 'Hi , Monica!')
Comment.create(post_id: third_post.id, author_id: Joey.id, text: 'Hi , Joey!')
Comment.create(post_id: fourth_post.id, author_id: Chandler.id, text: 'Hi , Chandler!')
Comment.create(post_id: first_post.id, author_id: Ross.id, text: 'Hi , this is my first comment')
Comment.create(post_id: second_post.id, author_id: Monica.id, text: 'Hi , this is my second comment')
Comment.create(post_id: third_post.id, author_id: Joey.id, text: 'Hi , this is my third comment')
Comment.create(post_id: fourth_post.id, author_id: Chandler.id, text: 'Hi , this is my fourth comment')

Like.create(post_id: first_post.id, author_id: Ross.id)
Like.create(post_id: second_post.id, author_id: Monica.id)
Like.create(post_id: third_post.id, author_id: Joey.id)
Like.create(post_id: fourth_post.id, author_id: Chandler.id)
