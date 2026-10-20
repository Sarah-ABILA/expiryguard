class QuantitiesController < ApplicationController
  def increment
    product = Product.find(params[:id])
    product.increment!(:quantity)
    redirect_back fallback_location: products_path, status: :see_other
  end

  def decrement
    product = Product.find(params[:id])
    if product.quantity.to_i <= 1
      ShoppingItem.create(name: product.name)
      product.destroy!
      redirect_to products_path, notice: "Plus de #{product.name} ! Ajouté à la liste de courses 🛒", status: :see_other
    else
      product.decrement!(:quantity)
      redirect_back fallback_location: products_path, status: :see_other
    end
  end
end
