.PHONY: all chise babelstone sky sky_tw yuhao shanren clean

CURL_OPTS  := -fSL
CURLS_OPTS := --proto =https --tlsv1.2 $(CURLS_OPTS)

YUSTAR_VER := v3.10.1

all: chise babelstone sky sky_tw yuhao shanren

chise: tmp/ids-master.tar.gz
	rm -rf $@ tmp/ids-master
	tar -C tmp -xvf $<
	mv tmp/ids-master $@

babelstone: tmp/IDS.txt
	mkdir -p $@
	cp -f $< $@/

sky: tmp/sky.div.rar
	rm -rf tmp/sky
	unrar x -optmp/sky $<
	mkdir -p $@
	cp tmp/sky/{说明,*拆分*}.txt $@/

sky_tw: tmp/sky_tw.div.rar
	rm -rf tmp/sky_tw
	unrar x -optmp/sky_tw $<
	mkdir -p $@
	cp tmp/sky_tw/{说明,*拆分*}.txt $@/

yuhao: tmp/yustar_$(YUSTAR_VER).zip
	rm -rf tmp/yuhao
	unzip -d tmp/yuhao $<
	mkdir -p $@
	cp tmp/yuhao/schema/*chaifen*.dict.yaml $@/

shanren: tmp/ShanRenMaLTS/单字表.csv tmp/ShanRenMaLTS/兼容拆分表.csv
	mkdir -p $@
	cp $^ $@/

tmp/ids-master.tar.gz:
	mkdir -p tmp
	curl $(CURLS_OPTS) -o $@ 'https://gitlab.chise.org/chise/ids/-/archive/master/ids-master.tar.gz?ref_type=heads'

tmp/IDS.txt:
	mkdir -p tmp
	curl $(CURLS_OPTS) -o $@ https://www.babelstone.co.uk/CJK/IDS.TXT

tmp/sky.div.rar:
	mkdir -p tmp
	curl $(CURL_OPTS) -o $@ "http://soongsky.com/download.php/sky/sky.div.rar?id=`date +%s`"

tmp/sky_tw.div.rar:
	mkdir -p tmp
	echo "Currently download from QQ group 631302614"
	#curl $(CURL_OPTS) -o $@ "http://soongsky_tw.com/download.php/sky_tw/sky_tw.div.rar?id=`date +%s`"

tmp/yustar_$(YUSTAR_VER).zip:
	mkdir -p tmp
	curl $(CURL_OPTS) -o $@ "http://ys-g.ysepan.com/wap/zhuyuhao/C9SdOlEBVeOA9N6/ae7iC8LsbK5h4VcCduakDGG9IX3NGc/%E6%98%9F%E9%99%B3%E8%BC%B8%E5%85%A5%E6%B3%95_$(YUSTAR_VER).zip"

tmp/ShanRenMaLTS/单字表.csv:
	mkdir -p tmp/ShanRenMaLTS
	curl $(CURLS_OPTS) -o $@ https://raw.githubusercontent.com/siuze/ShanRenMaLTS/refs/heads/master/src/data/%E5%8D%95%E5%AD%97%E8%A1%A8.csv

tmp/ShanRenMaLTS/兼容拆分表.csv:
	mkdir -p tmp/ShanRenMaLTS
	curl $(CURLS_OPTS) -o $@ https://raw.githubusercontent.com/siuze/ShanRenMaLTS/refs/heads/master/src/data/%E5%85%BC%E5%AE%B9%E6%8B%86%E5%88%86%E8%A1%A8.csv

clean:
	rm -rf tmp/ids-master* tmp/IDS.TXT tmp/sky*.div.rar tmp/yustar*.zip tmp/ShanRenMaLTS

