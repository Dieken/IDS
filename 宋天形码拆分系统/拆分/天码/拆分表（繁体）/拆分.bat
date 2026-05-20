@echo off
set base=..\..
set im=..
set charset=..\..\..\字集
set "div=..\..\divide -f -tm -noids -nos %base%\汉字拆分.txt %base%\汉字补充拆分.txt -p:%base%\部件拆分.txt -p:%base%\部件补充拆分.txt %im%\天码汉字拆分.txt -p:%im%\天码部件拆分.txt -rd:%im%\天码字根表（繁体）.txt -rr:天码字根替换表.txt"

set t=~t%time:~6%
%div% -s:TH -ro:结果\字根表.txt -di:%charset%\部首笔画.txt -di:%charset%\cjka.txt -di:%charset%\cjk.txt -di:%charset%\兼容汉字（非兼容）.txt -do:%t%1
%div% -s:THX -di:%charset%\cjkb.txt -di:%charset%\cjkc.txt -di:%charset%\cjkd.txt -di:%charset%\cjke.txt -di:%charset%\cjkf.txt -di:%charset%\cjki.txt -di:%charset%\cjkg.txt -di:%charset%\cjkh.txt -di:%charset%\cjkj.txt -di:%charset%\西夏契丹.txt -do:%t%2
copy /b %t%1+%t%2 结果\拆分.txt
del %t%1 %t%2

pause