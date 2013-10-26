class ImagesController < ApplicationController
  def new
    @image = Image.new(:case_id => params[:case_id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def show
  end
  
  def create
    @image = Image.new(image_params)
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to(@image.case) }
        flash[:succes] =  "Case is succesvol aangemaakt"
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @image = Image.find(params[:image])
    @image.update_attributes(image_params)
    respond_with @image
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end
  
  def image_params
    params.require(:image).permit(:title, :image, :case_id)
  end
  
  
end

