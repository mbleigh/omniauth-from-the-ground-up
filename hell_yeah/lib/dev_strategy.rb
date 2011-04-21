module OmniAuth
  module Strategies
    class Dev
      include OmniAuth::Strategy

      def initialize(app, *args)
        super(app, :twitter, *args)
      end

      def request_phase
        OmniAuth::Form.build(:title => 'Twitter Fake', :url => '/auth/twitter/callback') do
          text_field 'Twitter Screen Name', 'screen_name'
        end.to_response
      end

      def auth_hash
        {
          'provider' => 'twitter',
          'uid' => request['screen_name'],
          'user_info' => {
            'name' => request['screen_name'],
            'nickname' => request['screen_name']
          }
        }
      end
    end
  end
end
