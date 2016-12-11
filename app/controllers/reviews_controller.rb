class ReviewsController < ApplicationController
  before_action :find_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to book_path(@book)  
    else
      format.html { render :new }
    end
  end

  def update
    if @review.update(review_params)
      redirect_to book_path(@book)  
    else
      format.html { render :edit }
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to book_path(@book)
  end

  private

    def find_book
      @book = Book.find(params[:book_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comments, :reference)
    end
end
