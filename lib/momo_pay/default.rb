module MomoPay
  class Default

    SIGNATURE_VERIFY_KEYS = %w(status message amount transid)
    SIGNATURE_CONFIRM_KEYS = %w(partnerCode partnerRefId requestType requestId momoTransId)

  end
end
