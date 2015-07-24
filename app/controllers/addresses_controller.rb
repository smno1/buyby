class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :redirect_unless_admin, only: [:index]


  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  def my_address
    @addresses = current_user.addresses
  end


  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    respond_to do |format|
      if @address.save
        current_user.update(:current_address_id=>@address.id)
        format.html { redirect_to :root, notice: '注册成功' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        # format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_new_address
    @address=Address.new(:postcode=>params[:postcode], :state=>params[:state], :city=>params[:city], :street=>params[:street], :user_id=>current_user.id)
    @address.save
  end

  def commit_new_address
    @address=Address.new(:postcode=>params[:postcode], :state=>params[:state], :city=>params[:city], :street=>params[:street], :user_id=>current_user.id)
    @address.save
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: t(:successful)+t(:update) }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: t(:successful)+t(:destroy) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:postcode, :state, :city, :street, :user_id)
    end
end
