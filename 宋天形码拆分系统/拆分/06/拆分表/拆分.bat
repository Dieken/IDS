@echo off
set base=..\..
set im=..
set charset=..\..\..\字集
set "div=..\..\divide -f -wb -s:GX -noids -nos %base%\汉字拆分.txt %base%\汉字补充拆分.txt -p:%base%\部件拆分.txt -p:%base%\部件补充拆分.txt %im%\06汉字拆分.txt -p:%im%\06部件拆分.txt -rd:%im%\06字根表.txt -rr:06字根替换表.txt"

%div% -vld -ro:结果\字根表.txt -di:%charset%\部首笔画.txt -di:%charset%\cjka.txt -di:%charset%\cjk.txt -di:%charset%\兼容汉字（非兼容）.txt -di:%charset%\cjkb.txt -di:%charset%\cjkc.txt -di:%charset%\cjkd.txt -di:%charset%\cjke.txt -di:%charset%\cjkf.txt -di:%charset%\cjki.txt -di:%charset%\cjkg.txt -di:%charset%\cjkh.txt -di:%charset%\cjkj.txt -do:结果\拆分.txt
%div% -di:%charset%\部首笔画.txt -di:%charset%\cjka.txt -di:%charset%\cjk.txt -di:%charset%\兼容汉字（非兼容）.txt -di:%charset%\cjkb.txt -di:%charset%\cjkc.txt -di:%charset%\cjkd.txt -di:%charset%\cjke.txt -di:%charset%\cjkf.txt -di:%charset%\cjki.txt -di:%charset%\cjkg.txt -di:%charset%\cjkh.txt -di:%charset%\cjkj.txt -do:结果\全拆分.txt

pause