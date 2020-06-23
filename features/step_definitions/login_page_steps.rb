# encoding: UTF-8
# language: ru

LOGIN_PAGE_URL = "http://localhost:8000/accounts/login/"
LOGIN_USERNAME_INPUT = "//*[@id='id_username']"
LOGIN_PASSWORD_INPUT = "//*[@id='id_password']"

LOGIN_SUBMIT_BUTTON = "//input[@value='login']"

Given (/^Я открываю страницу авторизации$/) do
  visit LOGIN_PAGE_URL
end

Given (/^залогиниться на тестовый аккаунт$/) do
  visit LOGIN_PAGE_URL
  fill_in "username", with: "Quest"
  fill_in "password", with: "Sadof123"
  page.find(LOGIN_SUBMIT_BUTTON).click
end

Then (/^Страница должна иметь поля логина, пароля и кнопку "login"$/) do
  page.find(LOGIN_USERNAME_INPUT)
  page.find(LOGIN_PASSWORD_INPUT)
  page.find(LOGIN_SUBMIT_BUTTON)
end


When (/^Ввожу данные логин "(.*?)" и пароль "(.*?)"$/) do |login, password|
  fill_in "username", with: login
  fill_in "password", with: password
end

When (/^нажимаю на кнопку логина$/) do
  page.find("//input[@value='login']").click
end

Then (/^вывод ошибки о неправильном логине или логине$/) do
  page.find("//*[contains(text(),'Your username and password didn')]")
end

Then (/^редирект на страницу редактирования профиля$/) do
  page.find("//p[contains(text(),'Edit')]")
end



