class User < ApplicationRecord
  has_secure_password
  belongs_to :team
  has_many :tasks

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
