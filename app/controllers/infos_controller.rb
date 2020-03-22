class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @info = Info.new
  end

  def index
  end


  def create
    @info = current_user.infos.create(info_params)
    if @info.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def info_params
    params.require(:info).permit(:message)

  end
end

