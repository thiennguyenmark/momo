module MomoPay
  class Mobile


    # Input: {
    #   partnerRefId: 'ABCD1234',
    #   amount: 360000,
    #   version: 2,
    #   payType: 3,
    #   appData: token,
    #   customerNumber: '0917003000'
    # }
    #
    # MomoPay::Mobile.process data
    #
    # Output: {
    #   "status"=>0,
    #   "message"=>"Thành công",
    #   "amount"=>360000,
    #   "transid"=>"2308026289",
    #   "feeMoMo"=>0,
    #   "signature"=>"2ab844bc9ae5203209b893d060dcb
    #   eb0e540576cf6007765e0d04d85aef836e9"
    # }
    def self.process(data)
      data.merge!({
        partnerCode: MomoPay.setup.partner_code,
        partnerName: MomoPay.setup.partner_name,
      })
      data.merge!(hash: MomoPay::Rsa.new(data).hash)

      MomoPay::Request.post('/pay/app', data)
    end

  end
end
