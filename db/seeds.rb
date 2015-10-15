include RandomData
 
 # Create Posts
 50.times do
 	Post.create!(
 		title:  RandomData.random_sentence,
     	body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
   	post: posts.sample,
    body: RandomData.random_paragraph
   )
 end 


 Post.find_or_create_by(title: "I'm Unique!", body: "Also Unique!!! a couple more characters")

 Comment.find_or_create_by(post_id: 2, body: "Comments don't have titles")

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"