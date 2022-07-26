class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = policy_scope(Item).order(created_at: :desc)
    @items = @items.search_by_name_and_details(params[:query]) if params[:query].present?
  end

  # GET /items/1
  def show
    # authorize @item # <-- DONT NEED because it's called in the set_item private method because it will be called in all the before_actons
  end

  def new
    @item = Item.new
    authorize @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.user = current_user # when we create a new item, we set the user of the item as the current user
    authorize @item

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # GET /items/1/edit
  def edit
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :details, :category, :daily_rate, :pickup_location, :photo)
  end
end
