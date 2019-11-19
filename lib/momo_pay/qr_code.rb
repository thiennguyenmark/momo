module MomoPay
  class QrCode

    def self.request(data)
      data.merge!({
        requestType: 'captureMoMoWallet',
        accessKey: MomoPay.setup.access_key,
        partnerCode: MomoPay.setup.partner_code,
        partnerName: MomoPay.setup.partner_name,
      })
      data.merge!(signature: MomoPay::Signature.new(data, MomoPay.setup.signature_qr_code_keys).to_s)

      MomoPay::Request.post('/gw_payment/transactionProcessor', data)
    end

  end
end
