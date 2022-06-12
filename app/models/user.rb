class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # Association
  has_many :links, dependent: :destroy
end
