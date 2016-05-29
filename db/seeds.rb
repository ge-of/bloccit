include RandomData

 # Create Posts
50.times do
 # #1
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

puts "#{Post.count}"
puts "#{Comment.count}"

unique_post = Post.find_or_create_by(title: "Unique title", body: "IUnique body")
Comment.find_or_create_by(body: "Unique comment body", post: unique_post)

puts "#{Post.count}"
puts "#{Comment.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
