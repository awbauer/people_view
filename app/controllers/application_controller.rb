class ApplicationController < ActionController::Base
  protect_from_forgery

  delegate :access_token, :to => :credential

  helper_method :logged_in?

  private

  def deauthorize!
    credential.destroy if credential
    session[:current_nation] = nil
    session[:credential_id] = nil
  end

  def token
    credential.access_token
  end

  def logged_in?
    credential.present?
  end

  def credential
    @credential ||= Credential.find_by_id(session[:credential_id])
  end

  helper_method :nation
  def nation
    credential.nation
  end

  def standard_headers
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end
end
