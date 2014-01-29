class ResourcesController < ApplicationController
  before_action :set_resource, only: [:update, :move, :destroy, :get]

  def index
    @project = Project.find(params[:project_id])
    @resources = @project.resources
  end

  def create
    @params = params[:resource]
    @resource = Resource.create(
      :name => @params[:name],
      :group => @params[:group].to_f,
      :qualification => @params[:qualification],
      :experience => @params[:experience],
      :fte => @params[:fte],
      :project_id => params[:project])

    render :json => @resource
  end

  def move
    @resource.insert_at(@params[:position].to_f)
    @resource.save

    render :json => @resource
  end

  def update
    @resource.name = @params[:name]
    @resource.qualification = @params[:qualification]
    @resource.experience = @params[:experience]
    @resource.fte = @params[:fte]
    @resource.save

    render :json => @resource
  end

  def destroy
    @resource.destroy

    render :json => @resource
  end

  def get
  	render :json => @resource
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @params = params[:resource]
      @resource = Resource.find(@params[:id]) if !@params[:id].nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:work).permit(:name, :qualification, :experience, :group, :position, :fte)
    end

end