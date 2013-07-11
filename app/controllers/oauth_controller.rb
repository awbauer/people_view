class OauthController < ApplicationController
  def callback
    set_current_nation(params[:state])
    credential = current_nation.credentials.create
    credential.request_access_token!(params[:code], callback_url)
    session[:credential_id] = credential.id
    redirect_to people_path
  end

  def authorize
    deauthorize!
    set_current_nation(params[:nation_id])
    redirect_to client.auth_code.authorize_url(
      :redirect_uri => callback_url,
      :state => params[:nation_id]
    )
  end

  def deauthorize
    deauthorize!
    redirect_to root_path
  end

  private

  def client
    current_nation.client
  end

  def set_current_nation(id)
    session[:current_nation] = id
  end

  def current_nation
    @current_nation ||= Nation.where(id: session[:current_nation]).first
  end
end
