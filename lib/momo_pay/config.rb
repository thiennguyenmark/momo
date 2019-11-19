module MomoPay
  class Config

    attr_accessor :domain
    attr_accessor :public_key
    attr_accessor :access_key
    attr_accessor :secret_key
    attr_accessor :partner_code
    attr_accessor :partner_name

    attr_accessor :verify_keys
    attr_accessor :signature_confirm_keys
    attr_accessor :signature_qr_code_keys

    def public_key_pem
      @public_key_pem ||= [
        '-----BEGIN PUBLIC KEY-----',
        MomoPay.setup.public_key.split('').each_slice(64).map(&:join).join("\n"),
        '-----END PUBLIC KEY-----',
      ].join("\n")
    end

    def get_verify_keys!(type)
      keys = self.verify_keys[type]
      return keys if keys.is_a?(Array)
      raise MomoPay::SignatureError, "Verify type `#{type}` is not in #{self.verify_keys.keys.join(', ')}"
    end

    def initialize
      self.signature_confirm_keys = MomoPay::Default::SIGNATURE_CONFIRM_KEYS
      self.signature_qr_code_keys = MomoPay::Default::SIGNATURE_QR_CODE_KEYS
      self.verify_keys = {
        mobile: MomoPay::Default::SIGNATURE_MOBILE_VERIFY_KEYS,
        ipn: MomoPay::Default::SIGNATURE_IPN_VERIFY_KEYS,
      }
    end

  end
end
