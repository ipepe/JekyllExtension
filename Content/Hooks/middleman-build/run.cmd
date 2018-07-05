set JRUBY_VERSION=9.2.0.0
set JRUBY_HOME=%HOME%\SiteExtensions\MiddlemanExtension\jruby-%JRUBY_VERSION%
set JRUBY_EXE=%JRUBY_HOME%\bin\jruby.exe
set PATH=%PATH%;JRUBY_HOME%\bin
set JAVA_OPTS=-Djava.net.preferIPv4Stack=true

pushd %HOME%/site/repository
echo Installing dependencies
%JRUBY_EXE% -S bundle install --without=development,test --deployment
echo Building middleman

IF NOT EXIST Gemfile (
    %JRUBY_EXE% -S middleman build --build-dir="%HOME%/site/wwwroot"
)

IF EXIST Gemfile (
    %JRUBY_EXE% -S bundle exec middleman build --build-dir="%HOME%/site/wwwroot"
)

echo Building finished

popd