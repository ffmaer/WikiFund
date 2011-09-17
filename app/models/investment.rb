class Investment < ActiveRecord::Base
  belongs_to :project

  before_save :default_values

  def default_values
    self.vote = 1 unless self.vote
  end
end
