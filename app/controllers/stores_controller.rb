class StoresController < ApplicationController
  before_action :authenticate_user!, except: :splash

  # GET /stores or /stores.json
  def index
    @stores = Store.where(user_id: current_user.id)
  end

  # GET /stores/1 or /stores/1.json
  def show
    @store = Store.find(params[:id])
    if @store.user != current_user
      flash[:alert] = 'You can only see what you created'
      redirect_to stores_path
    end
    @items = @store.items.order(created_at: :desc)
    @total = @items.sum(:amount)
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)

    if store.save
      redirect_to stores_path
    else
      flash[:alert] = 'store not created'
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
