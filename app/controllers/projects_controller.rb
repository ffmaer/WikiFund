class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def check_stock
    stock=params[:stock]
    @put = %Q{ <script src="http://charts.wikinvest.com/wikinvest/wikichart/javascript/scripts.php" type="text/javascript"></script><div id="wikichartContainer_D0A86320-BD05-64F4-7D4A-79B0FE51817C"><div style="width: 425px; text-align: center; vertical-align: center; margin-top: 22px;"><a href="http://get.adobe.com/flashplayer/"><img src="http://cdn.wikinvest.com/wikinvest/images/adobe_flash_logo.gif" alt="Flash" style="border-width: 0px;"/><br/>Flash    Player 9 or higher is required to view the chart<br/><strong>Click here to download Flash Player    now</strong></a></div></div> <script type="text/javascript">if (typeof(embedWikichart) != "undefined") {   embedWikichart("http://charts.wikinvest.com/WikiChartMini.swf", "wikichartContainer_D0A86320-BD05-64F4-7D4A-79B0FE51817C", "425", "300", {"liveQuote":"true","startDate":"17-03-2011","showAnnotations":"true","ticker":"#{stock}","endDate":"17-09-2011","embedCodeDate":"2011-9-17"}, {}); }</script> <div style="font-size:9px;text-align:right;width:390px;font-family:Verdana"><a href="http://www.wikinvest.com/chart/#{stock}" style="text-decoration:underline; color:#0000ee;">View the full #{stock} chart</a> at <a href="http://www.wikinvest.com/">Wikinvest</a></div>}
    render :layout => 'blank'

  end

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
