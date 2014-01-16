require 'dragonfly'

app = Dragonfly[:images]
app.datastore = Dragonfly::DataStorage::S3DataStore.new
app.datastore.configure do |c|
  c.bucket_name = 'ajax-cdn'
  c.access_key_id = ENV["ACCESS_KEY_ID"]
  c.secret_access_key = ENV["SECRET_ACCESS_KEY"]
end
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :file_accessor)

AWS_ACCESS_KEY = ENV['ACCESS_KEY_ID']
AWS_SECRET_KEY = ENV['SECRET_ACCESS_KEY']
AWS_DISTRIBUTION_ID = ENV['DISTRIBUTION_ID']
