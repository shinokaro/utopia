class UsersController < ApplicationController
 def mypage

 end

 def edit

 end

 def destroy

 end

 private

 def profile_params
   params.require(:profile).permit(:fullname, :ages)
 end
end
