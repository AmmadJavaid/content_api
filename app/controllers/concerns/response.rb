module Response
  def json_response(objects, status_code=:ok)
    render json: objects, status: status_code
  end

  def unsuccessful_response message, status = :bad_request
    render json: {data: {success: false, message: message}}, status: status
  end

  def successful_response message, status = :ok
    render json: {data: {success: true, message: message}}, status: status
  end
end
