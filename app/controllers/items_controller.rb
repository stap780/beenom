class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize, only: [:edit, :update]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @itemimages = @item.itemimages.present? ? @item.itemimages : @item.itemimages.build
  end

  # GET /items/1/edit
  def edit
    @itemimages = @item.itemimages.present? ? @item.itemimages : @item.itemimages.build
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
          images = Itemimage.where(:item_new => params[:authenticity_token])
          images.each do |image|
            image.update_attributes(item_id: @item.id)
          end

        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        if params[:images]
        params[:images].each do |image|
          @item.itemimages.create(image: image)
        end
      end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:sku, :barcode, :title, :description, :quantity, :costprice, :price, :user_id, :image_file_name, :itemimages_attributes =>[:id, :item_id, :_destroy, image: []])
    end
end
