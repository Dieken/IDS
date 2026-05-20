@echo off
set im=..
set charset=..\..\..\字集
set "code=..\..\divide -f -bh 结果\拆分.txt -rd:结果\字根表.txt"

%code% -ci:%charset%\部首笔画.txt -ci:%charset%\cjka.txt -ci:%charset%\cjk.txt -ci:%charset%\兼容汉字（非兼容）.txt -ci:%charset%\cjkb.txt -ci:%charset%\cjkc.txt -ci:%charset%\cjkd.txt -ci:%charset%\cjke.txt -ci:%charset%\cjkf.txt -ci:%charset%\cjki.txt -ci:%charset%\cjkg.txt -ci:%charset%\cjkh.txt -ci:%charset%\cjkj.txt -ci:%charset%\西夏契丹.txt -co:校验\校验.txt

fc /u /n 结果\编码.txt 校验\校验.txt

pause
