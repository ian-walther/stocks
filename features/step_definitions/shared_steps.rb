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
  step %(I click 'Log in')
end

Then(/^I should be sent to the stocks page$/) do
  expect(current_path).to eql stocks_path
end

And(/^I visit sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill in the registration fields with an email of '(.*)' and a password of '(.*)'$/) do |email, password|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
end

And(/^I click '([^"]*)'$/) do |arg|
  click_on arg
end

And(/^a user should exist with en email of '(.*)'$/) do |email|
  expect(User.where(email: email).count).to eql 1
end

When(/^I fill in the registration fields with an email of '(.*)', a password of '(.*)', and a password confirmation of '(.*)'$/) do |email, password, password_confirmation|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
end

Then(/^I should be sent to the users page$/) do
  expect(current_path).to eql user_registration_path
end

And(/^I should see '(.*)'$/) do |text|
  expect(page).to have_content text
end

And(/^the stock service is stubbed to return a value of '(.*)' for '(.*)'$/) do |value, stock|
  allow(StockService).to receive(:get_opening_price).with(stock).and_return(value.to_f)
end

When(/^I type in a stock name of '(.*)'$/) do |name|
  fill_in 'Enter stock name', with: name
end

Then(/^I should be on the show price page$/) do
  expect(current_path).to eql show_price_path
end

And(/^I don't enter a stock name$/) do
end

And(/^the stock service is stubbed to return an ApiError$/) do
  allow(StockService).to receive(:get_opening_price).and_raise(FinnhubRuby::ApiError)
end