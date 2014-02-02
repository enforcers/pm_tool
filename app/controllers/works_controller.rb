class WorksController < ApplicationController
  before_action :set_work, only: [:update, :move, :output, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @works = @project.works
  end

  def create
    @work = Work.create(:name => params[:work][:name], :parent_id => params[:work][:parent], :project_id => params[:project])
    render :json => @work
  end

  def move
    @work.remove_from_list
    @work.parent_id = params[:work][:parent].to_f
    @work.save
    @work.insert_at(params[:work][:position].to_f)
    @work.save

    render :json => @work
  end

  def update
    @work.name = params[:work][:name]
    @work.output_id = params[:work][:output]
    @work.save

    render :json => @work
  end

  def output
    render :json => @work.output_id
  end

  def destroy
    @work.destroy

    render :json => @work
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:work][:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:name, :position, :project_id, :parent_id, :output_id)
    end
end