class Project < ActiveRecord::Base
	has_many :products, -> { top_level }, :dependent => :destroy
end
