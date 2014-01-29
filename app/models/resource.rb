class Resource < ActiveRecord::Base
  default_scope { order('position') }
  scope :internal, -> { where(group: 0) }
  scope :external, -> { where(group: 1) }

  belongs_to :project
  acts_as_list :scope => 'project_id=#{project_id} AND #{connection.quote_column_name("group")} = #{group}'
end
