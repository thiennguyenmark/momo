module MomoPay
  class QueryString

    def initialize(data)
      @data = data
    end

    def to_s(keys)
      keys.map{|key| "#{key}=#{data[key.to_s] || data[key.to_sym]}"}.join('&')
    end

    private

    attr_reader :data

  end
end
