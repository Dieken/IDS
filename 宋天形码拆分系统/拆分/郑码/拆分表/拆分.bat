@echo off
set base=..\..
set im=..
set charset=..\..\..\字集
set id=郑码
set "div=..\..\divide -f -zm %base%\汉字拆分.txt %base%\汉字补充拆分.txt -p:%base%\部件拆分.txt -p:%base%\部件补充拆分.txt %im%\郑码汉字拆分.txt -p:%im%\郑码部件拆分.txt -rd:%im%\郑码字根表.txt -rr:郑码字根替换表.txt"

%div% -s:GX -noids -nos -ro:结果\字根表.txt -di:%charset%\部首笔画.txt -di:%charset%\cjka.txt -di:%charset%\cjk.txt -di:%charset%\兼容汉字（非兼容）.txt -di:%charset%\cjkb.txt -di:%charset%\cjkc.txt -di:%charset%\cjkd.txt -di:%charset%\cjke.txt -di:%charset%\cjkf.txt -di:%charset%\cjki.txt -di:%charset%\cjkg.txt -di:%charset%\cjkh.txt -di:%charset%\cjkj.txt -di:%charset%\西夏契丹.txt -do:结果\拆分.txt
%div% -dp -di:%charset%\部首笔画.txt -di:%charset%\cjka.txt -di:%charset%\cjk.txt -di:%charset%\兼容汉字（非兼容）.txt -di:%charset%\cjkb.txt -di:%charset%\cjkc.txt -di:%charset%\cjkd.txt -di:%charset%\cjke.txt -di:%charset%\cjkf.txt -di:%charset%\cjki.txt -di:%charset%\cjkg.txt -di:%charset%\cjkh.txt -di:%charset%\cjkj.txt -di:%charset%\西夏契丹.txt -do:结果\递进拆分.txt

pause