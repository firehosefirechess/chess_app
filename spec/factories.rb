FactoryGirl.define do
  factory :game do
  end
  
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
    type 'Pawn'
    color 'white'
    association :game
  end

  factory :user do
  end
end
