module MomoPay
  class Transaction

    def self.confirm(data)
      data.merge!({
        requestType: :capture,
        partnerCode: MomoPay.setup.partner_code,
        partnerName: MomoPay.setup.partner_name,
      })
      data.merge!(signature: MomoPay::Signature.new(data, MomoPay.setup.signature_confirm_keys).to_s)

      MomoPay::Request.post('/pay/confirm', data)
    end

    def self.revert(data)
      data.merge!(
        requestType: :revertAuthorize,
        partnerCode: MomoPay.setup.partner_code,
        partnerName: MomoPay.setup.partner_name,
      )
      data.merge!(signature: MomoPay::Signature.new(data, MomoPay.setup.signature_confirm_keys).to_s)

      MomoPay::Request.post('/pay/confirm', data)
    end

  end
end
