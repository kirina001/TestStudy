@Echo off
::����ip��test.txt
ipconfig | findstr IPv4 > test.txt
::����ip,���ò���
set /p m=<test.txt
::��ӡ����m��ֵ
echo %m%
::��ȡ�����ip��ַ
echo ����IPv4��ַΪ��%m:~37%
ping %m:~37%
pause