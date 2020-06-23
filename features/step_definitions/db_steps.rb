# encoding: UTF-8
# language: ru


require 'sqlite3'


Given (/^подключение к базе данных$/) do
  @db = SQLite3::Database.open "C:/Users/Sadof/PycharmProjects/all_in_one/venv/all_in_one/db.sqlite3"
end

Then (/^проверить изменение данных профиля пользователя: "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |fname, lname, email, file, date|
  data = @db.execute("SELECT first_name, last_name, email FROM auth_user WHERE username='Quest'")[0]
  data += @db.execute("SELECT photo, date_of_birth FROM accounts_profile WHERE user_id=76")[0]
  expect(data[0]).to eq fname
  expect(data[1]).to eq lname
  expect(data[2]).to eq email
  # unless file.empty?
  #   expect(data[3]).to eq /^(.*?)#{file}$/
  # end
  if date.empty?
    expect(data[4]).to eq nil
  else
    expect(data[4]).to eq date
  end
end

Then (/^проверить, что данные не сохранились$/) do
  data = @db.execute("SELECT first_name, last_name, email FROM auth_user WHERE username='Quest'")[0]
  data.each do |d|
    expect(d).to eq ''
  end
  data = @db.execute("SELECT photo, date_of_birth FROM accounts_profile WHERE user_id=76")[0]
  expect(data[0]).to eq('users/default-avatar.png')
  expect(data[1]).to eq('')

end

Then (/^очистить данные профиля тестового аккаунта$/) do
  @db.execute("UPDATE auth_user SET first_name = '', last_name='', email='' WHERE username='Quest'")
  # puts @db.execute("SELECT id FROM auth_user WHERE username='Quest'")
  @db.execute("UPDATE accounts_profile SET date_of_birth='', photo='users/default-avatar.png' WHERE user_id=76")
end


Then (/^проверить, что в базе данных "(.*?)" пользователь$/) do |num|
  users = @db.execute("SELECT COUNT(*) FROM auth_user")[0][0]
  expect(users).to be num.to_i
end

Then (/^проверить, что создан пользователь с данным "(.*?)"логином$/) do |login|
  user = @db.execute("SELECT COUNT(*) FROM auth_user WHERE username='#{login}'")[0][0]
  expect(user).to be 1
end

Then(/^очистить базу от пользователей$/) do
  @db.execute("DELETE FROM auth_user WHERE NOT username='Quest'")
end


