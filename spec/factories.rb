FactoryGirl.define do
  factory :king do
    
  end
  factory :queen do
    
  end
  factory :bishop do
    
  end
  factory :knight do
    
  end
  factory :rook do
    
  end
  factory :pawn do
  end
  factory :piece do
    type ""
  end
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password 'secretPassword'
    password_confirmation 'secretPassword'
  end
end
