class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :move, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @products = @project.products
  end

  def create
    @product = Product.create(:name => params[:product][:name], :parent_id => params[:product][:parent], :project_id => params[:project])
    render :json => @product
  end

  def move
    #@product.remove_from_list
    @product.parent_id = params[:product][:parent].to_f
    @product.save
    @product.insert_at(params[:product][:position].to_f)
    @product.save

    render :json => @product
  end

  def update
    @product.name = params[:product][:name]
    @product.save

    render :json => @product
  end

  def destroy
    @product.destroy

    render :json => @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product][:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :position, :project_id, :parent_id)
    end
end
