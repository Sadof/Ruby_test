# encoding: UTF-8
# language: ru

Given(/^Переходим на страницу "(.*?)"$/) do |page|
  visit page
end

Given(/^Вводим текст "(.*?)" в поле c id "(.*?)"$/) do |text, field_id|
  find("//input[@id='#{field_id}']").set(text)
end

Given(/^Выбираем текст "(.*?)" в выпадающем списке с id "(.*?)"$/) do |text, select_id|
  find("//select[@id='#{select_id}']/option[text()='#{text}']").click
end

Given(/^Нажимаем кнопку с текстом "(.*?)"$/) do |text|
  find("//input[@value='#{text}']").click
end

Then (/^Ожидаем (\d+) секунд(?:|ы)$/) do |sec|
  sleep sec.to_i
end

Then (/^Проверить наличие элемента с id "(.*?)"$/) do |elem_id|
  #find("//*[@id='#{elem_id}']")
  page.has_xpath?("//*[@id='#{elem_id}']")
end

Given (/^Проверить наличие элемента с текстом "(.*?)"$/) do |elem_text|
  find("//*[text()='#{elem_text}']")
end

