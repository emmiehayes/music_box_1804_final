class AwardsController < ApplicationController
  def index
    @award = Award.new
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end
end
