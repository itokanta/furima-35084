class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    # @buy_address = BuyAddress.new(buy_params)

  end

end
