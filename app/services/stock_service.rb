class StockService

  class NoStockFoundError < StandardError; end

  def self.get_opening_price(stock)
    quote_response = client.quote stock
    opening_price = quote_response.o
    if opening_price == 0
      raise NoStockFoundError
    end
    opening_price
  end

  def self.client
    FinnhubRuby::DefaultApi.new
  end

end