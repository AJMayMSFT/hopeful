class Group < ApplicationRecord
  belongs_to :user
  has_many :members, :dependent => :destroy
  has_many :user_members, through: :members, source: :user
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
