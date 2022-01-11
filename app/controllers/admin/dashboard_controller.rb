class Admin::DashboardController < ApplicationController
  def show
    @products = Product
    @categories = Category
  end
end
