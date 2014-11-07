class QuasController < ApplicationController
  before_action :set_qua, only: [:show, :edit, :update, :destroy]

  # GET /quas
  # GET /quas.json
  def index
    @quas = Qua.all
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
    @qua = Qua.new(qua_params)

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
    @qua = Qua.new(qua_params)

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
      if @qua.update(qua_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qua
      @qua = Qua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qua_params
      params.require(:qua).permit(:name, :latitude, :longitude, :quality, :effect, :url)
    end
end
