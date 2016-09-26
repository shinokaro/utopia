class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %w(edit update)
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params.merge(
      user_id: current_user.id
    )
    if @profile.save
      redirect_to  user_path(@profile.user), notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to  user_path(@profile.user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end


  def profile_params
    params.require(:profile).permit(:fullname, :ages)
  end
end
