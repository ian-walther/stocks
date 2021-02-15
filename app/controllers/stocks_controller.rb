class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show_price
    stock = params[:id].upcase
    if stock.empty?
      @message = 'You must enter a valid stock ticker symbol'
    else
      begin
        opening_price = ::StockService.get_opening_price stock
        @message = "#{stock} opened at $#{opening_price}"
      rescue StockService::NoStockFoundError => e
        @message = "#{stock} could not be found"
      rescue FinnhubRuby::ApiError => e
        return render 'api_error'
      end
    end
    render 'show_price'
  end

end