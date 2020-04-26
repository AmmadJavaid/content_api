module Response
  def json_response(objects, status_code=:ok)
    render json: objects, status: status_code
  end

  def response_with_status status = :bad_request
    render nothing: true, status: status
  end
end
