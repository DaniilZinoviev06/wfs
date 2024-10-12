module CaptchaConcern 
  extend ActiveSupport::Concern

private

  def valid_recaptcha?
    success = verify_recaptcha
    if success
      true
    else
      false
    end
  end

  def valid_captcha?
    cf_response =
    Retryable.retryable tries: 2, on: ALLOWED_EXCEPTIONS, sleep: 1 do
      Faraday.post do |req|
        req.url 'https://challenges.cloudflare.com/turnstile/v0/siteverify'
        req.headers['Content-Type'] = 'application/json'
        req.options.timeout = 15
        req.options.open_timeout = 15
        req.body = {
          secret: ENV['SECRET_KEY'],
          response: params[:'cf-turnstile-response']
        }.to_json
      end
    end

    response_body = JSON.parse(cf_response.body, symbolize_names: true)

    response_body[:success]
    rescue JSON::ParserError
    true
  end
end
