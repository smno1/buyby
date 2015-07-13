class RecommendProductsController < ApplicationController
  before_action :set_recommend_product, only: [:show, :edit, :update, :destroy]

  # GET /recommend_products
  # GET /recommend_products.json
  def index
    @recommend_products = RecommendProduct.all
  end

  # GET /recommend_products/1
  # GET /recommend_products/1.json
  def show
  end

  # GET /recommend_products/new
  def new
    @recommend_product = RecommendProduct.new
  end

  # GET /recommend_products/1/edit
  def edit
  end

  # POST /recommend_products
  # POST /recommend_products.json
  def create
    @recommend_product = RecommendProduct.new(recommend_product_params)

    respond_to do |format|
      if @recommend_product.save
        format.html { redirect_to @recommend_product, notice: 'Recommend product was successfully created.' }
        format.json { render :show, status: :created, location: @recommend_product }
      else
        format.html { render :new }
        format.json { render json: @recommend_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommend_products/1
  # PATCH/PUT /recommend_products/1.json
  def update
    respond_to do |format|
      if @recommend_product.update(recommend_product_params)
        format.html { redirect_to @recommend_product, notice: 'Recommend product was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommend_product }
      else
        format.html { render :edit }
        format.json { render json: @recommend_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommend_products/1
  # DELETE /recommend_products/1.json
  def destroy
    @recommend_product.destroy
    respond_to do |format|
      format.html { redirect_to recommend_products_url, notice: 'Recommend product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend_product
      @recommend_product = RecommendProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommend_product_params
      params.require(:recommend_product).permit(:product_id, :active, :reason)
    end
end
