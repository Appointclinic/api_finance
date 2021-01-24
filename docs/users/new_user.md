## Creating a new user :hatching_chick:
The `user` model in this API needs to belong to some `company_unity`, and a company_unity needs to have a `company` associated to it.

So in order to create a new user, you have to create a company, then create a company_unit that belongs to the company you have just created, and finally then you can create your user.

### Validations :lock:
The user's model validates a few things:
* The `social_security_number` is a string, but it validates that the data in it is numeric and have 11 digits;
* The `role` is a enum that you can see the valid values here :point_right: [user.rb#40](https://github.com/Appointclinic/api_finance/blob/master/app/models/user.rb);
* The `name` is a string with at least 3 digits, and nothing more than 30 characters;

### Required data to create a user:
* name _(string, length => [3..30])_;
* social_security_number _(string, numeric with 11 digits)_;
* company_unity _(association)_;
* role _(integer, valid_values => [0..4])_;
* email _(string with a valid email address)_;
* password _(string with at least 6 digits)_;
* password_confirmation _(same value of password)_.
