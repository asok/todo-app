# Todo App assignment

## Installation

`bundle install && bundle exec rake db:migrate`

## Running tests

`bundle exec rspec`

## The requirements

You are given a simple Rails app with 2 controllers. You have to write a rake task and a small library inside of the rails app that will allow one to document the controllers' actions.
* the documentation for the actions should be written inside of the controller file
* the documenation should contain:
  * path to the action. It should be infered automatically (no hardcoding of the path by the documention author)
  * required paramaters
  * the structure of the returned json
* the rake task should be able to print the documentation as json to file `public/api.json`
* the rake task should be able to print the documentation as markdown to file `public/api.md` (only if there's enough time during the interview)
* the tests suit should pass after your changes

It is up to you how to implement the rake task and the library.
