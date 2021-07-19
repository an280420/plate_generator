class User < ApplicationRecord
  # FORMAT_USERNAME = /\A\w+\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 40 } #, format: { with: FORMAT_USERNAME }
  validates :email, uniqueness: true
  has_many :courses, dependent: :destroy
end
