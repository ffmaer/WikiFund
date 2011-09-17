class InvestmentsController < ApplicationController


  def create
    @project = Project.first
    if @project.investments.create(params[:investment])
      redirect_to root_path
    end

  end

  def vote_up

    project = Project.first
    project.fund = project.fund + 0.1
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote + 1
    if investment.save
      redirect_to root_path
    end

  end


    def vote_down

    project = Project.first
    project.fund = project.fund + 0.2
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote - 1
    if investment.save
      redirect_to root_path
    end

  end
end
