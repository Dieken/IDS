@echo off
set im=..
set charset=..\..\..\字集
set "code=..\..\divide -f -zm -tcs:\0 结果\拆分.txt -rd:结果\字根表.txt -sc:%im%\郑码简码表.txt"

set t=~t%time:~6%
%code% -sym -ci:%charset%\部首笔画.txt -co:%t%1
%code% -stem -ci:%charset%\cjka.txt -ci:%charset%\cjk.txt -ci:%charset%\兼容汉字（非兼容）.txt -ci:%charset%\cjkb.txt -ci:%charset%\cjkc.txt -ci:%charset%\cjkd.txt -ci:%charset%\cjke.txt -ci:%charset%\cjkf.txt -ci:%charset%\cjki.txt -ci:%charset%\cjkg.txt -ci:%charset%\cjkh.txt -ci:%charset%\cjkj.txt -co:%t%2
%code% -stem -sym -ci:%charset%\西夏契丹.txt -co:%t%3
copy /b %t%1+%t%2+%t%3 校验\校验.txt
del %t%1 %t%2 %t%3

fc /u /n 结果\编码.txt 校验\校验.txt

pause
