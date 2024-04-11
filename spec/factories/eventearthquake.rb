FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :eventearthquake do
    type {'Feature' }
    external_id { Faker::Alphanumeric.alpha(number: 10)}
    magnitude {Faker::Number.decimal(l_digits: 3, r_digits: 3)}
    place {Faker::Address.city }
    time {Faker::Number.number(digits: 10)}
    tsunami {Faker::Boolean.boolean}
    mag_type {Faker::Base.regexify(/(md|ml|ms|mw|me|mi|mb|mlg)/) }
    title {Faker::Lorem.paragraph}
    longitude {Faker::Number.decimal(l_digits: 3, r_digits: 3)}
    latitude {Faker::Number.decimal(l_digits: 3, r_digits: 3)}
    url {Faker::Internet.url}

  end

end

