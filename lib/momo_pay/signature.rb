module MomoPay
  class Signature

    def self.verify!(data, type)
      momo_signature = self.new(data, MomoPay.setup.get_verify_keys!(type)).to_s
      data_signature = data['signature'] || data[:signature]
      return true if momo_signature == data_signature
      raise MomoPay::SignatureError, "Gem:#{momo_signature || 'nil'} vs Data:#{data_signature || 'nil'}"
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

