----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-29

----------

# QIIME Tutorial Project
Project started 2016-12-12 at [BH16.12](http://wiki.lifesciencedb.jp/mw/BH16.12).

We have created shell scripts to perform all analyses in QIIME tutorials.

![http://qiime.org/tutorials/](http://qiime.org/_static/wordpressheader.png)

## Project directories

    qiime/
     README.md: project documentation
     edamame-course/: contains edamame-course/Amplicon_Analysis
     tutorials/: contains QIIME Tutorials / Illumina Overview Tutorial

----------

## Steps

login to your server with `ssh -X` or `ssh -Y` (X11 forwarding)

	ssh -X username@remote_host

Clone the latest version of the repository:

	git clone https://github.com/haruosuz/qiime

Start QIIME:

	source activate qiime1

Finish QIIME:

	source deactivate

### edamame-course
[edamame-course/Amplicon_Analysis](https://github.com/edamame-course/Amplicon_Analysis/tree/master/final)

Run the driver scripts in the directory `edamame-course/` with:

	bash run.2016-07-13-QIIME1.sh
	# This step will take about 80 minutes

	bash run.2016-07-13-QIIME2.sh
	# This step will take about 15 minutes

	bash run.2016-07-13-QIIME3.sh
	# This step will take about 5 minutes

### tutorials
本家[QIIME Tutorials](http://qiime.org/tutorials/index.html)

#### [Illumina Overview Tutorial](http://nbviewer.jupyter.org/github/biocore/qiime/blob/1.9.1/examples/ipynb/illumina_overview_tutorial.ipynb)

Run the driver script in the directory `tutorials/illumina_overview_tutorial/` with:

	bash run_illumina_overview_tutorial.sh
	# This step will take about 35 minutes

#### [454 Overview Tutorial](http://qiime.org/tutorials/tutorial.html)

	wget ftp://ftp.microbio.me/pub/qiime-files/qiime_overview_tutorial.zip
	unzip qiime_overview_tutorial.zip 
	cd qiime_overview_tutorial

----------

## Run environment

	$uname -a
	Linux neo 3.10.0-327.18.2.el7.x86_64 #1 SMP Thu May 12 11:03:55 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
	$cat /etc/redhat-release
	CentOS Linux release 7.2.1511 (Core) 
	$cat /proc/version
	Linux version 3.10.0-327.18.2.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.3 20140911 (Red Hat 4.8.3-9) (GCC) ) #1 SMP Thu May 12 11:03:55 UTC 2016
	$python --version
	Python 2.7.12 :: Anaconda 4.2.0 (64-bit)

----------

## Updates

2016-12-13

edamame-course/Amplicon_Analysis downloaded on 2016-12-13 using:

	git clone https://github.com/edamame-course/Amplicon_Analysis

----------

## Tools
2016-12-12

### Install Anaconda
Anaconda 4.2.0 For Linux | Python 2.7 version | 64-BIT INSTALLER (446M) was downloaded from [Download for Linux] tab at <https://www.continuum.io/downloads> and installed on 2016-12-12 using:  

	wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
	bash Anaconda2-4.2.0-Linux-x86_64.sh
	# [/home/haruo/anaconda2] >>> 

At the end of `~/.bashrc` file:

	# added by Anaconda2 4.2.0 installer
	export PATH="/home/haruo/anaconda2/bin:$PATH"

### Install QIIME
[QIIME Installation Guide — Homepage](http://qiime.org/install/install.html)

Installed QIIME on 2016-12-12 using:

	# Create your qiime1 environment and install QIIME
	conda create -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda

	# Activate your qiime1 environment and test your QIIME installation
	source activate qiime1
	print_qiime_config.py -t

----------

## References
- http://qiime.org
- https://github.com/qiime
- [Knight Lab | QIIME](https://knightlab.ucsd.edu/wordpress/?p=198)
- [Install - Metagenomics](http://www.metagenomics.wiki/tools/qiime/install)
- Apr 28, 2016 [alexcritschristoph/Qiime16sTutorial: A tutorial on up-to-date methods of 16S analysis with QIIME](https://github.com/alexcritschristoph/Qiime16sTutorial)
- Jul 15, 2016 [QIIME 2 Self documenting, Extensible, and Reproducible Microbiome Analysis in Python 3 | SciPy 201 - YouTube](https://www.youtube.com/watch?v=tLtGg21Yu9Q)
- 2016/01/12 [mothur and QIIME](http://blog.mothur.org/2016/01/12/mothur-and-qiime/)
- 2015/09/ [[PDF]Workflow from sample to analyzed data – uses Qiime for analysis](http://www.science.smith.edu/cmbs/wp-content/uploads/sites/36/2015/09/Tutorial-from-sample-to-analyzed-data-using-Qiime-for-analysis.pdf)
- 2013+ [Learning QIIME - Werner Lab](http://www.wernerlab.org/teaching/qiime)
- 2013+ [EDAMAME : Intro to QIIME](http://www.edamamecourse.org/docs/intro_qiime_tutorial.html)
- 2011-2013, [Analyzing metagenomes with QIIME — PICRUSt 1.1.0 documentation](https://picrust.github.io/picrust/tutorials/qiime_tutorial.html)
- 2011+ [LEfSe · An Introduction to QIIME 1.9.1](https://twbattaglia.gitbooks.io/introduction-to-qiime/content/lefse.html)
- []()

### Galaxy
- [QIIME Contribution Fest - 9th & 10th January 2017 · Issue #1078 · galaxyproject/tools-iuc](https://github.com/galaxyproject/tools-iuc/issues/1078)
- [QIIME 1.9.1 Galaxy Wrapper - Galaxy Tool Shed / (sandbox for testing)](https://testtoolshed.g2.bx.psu.edu/repository?repository_id=0167fe8b968eaac0&changeset_revision=c1bd0c560018)
- Jun 26 [QIIME 1.9.1 Galaxy Wrapper](https://github.com/galaxyproject/tools-iuc/tree/qiime/tools/qiime)
- Jun 7 [problems with qiime integration on galaxy - Google Groups](https://groups.google.com/forum/m/#!msg/qiime-forum/k4rd2B2KqTA/n4wY2az5DAAJ)
- 2016-05-19 [Galaxy Development List Archive - Update on Qiime in Galaxy?](http://dev.list.galaxyproject.org/Update-on-Qiime-in-Galaxy-td4669421.html)
  - 2015-11-30 [WIP: Add Qiime wrappers #431](https://github.com/galaxyproject/tools-iuc/pull/431)
- 2015-11-25 [CeSGO - Group: Galaxy User Group Grand Ouest ~ Wiki: Metagenomics Remote Hackathon](https://cesgo.genouest.org/groups/guggo/wiki/MEtagenomicsHackathon)
- 2015-10-22 [QIIME on Galaxy - Google Groups](https://groups.google.com/d/msg/qiime-forum/6csQE7Qe1TA/-eOF-XxoDgAJ)
- 2015-07 GCC2015 Posters [P07: 16S rDNA amplicon sequencing data analysis in Galaxy](http://gcc2015.tsl.ac.uk/posters/#P07_16S_rDNA_amplicon_sequencing_data_analysis_in_Galaxy)
- 2015-03-27 [QIIME-Galaxy](https://github.com/qiime/qiime-galaxy)
- 2012 JA Navas Molina 著 [Develop a Galaxy-based Graphic User Interface for QIIME](https://upcommons.upc.edu/bitstream/handle/2099.1/15803/82437.pdf)

### Japanese
日本語資料
- 2016/11/26 [Qiime v1.9.0](http://crusade1096.web.fc2.com/qiime.html)
- 2016/04/14 [細菌群集の特徴付けのための効率的な核酸抽出および16S rRNAの遺伝子配列決定](https://www.jove.com/video/53939/16s-rrna?language=Japanese)
- 2016/03/14 [次世代シークエンサーデータ解析ツール — 東京大学 味埜・佐藤研究室](http://www.mwm.k.u-tokyo.ac.jp:8080/Plone/outcome/OTUMAMi/OTUMAMi_introduction) OTUMAMiを用いた16SrRNAシークエンスデータ解析
 - 2012 佐藤弘泰 著 [次世代シーケンサーが照らし出す排水処理微生物生態系](http://www.mwm.k.u-tokyo.ac.jp:8080/Plone/outcome/OTUMAMi/OTUMAMi/otumami_images/6c3474b058835b664f1a8a8c_201209.pdf)
- 2015-07-25 [USEARCHを使った16S rRNAメタゲノムデータの分析 - yokaのblog](http://yokazaki.hatenablog.com/entry/2015/07/25/202628)
- 2015-06-30 [QIIMEの実行時エラー ft2font.so: undefined symbol: PyUnicodeUCS4_AsEncodedString](http://blog.goo.ne.jp/yamagu09/e/a2c91765f69482c09d0de95b53ee0ac4) | 2015-06-23 [QIIMEの実行時のエラー PyUnicodeUCS2_AsASCIIString](http://blog.goo.ne.jp/yamagu09/e/94b4b8a3e5a2a963f5421d5235abc743) - 備忘録 the next generation
- 2017-01-14 2015-03-11 [Qiime 1.9 - Qiita](http://qiita.com/bunzaemon/items/3dd5b640b8f6a55ded79)
- 2015-01-27 [mac Qiimeのインストール | Note of Pediatric Surgery](http://pedsurgery.wp.xdomain.jp/?p=187)　予測メタゲノム HUMAnN
- 2013-06-11 [Qiimeのアップデートを行いました](http://www.nabe-intl.co.jp/takeruwiki/index.php?Qiimeのアップデートを行いました) | 2012-10-04 [Qiimeを動かしてみました](http://www.nabe-intl.co.jp/takeruwiki/index.php?Qiimeを動かしてみました) - Takeruでこのようなものを動かしてみました
- 2010/03/02 [次世代シーケンサーを用いた菌叢解析 (16S rRNA 遺伝子 PCR サンプルの解析) - 製品評価技術基盤機構](http://www.nite.go.jp/data/000081956.pdf)
- [次世代シーケンス・アンプリコンデータ解析(帰属分類群の推定) | RDPおよび独自データベースを利用した解析](https://www.tecsrg.co.jp/tecsrg/ngs-qiime-analysis.html)
- [Qiime - Draft of Pediatric Surgery](https://sites.google.com/site/noteofpaediatricsurgery/in-silico/qiime)

### [MetaSUB](https://github.com/haruosuz/metasub)
- [Bioinformatics Analysis – MetaSUB](http://metasub.org/methods/bioinformatics-analysis/)
- urban metagenome
 - [Boston Subway Microbiome](https://github.com/haruosuz/metasub#boston-subway-microbiome) | ENA [PRJNA301589](http://www.ebi.ac.uk/ena/data/view/PRJNA301589)
 - [New York Subway Microbiome](https://github.com/haruosuz/metasub#new-york-subway-microbiome) | ENA [PRJNA271013](http://www.ebi.ac.uk/ena/data/view/PRJNA271013)

----------

