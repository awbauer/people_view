class PagesController < ApplicationController
  def index
    redirect_to people_path if logged_in?
  end

  def about
  end

  def api_request
    req = params[:api]

    @path = req[:path]
    @method = req[:action]
    @body = req[:body]

    rsp = begin
      token.send @method.downcase, @path, :body => @body, :headers => standard_headers
    rescue => e
      e.response
    end
    @status = rsp.status
    @headers = rsp.headers

    begin
      @code = JSON.parse(rsp.body)
      @code = JSON.pretty_generate @code
    rescue
      @code = rsp.body
    end

    @code = CodeRay.scan(@code, :json).div
    render :api_console
  end
end
