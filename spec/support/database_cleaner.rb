RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:mongoid].clean_with(:deletion)
    Rails.application.load_seed
  end
end

