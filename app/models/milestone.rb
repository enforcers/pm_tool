class Milestone < ActiveRecord::Base
  belongs_to :project
  scope :past, -> { where('start_at < ?', Date.today)}
end
