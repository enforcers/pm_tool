class Project < ActiveRecord::Base
	has_many :pbs, -> { top_level }, :class_name => 'Pbs', :dependent => :destroy
end
