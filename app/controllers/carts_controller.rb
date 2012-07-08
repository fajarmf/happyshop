class CartsController < ApplicationController
  def show
    ids = session[:cart] ||= []
    @products = Product.where(id: ids)
  end
  def create
    @product = Product.find(params[:product_id])
    session[:cart] ||= []
    session[:cart] << {
      id: @product.id, 
      name: @product.name, 
      image_url: @product.image.url(:medium),
      price: @product.price,
    }
    redirect_to catalog_path(@product), :notice => "#{@product.name} berhasil ditambahkan ke keranjang belanja"
  end
  def destroy
    session[:cart] -= [params[:product_id]]
    redirect_to cart_path
  end
end
