class Product < ActiveRecord::Base
  default_scope order('place')
  scope :top_level#, where(:depth => 0)

  belongs_to :project
  belongs_to :parent, :class_name => 'Product'
  has_many :children, :foreign_key => 'parent_id', :class_name => 'Product'

  def hierachy
    hierachy = ''

    actual = self
    while not actual.nil? do
      hierachy = "#{actual.place}.#{hierachy}"
      actual = actual.parent
    end

    return hierachy
  end
end
