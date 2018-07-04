IF EXIST %HOME%/site/repository/_config.yml (
    call bundle install --without=development,test
    call bundle exec middleman build --source="%HOME%/site/repository" --build-dir="%HOME%/site/wwwroot"

)