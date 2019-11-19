module MomoPay
  class Default

    SIGNATURE_MOBILE_VERIFY_KEYS = [
      'status',
      'message',
      'amount',
      'transid',
    ]

    SIGNATURE_IPN_VERIFY_KEYS = [
      'partnerCode',
      'accessKey',
      'requestId',
      'amount',
      'orderId',
      'orderInfo',
      'orderType',
      'transId',
      'message',
      'localMessage',
      'responseTime',
      'errorCode',
      'payType',
      'extraData',
    ]

    SIGNATURE_CONFIRM_KEYS = [
      'partnerCode',
      'partnerRefId',
      'requestType',
      'requestId',
      'momoTransId',
    ]

    SIGNATURE_QR_CODE_KEYS = [
      'partnerCode',
      'accessKey',
      'requestId',
      'amount',
      'orderId',
      'orderInfo',
      'returnUrl',
      'notifyUrl',
      'extraData',
    ]

  end
end
