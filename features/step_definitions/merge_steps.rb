Given /^the articles are set up$/ do
  
  user_one            = User.new
  user_one.name       = "Fulano"
  user_one.login      = "Fulano"
  user_one.password   = "Fulano"
  user_one.email      = "fulano@fulano.com"
  user_one.profile_id = 2
  user_one.save

  user_two            = User.new
  user_two.name       = "Mengano"
  user_two.login      = "Mengano"
  user_two.password   = "Mengano"
  user_two.email      = "mengano@mengano.com"
  user_two.profile_id = 3
  user_two.save
  
  article_one                = Article.new
  article_one.title          = "Article One"
  article_one.author         = "Fulano"
  article_one.body           = "<p>Hello</p>"
  article_one.allow_comments = true
  article_one.published      = true
  article_one.user_id        = user_one.id
  article_one.save # id 3

  article_two                = Article.new
  article_two.title          = "Article Two"
  article_two.author         = "Mengano"
  article_two.body           = "<p>Goodbye</p>"
  article_two.allow_comments = true
  article_two.published      = true
  article_two.user_id        = user_two.id
  article_two.save # id 4
  
  comment_one            = Comment.new
  comment_one.article_id = article_one.id
  comment_one.author     = "Robin"
  comment_one.body       = "Comment One"
  comment_one.save
  
  comment_two            = Comment.new
  comment_two.article_id = article_two.id
  comment_two.author     = "Daniel"
  comment_two.body       = "Comment Two"
  comment_two.save
  
end

And /^I am logged with a normal user$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'Fulano'
  fill_in 'user_password', :with => 'Fulano'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Then /"(.*)" should be the author of article (\d+)$/ do |author, id|
  article = Article.find(id)
  article.author.should be == author
end

Given /^I merge article (\d+) and (\d+)$/ do |one, two|
  article = Article.find(one)
  article.merge_with(two)
end


