Create new recipes app

Test

Minitest

Layout of the application

Integration Testing

Model Tests - unit testing

TDD - design the app functionality based on a test first approach
Write the test for the functionality
Build minimum code necessary to make each test pass

Re-factor the code - *code doesn't smell* - clean code, confidence

## Tests generate

rails generate integration_test pages

## Database and 1:m associations

- Relational Database
- SQL - Structured Query Language
- ActiveRectord - abstraction - Ruby - translated to SQL

Database layer, Associations

1:m & m:m Associations

Object Relatinal Mapper - ORM

## Recipe

- recipe should be valid
- name should be present
- description should be present
- chef_id should be present **
- maximum length for name and description, maybe a minimum for description

## Chef

- chefname should be present
- email should be present
- size restrictions on email and chefname
- email address should be valid format
- email should be unique, case insensitive