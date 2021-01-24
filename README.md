
# README

AppointClinic Finances API :dollar:

## Versions
* **Ruby:** 2.5.1
* **Rails:** 6.0.3

## Run the project :gear:

### Setup the API :monorail:

1. `bundle install`
2. `rake db:create db:migrate`
3. Done!

## [Docs :book:](https://devise-token-auth.gitbook.io/devise-token-auth)
* Users:
	* [Authentication](https://github.com/Appointclinic/api_finance/docs/users/authentication.md)
	* [Create user](https://github.com/Appointclinic/api_finance/docs/users/new_user.md)

## Testing :construction:

In this application we use rspec for tests. We recommend you to test each file separatly to make tests run faster and make it easier to track issues. To test the application use

 `rspec spec/path_to_file.rb`

So let's say you want to test the user's model, you gonna run:

`rspec spec/models/user_spec.rb`

## Contributing :man_technologist: :woman_technologist:

To ensure we have a high quality code all the time, you can contribute with this project by forking it into your account, make the changes you want to make and then create a PR to this repository when you're done. Remember to create a good description of what you've done, using screen shots, lists and all other resources you think will help us understanding your work :smile:

PS.: Don't forget to make tests for your changes!

That's it. Happy coding!  :computer:
