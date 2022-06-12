# URL Shorterner

## Setup project

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.5.3]
- Rails [5.2.4]

##### 1. Check out the repository

```bash
git clone git@github.com:organization/project-name.git
```

##### 2. Config database.yml file

Config database.yml file by your setting.


##### 3. Create and setup the database

Run the following commands to create and migrate the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```


## URL shortener algorithm
The main model in my app is a Link. These are structure of link

  - URL: The url someone entered
  - Shorter URL: new url after shorten
  - Clicked: A counter for tracking clicks on the link

Basically, each URL will be represented by a random unique 4-characters string. Whenever users click on the shorter URL, the app will find the original URL from the slug and then redirect users to this link.