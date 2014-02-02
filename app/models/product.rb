class Product < ActiveRecord::Base
  default_scope { order('position') }
  scope :root, -> { where(parent_id: nil) }

  belongs_to :project
  has_ancestry :cache_depth => true
  acts_as_list :scope => 'ancestry = \'#{ancestry}\''
  before_destroy :destroy_childs

  def to_json(otions)
    super(:only => [:id, :name, :parent_id, :position, :project_id], :methods => [:depth])
  end

private
  def destroy_childs
    self.children.delete_all
  end
end
