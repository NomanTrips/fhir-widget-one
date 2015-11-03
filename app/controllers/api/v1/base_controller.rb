class Api::V1::BaseController < ApplicationController
  #protect_from_forgery with: :null_session

  #before_action :destroy_session
  
  def show
    render json: get_resource(params[:resource_type, :id])
  end

  def destroy_session
    request.session_options[:skip] = true
  end
  
  private
    
  def params
    params.permit(:resource_type, :id)
  end
  
end
