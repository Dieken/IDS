@echo off
set base=..\..
set im=..
set charset=..\..\..\字集
set "code=..\..\divide -f -wb -s:GX %base%\汉字拆分.txt %base%\汉字补充拆分.txt -p:%base%\部件拆分.txt -p:%base%\部件补充拆分.txt %im%\06汉字拆分.txt -p:%im%\06部件拆分.txt -rd:%im%\06字根表.txt -sc:%im%\06简码表.txt"

%code% -ci:%charset%\部首笔画.txt -ci:%charset%\cjka.txt -ci:%charset%\cjk.txt -ci:%charset%\兼容汉字（非兼容）.txt -ci:%charset%\cjkb.txt -ci:%charset%\cjkc.txt -ci:%charset%\cjkd.txt -ci:%charset%\cjke.txt -ci:%charset%\cjkf.txt -ci:%charset%\cjki.txt -ci:%charset%\cjkg.txt -ci:%charset%\cjkh.txt -ci:%charset%\cjkj.txt -co:结果\编码.txt

pause
