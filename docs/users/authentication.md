## User authentication :cop:
In the API we're using [devise](https://github.com/heartcombo/devise) and [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth) as the authentication method. The Devise gem helps managing the user with many resources like [Trackable](https://www.rubydoc.info/github/heartcombo/devise/master/Devise/Models/Trackable), [Recoverable](https://www.rubydoc.info/github/heartcombo/devise/master/Devise/Models/Recoverable) and [Lockable](https://www.rubydoc.info/github/heartcombo/devise/master/Devise/Models/Lockable).

Having resources like that helps scaling the project to something much easier to manage as the Saas grows up.

To authenticate a user you must send a `POST` request to `/auth/sign_in` with the following params:
```
{
	"email": "USER_EMAIL_HERE";
	"password": "USER_PASSWORD_HERE"
}
```

If your data is correct and the user is unlocked (coming soon), you should receive a response with status `200` and the following headers:
```
{
	...
	"uid": "USER_EMAIL_HERE";
	"access-token": "some_hash_value_here";
	"client": "some_hash_value_here";
	...
}
```

You gonna use these 3 informations to make authenticated requests to any endpoint in the API. Just have to add the `uid`, `access-token` and `client` to the headers of your request and you should be good to go :rocket:
