class EffortsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])

    if params.has_key?(:project)
      @project.estimation_method = params[:project][:estimation_method].to_f
      @project.save
    end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'effort_estimation', :template => 'efforts/estimation', :disposition => 'attachment'
      end
    end
  end

  def create
    effort = params[:effort]

    if (effort[:method] == 0) #delphi
      @effort = Effort.create(
        :work_id => effort[:work_id].to_f,
        :method => effort[:method].to_f,
        :name => effort[:name],
        :estimation => effort[:estimation].to_f
      )

      render :json => @effort
    else #expectation
      @work = Work.find(effort[:work_id])
      @effort = Array.new
      pessimistic = @work.expectation(1)
      realistic = @work.expectation(2)
      optimistic = @work.expectation(3)

      if pessimistic.nil?
        @effort << Effort.create(
          :work_id => effort[:work_id].to_f,
          :method => 1,
          :estimation => effort[:pessimistic].to_f
        )
      else
        pessimistic.estimation = effort[:pessimistic].to_f
        pessimistic.save
        @effort << pessimistic
      end

      if realistic.nil?
        @effort << Effort.create(
          :work_id => effort[:work_id].to_f,
          :method => 2,
          :estimation => effort[:realistic].to_f
        )
      else
        realistic.estimation = effort[:realistic].to_f
        realistic.save
        @effort << realistic
      end

      if optimistic.nil?
        @effort << Effort.create(
          :work_id => effort[:work_id].to_f,
          :method => 3,
          :estimation => effort[:optimistic].to_f
        )
      else
        optimistic.estimation = effort[:optimistic].to_f
        optimistic.save
        @effort << optimistic
      end

      render :text => @work.average_estimate(1).to_s + ' PD'
    end
  end

  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy

    render :json => @effort
  end

  def results
    @project = Project.find(params[:project_id])

    render :partial => 'delphi_results'
  end
end