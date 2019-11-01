# API Caller for https://momo.vn
- API documentation: https://developers.momo.vn

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'momo_pay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install momo_pay

## Usage
#### Setup:
Add `config/initializers/momo.rb` file with content
```ruby
MomoPay.setup do |config|
  config.domain = Rails.application.secrets.momo_domain
  config.public_key = Rails.application.secrets.momo_public_key
  config.secret_key = Rails.application.secrets.momo_secret_key
  config.partner_code = Rails.application.secrets.momo_partner_code
  config.partner_name = Rails.application.secrets.momo_partner_name
end
```
#### 1. App-In-App:
**Request to process transaction:** [detail from Momo](https://developers.momo.vn/#/docs/app_in_app?id=x%e1%bb%ad-l%c3%bd-thanh-to%c3%a1n)
```ruby
    response = MomoPay::Mobile.process(
      partnerRefId: order_number,
      amount: order_value,
      appData: momo_token_from_app,
      customerNumber: momo_phone_from_app
    )
```
=> Example response data
```ruby
     {
       "status"=>0,
       "message"=>"Thành công",
       "amount"=>100000,
       "transid"=>"230.....289",
       "feeMoMo"=>0,
       "signature"=>"2ab844bc9ae52.....0d04d85aef836e9"
     }
```
- How to verify response by HMAC-SHA256
```ruby
    MomoPay::Signature.verify!(response)
```
It will raise `MomoPay::SignatureError` exception when response data is not verified!

**Request to confirm transaction:** [detail from Momo](https://developers.momo.vn/#/docs/app_in_app?id=x%c3%a1c-nh%e1%ba%adn-giao-d%e1%bb%8bch)
```ruby
    response = MomoPay::Transaction.confirm(
      partnerRefId: order_number,
      momoTransId: transid_from_process_output,
    )
```

### To be continued...
