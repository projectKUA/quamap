class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy, :show_image]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/new_ajax
  def new_ajax
    @qua = Qua.find(params[:qua_id])
    respond_to do |format|
      format.json {
        render json: { :quas => @qua }
      }
    end
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = createWithImage(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  def create_ajax
    @review = createWithImage(review_params)
    respond_to do |format|
      if @review.save
        format.json {
          render json: { :review => @review }
        }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      review = createWithImage(review_params).attributes
      review["id"] = params[:id]
      if @review.update(review)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def list_by_qua
    @qua = Qua.find(params[:qua_id])
    @reviews = Review.where(qua_id: params[:qua_id])
    count_review = Review.where("qua_id= ? and total_score is not null", params[:qua_id]).count
    puts count_review
    average_score = {'average_score' => calc_average}
    respond_to do |format|
      format.json {
        render json: { :reviews => @reviews, :quas => @qua, :average_score => average_score, :count_review => count_review}
      }
    end
  end
  def show_image
    send_data @review.photo_data, :type => 'image/jpeg', :disposition => 'inline'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:qua_id, :total_score, :quality_score, :convinience_score, :cost_score, :sight_score, :comment, :photo_data, :photo_title, :title, :nickname, :email)
    end

    def calc_average
      Review.where(qua_id: params[:qua_id]).average(:total_score)
    end

    def createWithImage(review_params)
      upload_file = review_params[:photo_data]
      review = {}
      review[:title] = review_params[:title]
      review[:nickname] = review_params[:nickname]
      review[:email] = review_params[:email]
      review[:qua_id] = review_params[:qua_id]
      review[:total_score] = review_params[:total_score]
      review[:quality_score] = review_params[:quality_score]
      review[:convinience_score] = review_params[:convinience_score]
      review[:cost_score] = review_params[:cost_score]
      review[:sight_score] = review_params[:sight_score]
      review[:comment] = review_params[:comment]
      review[:photo_title] = review_params[:photo_title]
      if upload_file != nil && upload_file != ''
         review[:photo_data] = upload_file.read
      end
      Review.new(review)
    end

end
