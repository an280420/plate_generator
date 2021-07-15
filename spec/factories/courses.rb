FactoryBot.define do
  factory :course do
    # Cвязи с user и шаблоном
    association :user
    association :template

    # Сгенерим случайные параметры для курса
    name { "Курс №#{rand(999)}"}
    level { %w(soft medium hard).sample }
    volume { "#{rand(999)} hours"}
  end
end
