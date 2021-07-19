FactoryBot.define do
  # Название фабрики (template)
  factory :template do
    # Генерируем последовательность уникальных шаблонов
    # Параметр n гарантирует уникальность
    sequence(:name) { |n| "Шаблон №#{n}" }

    sequence(:body) { |n| "Шаблон №#{n} *****{{course.name}}*****"}
  end
end
