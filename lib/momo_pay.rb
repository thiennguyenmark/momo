require "http"
require 'openssl'
require 'base64'
require 'json'

require "momo_pay/version"
require "momo_pay/config"
require "momo_pay/error"
require "momo_pay/http"
require "momo_pay/mobile"
require "momo_pay/query_status"
require "momo_pay/request"
require "momo_pay/rsa"
require "momo_pay/signature"

module MomoPay

  def self.setup
    @config ||= MomoPay::Config.new
    yield @config if block_given?
    @config
  end

end
