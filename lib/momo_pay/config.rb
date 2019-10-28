module MomoPay
  class Config

    attr_accessor :domain
    attr_accessor :public_key
    attr_accessor :partner_code
    attr_accessor :partner_name

    def public_key_pem
      @public_key_pem ||= [
        '-----BEGIN PUBLIC KEY-----',
        MomoPay.setup.public_key.split('').each_slice(64).map(&:join).join("\n"),
        '-----END PUBLIC KEY-----',
      ].join("\n")
    end

  end
end
