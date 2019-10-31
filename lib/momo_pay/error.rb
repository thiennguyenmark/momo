module MomoPay
  class Error < StandardError; end
  class SignatureError < Error; end
  class ClientError < Error; end
  class ServerError < Error; end
  class RequestError < Error; end
end
