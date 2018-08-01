class Admin::AwardsController < Admin::BaseController

   def new
     @award = Award.new
   end

  def create
    @award = Award.new(award_params)
    if @award.save
      session[:award_id] = @award.id
      redirect_to awards_path
    else
      render :new
    end
  end


  private

  def award_params
    params.require(:award).permit(:name)
  end
end
