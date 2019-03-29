class ItemimagesController < ApplicationController
  load_and_authorize_resource
  before_action :set_itemimage, only: [:show, :edit, :update, :destroy]

  # GET /itemimages
  # GET /itemimages.json
  def index
    @itemimages = Itemimage.all
  end

  # GET /itemimages/1
  # GET /itemimages/1.json
  def show
  end

  # GET /itemimages/new
  def new
    @itemimage = Itemimage.new
  end

  # GET /itemimages/1/edit
  def edit
  end

  # POST /itemimages
  # POST /itemimages.json
  def create
    @itemimage = Itemimage.create(itemimage_params) #загружаем картинки через форму загрузки js файл -  create.js
#     @itemimage = Itemimage.new(itemimage_params)
#     respond_to do |format|
#       if @itemimage.save
#         format.html { redirect_to @itemimage, notice: 'Itemimage was successfully created.' }
#         format.json { render :show, status: :created, location: @itemimage }
#       else
#         format.html { render :new }
#         format.json { render json: @itemimage.errors, status: :unprocessable_entity }
#       end
#     end
  end

  # PATCH/PUT /itemimages/1
  # PATCH/PUT /itemimages/1.json
  def update
    respond_to do |format|
      if @itemimage.update(itemimage_params)
        format.html { redirect_to @itemimage, notice: 'Itemimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @itemimage }
      else
        format.html { render :edit }
        format.json { render json: @itemimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemimages/1
  # DELETE /itemimages/1.json
  def destroy
    @itemimage.destroy
    flash[:info] = "Картинка удалена"
    if params[:from] == 'items'
	    redirect_to :back
	    else
	    respond_to do |format|
	      format.html { redirect_to itemimages_url, notice: 'Картинка удалена' }
	      format.json { head :no_content }
        format.js
	    end
    end
  end

  def sort
	  params[:itemimage].each_with_index do |id, index|
    Itemimage.where( id: id).update_all(position: index+1)
  	end
	render nothing: true
	head :ok
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemimage
      @itemimage = Itemimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itemimage_params
      params.require(:itemimage).permit(:item_id, :image, :position, :item_new)
    end
end
