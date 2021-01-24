## Setup the API :monorail:

1. `bundle install`
2. `rake db:create db:migrate`
3. Done!

## Testing :construction:

In this application we use rspec for tests. We recommend you to test each file separatly to make tests run faster and make it easier to track issues. To test the application use

 `rspec spec/path_to_file.rb`

So let's say you want to test the user's model, you gonna run:

`rspec spec/models/user_spec.rb`
