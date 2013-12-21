class Pbs < ActiveRecord::Base
	default_scope order('"order"') 
	scope :top_level, where(:depth => 0)

	belongs_to :project
	belongs_to :parent, :class_name => 'Pbs'
	has_many :childs, :foreign_key => 'parent_id', :class_name => 'Pbs'

	def is_last_sibling?
		if self.parent.nil?
			return false
		else
			return self.eql?(self.parent.childs.last)
		end
	end

	def is_first_sibling?
		if self.parent.nil?
			return false
		else
			return self.eql?(self.parent.childs.first)
		end
	end

	def can_have_childs?
		return (self.depth < 2)
	end
end
