REM mkdir SiteExtensions\MiddlemanExtension

echo Install WebJob
mkdir %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build
cp %HOME%\SiteExtensions\MiddlemanExtension\Hooks\middleman-build\run.cmd %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build\run.cmd
cp %HOME%\SiteExtensions\MiddlemanExtension\Hooks\middleman-build\settings.job %HOME%\site\wwwroot\app_data\jobs\triggered\middleman-build\settings.job

IF NOT EXIST Commands (
    mkdir Commands
)
pushd .\Commands

pushd %temp%

echo Download Dependencies
curl -L -o Ruby-2.3.3.zip http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.3.3-i386-mingw32.7z
curl -L -o RubyDevKit.exe http://dl.bintray.com/oneclick/rubyinstaller/defunct/DevKit-tdm-32-4.5.2-20110712-1620-sfx.exe
curl -L -k -o GlobalSignRootCA.pem https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/index.rubygems.org/GlobalSignRootCA.pem

echo -

echo Unpacking Dependencies
start /wait d:\7zip\7za x Ruby-2.3.3.zip -o%HOME%\SiteExtensions\MiddlemanExtension\Commands\Ruby-2.3.3
start /wait d:\7zip\7za x RubyDevKit.exe -o%HOME%\SiteExtensions\MiddlemanExtension\Commands\RubyDevKit
cp GlobalSignRootCA.pem %HOME%\SiteExtensions\MiddlemanExtension\Commands\Ruby-2.3.3\ruby-2.3.3-i386-mingw32\lib\ruby\2.3.0\rubygems\ssl_certs\GlobalSignRootCA.pem

popd

echo Configure RubyDevKit

pushd RubyDevKit

SET PATH=%PATH%;%HOME%\SiteExtensions\MiddlemanExtension\Commands\Ruby-2.3.3\ruby-2.3.3-i386-mingw32\bin

call ruby dk.rb init
echo - %HOME%/SiteExtensions/MiddlemanExtension/Commands/Ruby-2.3.3/ruby-2.3.3-i386-mingw32 >> config.yml
call ruby dk.rb install

popd

echo Clean up Zip Files
rm %temp%\Ruby-2.3.3.zip
rm %temp%\RubyDevKit.exe

echo Install Bundler and Middleman

SET SSL_CERT_FILE=D:\Program Files\Git\usr\ssl\certs

call gem install bundler middleman --no-ri --no-rdoc

popd