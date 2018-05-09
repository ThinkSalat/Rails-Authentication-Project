class CatsController < ApplicationController
  before_action :is_owner?, only: [:edit, :update]
  
  
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
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
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
  
  def is_owner?
    redirect_to :root unless  current_user && current_user.id == Cat.find_by(id: params[:id]).user_id
  end

  private

  def cat_params
    return nil unless current_user
    hash = params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
    hash[:user_id] = current_user.id
    hash
  end
end
