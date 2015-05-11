class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    validates :phone_number, :uniqueness => true
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Shave<br>Cream",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/cream-tooltip@2x.png")
        },
        {
            'count' => 10,
            "html" => "Truman Handle<br>w/ Blade",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/truman@2x.png")
        },
        {
            'count' => 25,
            "html" => "Winston<br>Shave Set",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/winston@2x.png")
        },
        {
            'count' => 50,
            "html" => "One Year<br>Free Blades",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("refer/blade-explain@2x.png")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end
end
