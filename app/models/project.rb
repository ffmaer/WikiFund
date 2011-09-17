class Project < ActiveRecord::Base
  has_many :investments
  accepts_nested_attributes_for :investments
  def all_investments_sorted_by_vote
    self.investments.all(:order=> "vote DESC")
  end
end
