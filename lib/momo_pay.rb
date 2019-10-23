require "http"

require "momo_pay/version"
require "momo_pay/error"
require "momo_pay/config"
require "momo_pay/http"

module MomoPay

  def self.setup
    @config ||= MomoPay::Config.new
    yield @config if block_given?
    @config
  end

end
