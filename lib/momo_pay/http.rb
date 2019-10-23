module MomoPay
  class Http

    def self.post(*args)
      ::Http.headers(content_type: 'application/json; charset=UTF-8')
        .timeout(60)
        .post(args)
    end

  end
end
