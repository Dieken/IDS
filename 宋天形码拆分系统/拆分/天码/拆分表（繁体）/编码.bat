@echo off
set base=..\..
set im=..
set charset=..\..\..\字集
set "code=..\..\divide -f -tm %base%\汉字拆分.txt %base%\汉字补充拆分.txt -p:%base%\部件拆分.txt -p:%base%\部件补充拆分.txt %im%\天码汉字拆分.txt -p:%im%\天码部件拆分.txt -rd:%im%\天码字根表（繁体）.txt -sc:%im%\天码简码表（繁体）.txt"

set t=~t%time:~6%
%code% -s:TH -sym -ci:%charset%\部首笔画.txt -co:%t%1
%code% -s:TH -ci:%charset%\cjka.txt -ci:%charset%\cjk.txt -ci:%charset%\兼容汉字（非兼容）.txt -co:%t%2
%code% -s:THX -ci:%charset%\cjkb.txt -ci:%charset%\cjkc.txt -ci:%charset%\cjkd.txt -ci:%charset%\cjke.txt -ci:%charset%\cjkf.txt -ci:%charset%\cjki.txt -ci:%charset%\cjkg.txt -ci:%charset%\cjkh.txt -ci:%charset%\cjkj.txt -co:%t%3
%code% -s:THX -sym -ci:%charset%\西夏契丹.txt -co:%t%4
copy /b %t%1+%t%2+%t%3+%t%4 结果\编码.txt
del %t%1 %t%2 %t%3 %t%4
pause
