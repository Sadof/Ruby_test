# encoding: UTF-8
# language: ru

REGISTRATION_PAGE_URL = "http://localhost:8000/accounts/registration/"
REGISTRATION_USERNAME_INPUT = "//input[@id='id_username']"
REGISTRATION_PASSWORD_INPUT = "//input[@id='id_password1']"
REGISTRATION_CONF_INPUT = "//input[@id='id_password2']"
REGISTRATION_SUBMIT_BUTTON = "//input[@value='Registrate']"
REGISTRATION_ALERT = ".alert.alert-danger"
REGISTRATION_H1 = "//h1[contains(text(),'Registration')]"


Given (/^перейти на страницу регистрации$/) do
  visit REGISTRATION_PAGE_URL
end

Then (/^проверить, что это страница регистрации$/) do
  page.find(REGISTRATION_H1)
  page.find(REGISTRATION_USERNAME_INPUT)
  page.find(REGISTRATION_PASSWORD_INPUT)
  page.find(REGISTRATION_CONF_INPUT)
  page.find(REGISTRATION_SUBMIT_BUTTON)
end

When (/^заполняю поля: логин="(.*?)", пароль="(.*?)", подверждение="(.*?)"$/) do |login, pass1, pass2|
  page.find(REGISTRATION_USERNAME_INPUT).send_keys(login)
  page.find(REGISTRATION_PASSWORD_INPUT).send_keys(pass1)
  page.find(REGISTRATION_CONF_INPUT).send_keys(pass2)
  page.find(REGISTRATION_SUBMIT_BUTTON).click
end


Then (/^проверить сообщение о ошибке$/) do
  expect(page).to have_css(REGISTRATION_ALERT)
end

