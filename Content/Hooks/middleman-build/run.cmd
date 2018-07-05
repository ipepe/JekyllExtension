set PATH=%PATH%;%HOME%\SiteExtensions\MiddlemanExtension\Commands\Ruby-2.2.2\ruby-2.2.2-i386-mingw32\bin

pushd %HOME%\site\repository

IF NOT EXIST Gemfile (
    echo Building middleman
    middleman build --build-dir="%HOME\site\wwwroot"
)

IF EXIST Gemfile (
    echo Installing dependencies
    bundle install --without=development,test --deployment

    echo Building middleman
    bundle exec middleman build --build-dir="%HOME%\site\wwwroot"
)

echo Building finished

popd
