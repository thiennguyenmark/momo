module MomoPay
  class Signature

    def self.verify!(data)
      momo_signature = self.new(data, MomoPay.setup.signature_verify_keys).to_s
      data_signature = data['signature'] || data[:signature]
      if momo_signature != data_signature
        raise MomoPay::SignatureError.new("#{momo_signature} vs #{data_signature}")
      end
    end

    def initialize(data, keys)
      @query_string = MomoPay::QueryString.new(data).to_s(keys)
    end

    def to_s
      OpenSSL::HMAC.hexdigest("SHA256", MomoPay.setup.secret_key, query_string)
    end

    private

    attr_reader :query_string

  end
end

