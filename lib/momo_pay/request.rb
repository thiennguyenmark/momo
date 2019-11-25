module MomoPay
  class Request

    def self.post(endpoint, params={})
      full_endpoint = "#{MomoPay.setup.domain}#{endpoint}"
      response = MomoPay::Http.post(full_endpoint, json: params)
      raise MomoPay::ClientError.new(full_endpoint) if response.status.client_error?
      raise MomoPay::ServerError.new(full_endpoint) if response.status.server_error?
      raise MomoPay::RequestError.new(response.parse) unless response.status.ok?
      response.parse
    end

    def self.random_id
      "#{Time.now.strftime("%Y%m%d%H%M%S")}#{SecureRandom.hex(2)}"
    end

  end
end
