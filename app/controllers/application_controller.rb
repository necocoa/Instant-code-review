class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  unless Rails.env.development?
    rescue_from StandardError do |exception|
      log_exception(exception)
      render_500
    end
    rescue_from Exception do |exception|
      log_exception(exception)
      render_500
    end
    rescue_from ActiveRecord::RecordNotFound do |exception|
      log_exception(exception)
      render_404
    end
    rescue_from ActionController::UnknownFormat, with: :render_404
    class Forbidden < ActionController::ActionControllerError; end
    rescue_from Forbidden, with: :render_403
  end

  def not_found
    render_404
  end

  def route_not_found
    not_found
  end

  protected

  def log_exception(exception)
    logger.error "\n#{exception.class.name} (#{exception.message})"
  end

  def render_403
    respond_to do |format|
      format.html { render 'errors/access_denied', status: :forbidden }
      format.any { head :forbidden }
    end
  end

  def render_404
    respond_to do |format|
      format.html { render 'errors/not_found', status: :not_found }
      format.js { render json: '', status: :not_found, content_type: 'application/json' }
      format.any { head :not_found }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render 'errors/internet_server_error', status: :internal_server_error }
      format.any { head :internal_server_error }
    end
  end
end
