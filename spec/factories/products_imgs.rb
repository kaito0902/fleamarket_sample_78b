FactoryBot.define do

  factory :image do  
    url              {Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/inu.jpeg'), 'spec/factories/inu.jpeg')}
  end
end
