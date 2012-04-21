@echo off

echo ===== looking up google maps to the danger zone =====
call bundle install
echo ===== pullin' out my driveway to the danger zone =====
set PATH=%PATH%;%CD%\lib-win32
bundle exec ruby main.rb
