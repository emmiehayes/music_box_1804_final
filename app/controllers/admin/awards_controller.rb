class Admin::CategoriesController < Admin::BaseController

   def new
     @award = Award.new
   end

end
