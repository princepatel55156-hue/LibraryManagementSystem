@echo off
set "JAVA_HOME=C:\Program Files\Java\jdk-24"
set "CATALINA_HOME=%USERPROFILE%\Downloads\apache-tomcat-11.0.22\apache-tomcat-11.0.22"

echo Copying latest project files...
rmdir /S /Q "%CATALINA_HOME%\webapps\LibraryManagement" 2>nul
xcopy /E /I /Y "src\main\webapp" "%CATALINA_HOME%\webapps\LibraryManagement"

echo.
echo Starting Tomcat...
call "%CATALINA_HOME%\bin\startup.bat"

echo.
echo Library Management System started!
echo Open: http://localhost:8080/LibraryManagement/