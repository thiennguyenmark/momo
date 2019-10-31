module MomoPay
  class Rsa

    SKIP_KEYS = %w(appData)

    def initialize(data)
      @data = data
    end

    def hash
      Base64.encode64(rsa_public_key.public_encrypt(hash_json)).delete("\n")
    end

    private

    attr_reader :data
    attr_reader :keys

    def rsa_public_key
      @rsa_public_key ||= OpenSSL::PKey::RSA.new(MomoPay.setup.public_key_pem)
    end

    def hash_json
      data.select { |key, _| SKIP_KEYS.exclude?(key.to_s) }.to_json
    end

  end
end

