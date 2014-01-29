class ResourceAllocationsController < ApplicationController
  #before_action :set_resource_allocation, only: [:update, :move, :destroy, :get]

  def index
  	@project = Project.find(params[:project_id])
  	@root_node = @project.works.first.root
  end

  def get
    @work = Work.find(params[:work][:id])
    render :json => @work.resources
  end

  def select
    @project = Project.find(params[:project])
    @work = Work.find(params[:work])
    @resources = @project.resources
    @selected_resources = @work.resources.map(&:id)
    render :partial => 'resources_select', :project => @project, :work => @work, :selected_resources => @selected_resources, :resources => @resources
  end

  def update
    @work = Work.find(params[:work])
    @work.resources.destroy_all

    params[:allocated].each do |r|
      resource = Resource.find(r)
      @work.add_resource(resource, 1)
      @work.save
    end

    resources = Work.find(@work.id).resources

    render :text => resources.map(&:name).join(", ")
  end

end