class ProjectsController < ApplicationController
  before_action :set_project, only: [:destroy]

  def create
    @project = Project.new(project_params)
    #@product = Product.new(:name => @project.name, :project => @project)

    respond_to do |format|
      if @project.save# and @product.save
        format.html { redirect_to project_products_path(@project), notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
