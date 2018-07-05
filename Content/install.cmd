REM mkdir SiteExtensions\MiddlemanExtension & cd SiteExtensions\MiddlemanExtension & install

echo Install WebJob
mkdir %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build
cp %HOME%\SiteExtensions\MiddlemanExtension\Hooks\middleman-build\run.cmd %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build\run.cmd
cp %HOME%\SiteExtensions\MiddlemanExtension\Hooks\middleman-build\settings.job %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build\settings.job

REM set JRUBY_VERSION=9.0.5.0  Stops at erubis native extensions (early)
REM set JRUBY_VERSION=9.1.17.0 Stops at parallel native extensions (a bit later)
REM set JRUBY_VERSION=9.2.0.0  Does nothing when starting jruby or jgem

echo Install JRuby
set JRUBY_VERSION=9.1.17.0
set JRUBY_HOME=%HOME%\SiteExtensions\MiddlemanExtension\jruby-%JRUBY_VERSION%
set JRUBY_EXE=%JRUBY_HOME%\bin\jruby.exe
set PATH=%PATH%;JRUBY_HOME%\bin
set JAVA_OPTS=-Djava.net.preferIPv4Stack=true

:: Installing JRuby
pushd %HOME%\SiteExtensions\MiddlemanExtension
curl -LOs https://s3.amazonaws.com/jruby.org/downloads/%JRUBY_VERSION%/jruby-bin-%JRUBY_VERSION%.zip
unzip -q jruby-bin-%JRUBY_VERSION%.zip & rm -f jruby-bin-%JRUBY_VERSION%.zip

echo Updating rubygems
%JRUBY_EXE% -S gem update --system

echo Installing bundler
%JRUBY_EXE% -S gem install bundler middleman --no-ri --no-rdoc