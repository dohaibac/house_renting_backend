class House < ApplicationRecord
	belongs_to :user, :foreign_key => :house_owner
	has_many :contracts

	def self.search(search_tearm)
		if search_tearm
	    where('address LIKE ? OR description LIKE ? OR province LIKE ? ', "%#{search_tearm}%", "%#{search_tearm}%", "%#{search_tearm}%").order('id DESC')
	  end
	end
end
