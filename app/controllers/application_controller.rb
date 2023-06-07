class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :params_missing

  private

  def record_not_found
    render json: { error: 'Record Not found.' }, status: 404
  end

  def params_missing
    render json: { error: 'Parameter Missing.' }, status: 400
  end
end
