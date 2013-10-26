class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new(:case_id => params[:case_id])
  end

  def show
    @review = Review.find(params[:id])
  end
  
  def create
    @review = Review.new(review_params)
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to(@review.case ) }
        flash[:succes] =  "Beoordeling is succesvol geplaatst"
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.case
  end
  
  
  def review_params
    params.require(:review).permit(:name, :description, :score, :case_id)
  end
end
  
  
  
  
  
  
