# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Naledi Dikgale', photo: 'https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg', bio: 'Undisputed Queen of DIY', email: 'naledi@gmail', password: 'password')
second_user = User.create(name: 'Judy Hobbs', photo: 'https://costumesheaven.b-cdn.net/wp-content/uploads/2022/05/Judy_is_awesome.PNG.jpg', bio: 'Rabbit cop from Zootopia', email: 'judy@gmail', password: 'password')
third_user = User.create(name: 'Nick Wilde', photo: 'https://kh.wiki.gallery/images/2/24/Nick_Wilde_KHUX.png', bio: 'Fox con artist from Zootopia' , email: 'nick@gmail', password: 'password')
fourth_user = User.create(name: 'Chief Bogo', photo: 'https://static.tvtropes.org/pmwiki/pub/images/bongo_9.png', bio: 'Police chief from Zootopia' , email: 'chief@gmail', password: 'password')
fifth_user = User.create(name: 'Dawn Bellwether', photo: 'https://static.wikia.nocookie.net/zootopia/images/5/54/Personality-Bellwether2.png/revision/latest?cb=20161216000042', bio: 'Sheep mayor from Zootopia' , email: 'dawn@gmail', password: 'password')

first_post = Post.create(author_id: first_user.id, title:'How to make a table', text: 'Get wood. Get tools. Build table.')
second_post = Post.create(author_id: second_user.id, title:'How to solve a crime', text: 'Catch the criminal.')
third_post = Post.create(author_id: third_user.id, title:'How to be a con artist', text: 'Con people.')
fourth_post = Post.create(author_id: fourth_user.id, title:'How to be a police chief', text: 'Be a police chief.')
fifth_post = Post.create(author_id: fifth_user.id, title:'How to be a mayor', text: 'Be a mayor.')

first_comment = Comment.create(author_id: first_user.id, post_id: first_post.id, text: 'Great post!')
second_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'Good post!')
third_comment = Comment.create(author_id: third_user.id, post_id: third_post.id, text: 'Bad post!')
fourth_comment = Comment.create(author_id: fourth_user.id, post_id: fourth_post.id, text: 'Awesome post!')
fifth_comment = Comment.create(author_id: fifth_user.id, post_id: fifth_post.id, text: 'Wicked post!')
sixth_comment = Comment.create(author_id: first_user.id, post_id: second_post.id, text: 'Cool post!')

first_like = Like.create(author_id: second_user.id, post_id: first_post.id)
second_like = Like.create(author_id: third_user.id, post_id: second_post.id)
third_like = Like.create(author_id: fourth_user.id, post_id: third_post.id)
fourth_like = Like.create(author_id: fifth_user.id, post_id: fourth_post.id)
fifth_like = Like.create(author_id: first_user.id, post_id: fifth_post.id)
