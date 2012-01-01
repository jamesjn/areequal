class LandingController < ApplicationController
  def index
  end
  
  def login
    signed_request = params["signed_request"]
    secret_id = '4c5b5434fa5baae93460ca54eee86374'
    facebook_data = decode_data(secret_id, signed_request)
    user = User.find_or_create_by_id(facebook_data["user_id"])
    session[:user_id] = user.id
    render :json => {:verified => true}
  end

  private 
    def urldecode64(str)
      encoded_str = str.tr('-_', '+/')
      encoded_str += '=' while !(encoded_str.size % 4).zero?
      Base64.decode64(encoded_str)
    end

    def decode_data secret_id, request 
      encoded_sig, payload = request.split('.', 2)
      sig = urldecode64(encoded_sig)
      data = JSON.parse(urldecode64(payload))
      if data['algorithm'].to_s.upcase != 'HMAC-SHA256'
        raise "Bad signature algorithm: %s" % data['algorithm']
      end
      expected_sig = OpenSSL::HMAC.digest('sha256', secret_id, payload)
      if expected_sig != sig
        raise "Bad signature"
      end
      data
    end

end
