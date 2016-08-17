class College < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :notes, dependent: :destroy
end
