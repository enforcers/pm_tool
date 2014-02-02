class Work < ActiveRecord::Base
  default_scope { order('position') }

  belongs_to :project
  has_ancestry :cache_depth => true
  belongs_to :output, :class_name => 'Product'
  has_many :resource_allocations
  has_many :resources, :through => :resource_allocations
  accepts_nested_attributes_for :resource_allocations
  has_many :efforts, :dependent => :destroy
  acts_as_list :scope => 'ancestry = \'#{ancestry}\''
  before_destroy :destroy_childs

  def to_json(otions)
    super(:only => [:id, :name, :parent_id, :position, :project_id, :output_id], :methods => [:depth])
  end

  def add_resource(resource, amount)
    ResourceAllocation.create(:work => self, :resource => resource, :amount => amount)
  end

  def expectation(type)
    # 1 - pessimistic
    # 2 - realistic
    # 3 - optimistic

    return self.efforts.expectation.where(:method => type).first
  end

  def average_estimate(group)
    if (group == 0) #delphi
      #estimations = self.efforts.delphi.map(&:estimation)
      avg = self.efforts.delphi.average(:estimation)#(estimations.sum.to_f / estimations.size) if !estimations.blank?
    else #expectation
      if (self.efforts.expectation.count >= 3)
        avg = (expectation(1).estimation + 4*expectation(2).estimation + expectation(3).estimation) / 6
      end
    end

    avg = avg.round(1) if !avg.nil?

    return avg
  end

private
  def destroy_childs
    self.children.delete_all
  end
end
