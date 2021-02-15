class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show_price
    @stock = params[:id].upcase
    begin
      @opening_price = ::StockService.get_opening_price @stock
    rescue StockService::NoStockFoundError => e
      return render 'stock_not_found'
    end
    render 'show_price'
  end

end