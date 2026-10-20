class ShoppingItemsController < ApplicationController
  def index
    @shopping_items = ShoppingItem.order(:created_at)
    @shopping_item = ShoppingItem.new
  end

  def create
    ShoppingItem.create(params.expect(shopping_item: [ :name ]))
    redirect_to shopping_items_path
  end

  def destroy
    ShoppingItem.find(params[:id]).destroy!
    redirect_to shopping_items_path, status: :see_other
  end

  def finish_product
    product = Product.find(params[:id])
    ShoppingItem.create(name: product.name)
    product.destroy!
    redirect_to products_path, notice: "#{product.name} ajouté à la liste de courses 🛒", status: :see_other
  end
end
