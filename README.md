# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.5.1

### ローカルでの動かし方
1. bundle install
1. rails db:migrate
1. vi ~/.bash_profile
```
export RAILS_KEY_MASTER=29227ee5b3715c8f81237650071ef178
export OAUTH_CLIENT_ID=3c2e8ad78343463bd26efae15c2de5e17c8629cc0278c6d4d899d9c4d0ae326d
export OAUTH_CLIENT_SECRET=026e6aeaed208b319d2ff3d42435dbad2eec7d7a38fc41100bb72fdeea68ed0c
```
4. rails db:seed
5. rails s

http://localhost:3000/session/new
