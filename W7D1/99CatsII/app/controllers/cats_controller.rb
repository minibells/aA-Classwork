class CatsController < ApplicationController
  before_action :require_logged_in, only: [:index, :show] # can't see cats unless logged in
  before_action :owns_cat?, only: [:edit, :update] #can only edit cat if user owns cat

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id # sets the owner id to the id of logged in user
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def owns_cat?
    @cat = Cat.find(params[:id])
    @cats = Cat.where(user_id: current_user.id)
    redirect_to cat_url(@cat) unless @cats.include?(@cat)
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params) 
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex, :user_id)
  end
end
