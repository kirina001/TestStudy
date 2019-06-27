@Echo off
::保存ip到test.txt
ipconfig | findstr IPv4 > test.txt
::读入ip,设置参数
set /p m=<test.txt
::打印参数m的值
echo %m%
::截取后面的ip地址
echo 您的IPv4地址为：%m:~37%
ping %m:~37%
pause