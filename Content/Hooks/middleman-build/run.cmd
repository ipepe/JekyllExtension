cd %HOME%/site/repository
call bundle install --without=development,test
call bundle exec middleman build --build-dir="%HOME%/site/wwwroot"