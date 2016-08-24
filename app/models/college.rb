class College < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :notes, dependent: :destroy
	def self.search(search)
	  if search
	    find(:name, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
