module Api::V1::UserTransformer
  def self.to_response(user)
    Api::V1::Transformer.to_response(user)
      .merge(facility_ids: user.facilities.map(&:id),
             voice_calling_number: ENV['VOICE_CALLING_PHONE_NUMBER'])
      .except('otp', 'otp_valid_until', 'access_token', 'logged_in_at')
  end
end