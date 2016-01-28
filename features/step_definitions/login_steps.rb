Given(/^I'm an unregistered user$/) do
  @user = User.new
end

When(/^I visit "([^"]*)" page$/) do |page|
  visit page
end

Then(/^I will redirect to "([^"]*)" page$/) do |page|
  current_path.should == page
end

Given(/^I'm a registered user$/) do
  @user = User.new(email: 'me@sample.com', password: 'eD04gV07amGyEF')
  @user.save
end

When(/^fill my credentials$/) do
  fill_in "user[email]", :with => @user.email
  fill_in "user[password]", :with => @user.password
end

When(/^fill my credentials with bad password$/) do
  fill_in "user[email]", :with => @user.email
  fill_in "user[password]", :with => 'BadPassword'
end

When(/^I click "([^"]*)" button$/) do |button|
  click_button button
end

Then(/^I see "([^"]*)"$/) do |content|
  page.should have_content(content)
end

Given(/^I'm a signed in user$/) do
  @user = User.new(email: 'me@sample.com', password: 'eD04gV07amGyEF')
  @user.save

  visit '/login'
  fill_in "user[email]", :with => @user.email
  fill_in "user[password]", :with => @user.password
  click_button 'Login'
end

When(/^click in "([^"]*)" link$/) do |content|
  click_link content
end
