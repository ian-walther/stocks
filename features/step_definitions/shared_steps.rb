Given(/^I am not logged in$/) do
end

When(/^I visit the home page$/) do
  visit '/'
end

Then(/^I should be sent to the login page$/) do
  expect(current_path).to eql('/users/sign_in')
end

Given(/^a user exists with the email '(.*)' and the password '(.*)'$/) do |email, password|
  User.create!(email: email, password: password)
end

And(/^I visit the login page$/) do
  visit '/users/sign_in'
end

And(/^I enter in the email '(.*)' and the password '(.*)'$/) do |email, password|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
end

When(/^I click on the login button$/) do
  click_on 'Log in'
end

Then(/^I should be sent to the home page$/) do
  expect(current_path).to eql('/')
end

When(/^I visit the stocks page$/) do
  visit stocks_path
end

Given(/^I am logged in$/) do
  step %(a user exists with the email 'a@a.aa' and the password '123456')
  step %(I visit the login page)
  step %(I enter in the email 'a@a.aa' and the password '123456')
  step %(I click on the login button)
end

Then(/^I should be sent to the stocks page$/) do
  expect(current_path).to eql stocks_path
end