class Credential < ActiveRecord::Base
  delegate :client, to: :nation
  attr_accessible :nation, :token, :refresh_token, :token, :expires_at
  belongs_to :nation

  def request_access_token!(code, redirect_uri)
    @access_token = client.auth_code.get_token(code, redirect_uri: redirect_uri)
    update_from_token(@access_token)
    @access_token
  end

  def access_token
    return @access_token if @access_token
    @access_token = expired? ? refresh! : current_access_token
  end

  def expired?
    expires_at < Time.zone.now
  end

  def refresh!
    new_token = current_access_token.refresh!
    update_from_token(new_token)
    new_token
  end

  private
  def update_from_token(token)
    update_attributes!(token: token.token, refresh_token: token.refresh_token, expires_at: Time.at(token.expires_at))
  end

  def current_access_token
    OAuth2::AccessToken.new(client, token, refresh_token: refresh_token)
  end
end
