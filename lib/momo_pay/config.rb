module MomoPay
  class Config

    attr_accessor :domain
    attr_accessor :public_key
    attr_accessor :secret_key
    attr_accessor :partner_code
    attr_accessor :partner_name

    attr_accessor :signature_verify_keys
    attr_accessor :signature_confirm_keys

    def public_key_pem
      @public_key_pem ||= [
        '-----BEGIN PUBLIC KEY-----',
        MomoPay.setup.public_key.split('').each_slice(64).map(&:join).join("\n"),
        '-----END PUBLIC KEY-----',
      ].join("\n")
    end

    def initialize
      self.signature_verify_keys = MomoPay::Default::SIGNATURE_VERIFY_KEYS
      self.signature_confirm_keys = MomoPay::Default::SIGNATURE_CONFIRM_KEYS
    end

  end
end
