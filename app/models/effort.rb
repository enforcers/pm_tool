class Effort < ActiveRecord::Base
  scope :delphi, -> { where(:method => 0) }
  scope :expectation, -> { where(:method => [1, 2, 3]) }
  belongs_to :work
end
