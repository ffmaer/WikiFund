class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @project = Project.first
    @investments = @project.all_investments_sorted_by_vote

    @new_investment = @project.investments.new

    5.times do
      @project.investments.build
    end
  end


  def update
    @project = Project.first

    counter = 5

    params[:project][:investments_attributes].each do |investment|
      name = investment[1]["name"]
      if name != ""
        temp_investment = @project.investments.find_or_initialize_by_name(name)
        if !temp_investment.new_record?
          temp_investment.vote = temp_investment.vote + counter
          temp_investment.save
        else
          temp_investment.vote = counter
          temp_investment.save
        end
        counter = counter - 1
      end
    end

    redirect_to root_path


  end
end
