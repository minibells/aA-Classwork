class CatsController < ApplicationController


  def index 
    @cats = Cat.all
    render :index
  end

  def show
    @cats = Cat.find(params[:id])
    render :show
  end

  def new
    @cats = Cat.new
    render :new
  end

  def create
    @cats = Cat.new(cat_params)
    if @cats.save
      redirect_to cat_url(@cats)
    else
      render :new
    end
  end

  def edit
    @cats = Cat.find(params[:id])
    render :edit
  end

  def update
    @cats = Cat.find(params[:id])
    if @cats.update(cat_params)
      redirect_to cat_url(@cats)
    else
      render :edit
    end

  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :age, :sex, :description)
  end

end
