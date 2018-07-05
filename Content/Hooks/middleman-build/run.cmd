SET PATH=%PATH%;%HOME%\SiteExtensions\MiddlemanExtension\Commands\Ruby-2.3.3\ruby-2.3.3-i386-mingw32\bin

pushd %HOME%/site/repository

echo Installing dependencies
call bundle install --without=development,test --deployment

echo Building middleman

IF NOT EXIST Gemfile (
    call middleman build --build-dir="%HOME%/site/wwwroot"
)

IF EXIST Gemfile (
    call bundle exec middleman build --build-dir="%HOME%/site/wwwroot"
)

echo Building finished

popd
