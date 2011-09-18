class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @project = Project.first
    @investments = @project.all_investments_sorted_by_vote

    @new_investment = @project.investments.new
    @arr = ["Top Pick", "2nd Pick", "3rd Pick", "4th Pick", "5th Pick"]
    5.times do
      @project.investments.build
    end
  end




  def get_stocks

    q=params[:q]
    is_finding = false
    file = File.new("companylist.txt", "r")
    results_arr = {}
    while (line = file.gets)
      temp_arr = line.split("\t")
      first = temp_arr[0]
      second = temp_arr[1]
      third = temp_arr[2]
      if first[0, q.length] == q
        is_finding = true
        results_arr[first] = %Q{<option value="#{first}">#{first} (#{second}): #{third}</option>}
      elsif is_finding
        break
      end
    end
    file.close


    @json = results_arr.to_json

    render :layout => 'blank'


  end
end
