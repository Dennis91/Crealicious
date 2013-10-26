class CasesController < ApplicationController
  respond_to :html, :json
  
  def index
    @cases = Case.all
  end

  def new
    @case = Case.new
  end
  
  def create
    @case = Case.new(case_params)
    
    respond_to do |format|
      if @case.save
        format.html { redirect_to(cases_path) }
        flash[:succes] =  "Case is succesvol aangemaakt"
      else
        format.html { render :action => "new" }
      end
    end
  end

  def show
    
    @image = Image.new(:case_id => params[:id])
    @images = Image.all
    @review = Review.new(:case_id => params[:id])
    @case = Case.find(params[:id])
    respond_to do |type|
      type.html
      type.json {render :json => @case}
    end
  end

  def edit
    @case = Case.find(params[:id])
  end
  
  def update
    @case = Case.find(params[:id])
    if @case.update_attributes!(case_params)
      respond_to do |format|
        format.html { redirect_to( @case)}
        format.json { render :json => @case }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit }
        format.json { render :nothing => true }
      end
    end
  end
  
  def destroy
    @case = Case.find(params[:id])
    @case.destroy
    redirect_to cases_path
  end
  
  def case_params
    params.require(:case).permit(:title, :description, :images, :theme, :occasion)
  end
  
  
  
  
end
