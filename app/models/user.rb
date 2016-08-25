class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes

  # each checklist is an item within the overall checklist
  has_many :checklists
  has_and_belongs_to_many :colleges
end
