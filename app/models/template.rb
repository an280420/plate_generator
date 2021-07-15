class Template < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :body, presence: true
end
