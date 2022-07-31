# Q&A Platform

This is a simple Ruby on Rails(7) App where users can ask questions and others are able to reply.

[Q&A Platform Demo](https://qa-platform001.herokuapp.com/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before doing so, make sure you have installed ruby and bundler to manage ruby gems.
My recommendation is to manage ruby versions with [rvm](https://rvm.io/rubies/installing).
You may need to have installed [Homebrew](https://brew.sh/),
package management system that simplifies the installation.

  ```
  bundle install
  ```

Prepare your database:

  ```
  bundle exec rails db:prepare
  ```

## Additional notes

This App uses google omniauth strategy among with devise . To test it locally, you will need to create google app.

```
    1. Go to 'https://console.developers.google.com'
    
    2. Select/Create your project.
    
    3. Go to Credentials, create credentials.
    
    4. Create OAuth Client ID with Authorized redirect URIs: http://localhost:3000/users/auth/google_oauth2/callback
    
    5. Add ENV['GOOGLE_CLIENT_ID'] & ENV['GOOGLE_CLIENT_SECRET'] to your .env file
```

## Running the tests

run all tests

  ```
  bundle exec rspec
  ```

## Usage

run rails server

  ```
  bin/dev
  ```
## TO DO
- add tests for comments
- add view tests
- add Github Actions workflow

## Additional Features to implement
- add comment notifications

## Authors

* **Ewelina Sobora** - [ewelinasobora](https://github.com/ewelinasobora)
