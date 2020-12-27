FactoryBot.define do
  factory :user do
    name { 'someValidName' }
    email { 'someValidMail@mail.ru' }
    password { 'someVerySafePassword' }
  end
end
