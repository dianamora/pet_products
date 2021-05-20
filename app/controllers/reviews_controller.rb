class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id 
      if @review.save
        format.html { redirect_to @review, notice: "Review was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Review was successfully deleted." }
      redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
