@echo off
SETLOCAL
SET DIRNAME=%~dp0
"%JAVA_HOME%\bin\java" -cp "%DIRNAME%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
ENDLOCAL
