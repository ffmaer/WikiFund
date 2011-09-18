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
    #current_user.balance = current_user.balance + 0.1
    current_user.save
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote + 1

    Venmo.donate(current_user,0.1,project.name).deliver


    if investment.save
      redirect_to root_path
    end

  end


  def vote_down

    project = Project.first
    project.fund = project.fund + 0.2
    #current_user.balance = current_user.balance + 0.2
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote - 1
    if investment.save
      redirect_to root_path
    end

  end
end
