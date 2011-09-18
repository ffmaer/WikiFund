class InvestmentsController < ApplicationController


  def create
    @project = Project.first
    if @project.investments.create(params[:investment])
      redirect_to root_path
    end

  end


  def invest

    @project = Project.first
    counter = 5
    @project.fund = @project.fund + 1

    params[:investments].each do |investment|
      name = investment[1]
      if name != ""
        temp_investment = @project.investments.find_or_initialize_by_name(name)
        if !temp_investment.new_record?
          temp_investment.vote = temp_investment.vote + counter + 1
          temp_investment.save
        else
          temp_investment.vote = counter
          temp_investment.save
        end
        counter = counter - 1
      end
    end
    @project.save
    redirect_to root_path
  end


  def vote_up

    dollar = 0.1
    project = Project.first
    project_name = project.name

    project.fund = project.fund + dollar
    current_user.save
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote + 1

    Venmo.donate(current_user, dollar, project_name).deliver


    if investment.save
      flash[:alert] = %Q{Thank your for your support! Please complete the donation by using <a href="http://venmo.com/?txn=Pay&recipients=ffmaer&amount=#{dollar}note=Donate #{dollar} to make #{project_name} more awesome!">Venmo</a>.}
      redirect_to root_path
    end

  end


  def vote_down


    dollar = 0.2
    project = Project.first
    project_name = project.name

    project.fund = project.fund + dollar
    current_user.save
    project.save

    investment = Investment.find(params[:investment_id])
    investment.vote = investment.vote - 1

    Venmo.donate(current_user, dollar, project_name).deliver


    if investment.save
      flash[:alert] = %Q{Thank your for your support! Please complete the donation by using <a href="http://venmo.com/?txn=Pay&recipients=ffmaer&amount=#{dollar}note=Donate #{dollar} to make #{project_name} more awesome!">Venmo</a>.}
      redirect_to root_path
    end


  end

end
