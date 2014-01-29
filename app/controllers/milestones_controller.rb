class MilestonesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])

    @milestones = @project.milestones

    if request.format.json?
      @today = Array.wrap(Milestone.new(:name => 'Today', :description => ' ', :start_at => Date.today, :end_at => Date.today))
      @start_at_slide = @milestones.past.count + 1
      @milestones += @today
      @first = @milestones.first
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    milestone = params[:milestone]
    @milestone = Milestone.new(
      :name => milestone[:name],
      :description => milestone[:description],
      :start_at => milestone[:start_at].to_date,
      :end_at => milestone[:end_at].nil? ? nil : milestone[:end_at].to_date,
      :project_id => milestone[:project_id]
    )

    @milestone.save

    render :json => @milestone
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy
    render :json => @milestone
  end
end