# encoding: UTF-8
# language: ru

EDIT_PAGE_URL = "http://localhost:8000/accounts/edit/"
EDIT_FNAME_INPUT = "//input[@id='id_first_name']"
EDIT_LNAME_INPUT = "//input[@id='id_last_name']"
EDIT_EMAIL_INPUT = "//input[@id='id_email']"
EDIT_EMAGE_INPUT = "//input[@id='id_photo']"
EDIT_DATE_INPUT = "//input[@id='id_date_of_birth']"
EDIT_SUBMIT_BUTTON = "//input[@type='submit']"
EDIT_SUCCESS_MESSAGE ="//li[@class='success']"
EDIT_ERROR_MESSAGE ="//li[@class='error']"

Given (/^перейти на страницу редактирования профиля$/) do
  visit EDIT_PAGE_URL
end

Then (/^проверить наличие основныч элементов страницы редактирования/) do
  page.find(EDIT_DATE_INPUT)
  page.find(EDIT_FNAME_INPUT)
  page.find(EDIT_LNAME_INPUT)
  page.find(EDIT_EMAGE_INPUT)
  page.find(EDIT_EMAIL_INPUT)
  page.find(EDIT_SUBMIT_BUTTON)
end

Then (/^заполнить поля данными: "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |fname, lname, email, file, date|
  page.find(EDIT_FNAME_INPUT).send_keys fname
  page.find(EDIT_LNAME_INPUT).send_keys lname
  page.find(EDIT_EMAIL_INPUT).send_keys email
  unless file.empty?
    page.find(EDIT_EMAGE_INPUT).send_keys File.expand_path(file)
  end
  page.find(EDIT_DATE_INPUT).send_keys date
end

Then (/^нажать на кнопку редактирования$/) do
  page.find(EDIT_SUBMIT_BUTTON).click
end

Then (/^проверить наличие сообщение о изменении данных?/) do
  page.find(EDIT_SUCCESS_MESSAGE)
  end

Then (/^проверить наличие сообщение о ошибке изменения данных?/) do
  page.find(EDIT_ERROR_MESSAGE)
end


