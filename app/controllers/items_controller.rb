class ItemsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])

    if @store.user == current_user
      @item = Item.new
    else
      flash[:alert] = 'You can only create items from your stores'
      redirect_to stores_path
    end
  end

  def create
    store = Store.find_by_id(params[:store_id])
    @item = store.items.new(item_params)

    if @item.save
      join = StoreItem.create(store_id: store.id, item_id: @item.id)
      if join.nil?
        flash[:alert] = @item.errors.messages
        render :new
      else
        redirect_to store_path(store.id)
      end
    else
      flash[:alert] = @item.errors.messages
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :amount).merge(user_id: current_user.id)
  end
end
