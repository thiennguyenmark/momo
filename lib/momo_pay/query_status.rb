module MomoPay
  class QueryStatus

    def fetch(request_data)
      MomoPay::Request.post('/pay/query-status', request_data)
    end

  end
end
