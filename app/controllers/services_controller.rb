class ServicesController < ApplicationController
  def index
    @services = Service.where(active: true)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
    @categories = Category.all
  end

  def create
    @service = Service.create!(
        name: params[:name],
        description: params[:description],
        category_id: params[:category]
    )
    redirect_to action: :show, id: @service.id
  end

  def edit
    @service = Service.find(params[:id])
    @categories = Category.all
  end

  def update
    @service = Service.find(params[:id])
    @service.update!(
        name: params[:name],
        description: params[:description],
        category_id: params[:category]
    )
    redirect_to action: :show, id: @service.id
  end

  def destroy
    @service = Service.find(params[:id])
    @service.active = false
    @service.save
    redirect_to action: :index
  end
end
