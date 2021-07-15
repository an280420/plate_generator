class Course < ApplicationRecord
  belongs_to :template
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
