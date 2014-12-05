class QuasController < ApplicationController
  before_action :set_qua, only: [:show, :edit, :update, :destroy, :show, :show_image]

  # GET /quas
  # GET /quas.json
  def index
    @quas = Qua.all
  end
  
  def ajax_qua_list
    @quas = Qua.named params[:q]
  end
  
  # GET /quas/1
  # GET /quas/1.json
  def show
  end

  # GET /quas/new
  def new
    @qua = Qua.new
  end

  # GET /quas/1/edit
  def edit
  end

  # POST /quas
  # POST /quas.json
  def create
    @qua = quaWithUploadedFile(qua_params)

    respond_to do |format|
      if @qua.save
        format.html { redirect_to @qua, notice: 'Qua was successfully created.' }
        format.json { render :show, status: :created, location: @qua }
      else
        format.html { render :new }
        format.json { render json: @qua.errors, status: :unprocessable_entity }
      end
    end
  end
  def create_ajax
    @qua = quaWithUploadedFile(qua_params)

    respond_to do |format|
      if @qua.save
        format.json {
          render json: { :qua => @qua }
        }
      else
        format.json { render json: @qua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quas/1
  # PATCH/PUT /quas/1.json
  def update
    respond_to do |format|
      q = quaWithUploadedFile(qua_params).attributes
      q["id"] = params[:id]

      if @qua.update(q)
        format.html { redirect_to @qua, notice: 'Qua was successfully updated.' }
        format.json { render :show, status: :ok, location: @qua }
      else
        format.html { render :edit }
        format.json { render json: @qua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quas/1
  # DELETE /quas/1.json
  def destroy
    @qua.destroy
    respond_to do |format|
      format.html { redirect_to quas_url, notice: 'Qua was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_image
    send_data @qua.image1, :type => 'image/jpeg', :disposition => 'inline'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qua
      @qua = Qua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qua_params
      params.require(:qua).permit(:name, :latitude, :longitude, 
        :quality, :effect, :url, :stay_required, :price, 
        :image1_caption, :image1, :image2_caption, :image2, :image3_caption, :image3)
    end

    def quaWithUploadedFile(qua_params)
      upload_file = qua_params[:image1]
      qua = {}
      qua[:name] = qua_params[:name]
      qua[:latitude] = qua_params[:latitude]
      qua[:longitude] = qua_params[:longitude]
      qua[:quality] = qua_params[:quality]
      qua[:effect] = qua_params[:effect]
      qua[:url] = qua_params[:url]
      qua[:stay_required] = qua_params[:stay_required]
      qua[:price] = qua_params[:price]
      qua[:image1_caption] = qua_params[:image1_caption]
      if upload_file != nil && upload_file != ''
         qua[:image1] = upload_file.read
      end
      Qua.new(qua)
    end
end
