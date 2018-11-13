class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(
      contributer: params[:contributer],
      photo: "default.jpg",
      name: params[:name],
      comment: params[:comment]
    )

    if @shop.save
      redirect_to "/shops/#{@shop.id}/photo"
    else
      render('shops/new')
    end
  end
  
  # add photo spage
  def photo
    @shop = Shop.find(params[:id])
  end
  
  def addphoto
    @shop = Shop.find(params[:id])
    @shop.photo = "#{@shop.id}.jpg"
    photo = params[:photo]
    File.binwrite("public/shop_images/#{@shop.photo}", photo.read)
    @shop.save
    redirect_to "/shops"
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    @shop = Shop.find(params[:id])
    @shop.contributer = params[:contributer]
    @shop.name = params[:name]
    @shop.comment = params[:comment]
    
    if @shop.save
      redirect_to "/shops/#{@shop.id}/photo"
    else
      render('shops/edit')
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def junapoint
    @shops = Shop.all
  end
  
  def editjunapoint
    @shop = Shop.find(params[:id])
  end
  
  def updatejunapoint
    @shop = Shop.find(params[:id])
    @shop.junapoint = params[:junapoint]
    @shop.save
    redirect_to "/shops/junapoint"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:mentor, :name, :comment)
    end
end
