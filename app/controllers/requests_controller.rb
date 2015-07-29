class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :redirect_unless_admin, only: [:edit, :update, :destroy]


  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @offer_status=Status.where(status_type: "offer")
    if(params[:read]&& !@request.offers.last.nil?)
      @request.offers.each do |offer|
        offer.update(:read=>true)
      end
    end
  end

  def commit_reply_comment
    comment=Comment.new(:content=>params[:comment_content],:user_id=>params[:user_id],
      :offer_id=>params[:offer_id], :read=>false)
    respond_to do |format|
      if comment.save
        if current_user.id==comment.offer.user_id
          WebsocketRails[comment.offer.request.user.id].trigger("user_notification",{:message => '您收到新的回复'})
        else
          WebsocketRails[comment.offer.user.id].trigger("user_notification",{:message => '您收到新的回复'})
        end
        format.html { redirect_to :back, notice: t(:reply_successful) }
        format.json {}
      else
        format.html { redirect_to :back }
        format.json {}
      end
    end
  end

  def update_unread_comment
    Offer.find(params[:offer_id]).comments.each do |comment|
      comment.update(:read=>true)
    end
  end

  def accept_offer
    offer=Offer.find(params[:offer_id])
    offer.status_id=Status.find_by_name("accept").id
    
    respond_to do |format|
      if offer.save
        Mailer.send_my_offer_notification_mail(offer.user,offer,'您的报价已被接受',true).deliver_now
        format.html { redirect_to :back, notice: t(:accpeted_offer) }
        format.json {}
      else
        format.html { redirect_to :back }
        format.json {}
      end
    end
  end

  def decline_offer
    offer=Offer.find(params[:offer_id])
    offer.status_id=Status.find_by_name("decline").id
    
    respond_to do |format|
      if offer.save
        Mailer.send_my_offer_notification_mail(offer.user,offer,'您的报价已被拒绝',false).deliver_now
        format.html { redirect_to :back, notice: t(:declined_offer) }
        format.json {}
      else
        format.html { redirect_to :back }
        format.json {}
      end
    end
  end

  # GET /requests/new
  def new
    @request = Request.new
    if params[:product_id].present?
      product=Product.find(params[:product_id])
      @request.subject=product.name
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        admins=Role.find_by_name('admin').users
        admins.each do |admin|
          Mailer.send_new_request_notification_mail(admin,@request,'有新的需求发布').deliver_now
        end
        format.html { redirect_to @request, notice: '需求发布成功' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:subject, :description, :user_id, :read,:status_id)
    end
  end
