class Project < ActiveRecord::Base
	has_many :products, :dependent => :destroy
	has_many :works, :dependent => :destroy
	has_many :resources, :dependent => :destroy
  has_many :milestones, :dependent => :destroy
	after_create :init
	#after_destroy :cleanup

  def work_packages
    return self.works.at_depth(3).order(:created_at)
  end
private
	def init
		self.products.create(:name => self.name)
		self.works.create(:name => self.name)
	end
end
