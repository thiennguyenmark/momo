module MomoPay
  class Signature

    HMAC_KEYS = %W(partnerCode accessKey requestId orderId requestType)

    def initialize(data)
      @data = data
    end

    def hmac
      digest = OpenSSL::Digest.new('sha256')
      OpenSSL::HMAC.digest(digest, MomoPay.setup.public_key, hmac_query)
    end

    private

    attr_reader :data

    def hmac_query
      HMAC_KEYS.map { |key| [key, data[key] || data[key.to_sym]].join('=') }.join('&')
    end

  end
end

