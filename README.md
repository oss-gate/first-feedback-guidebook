# できる！ 初めてのOSSフィードバックガイド ～ #駆け出しエンジニアと繋がりたい と言ってた私が野生のつよいエンジニアとつながるのに必要だったこと～

OSS Gateワークショップ参加者の方からよく寄せられる疑問への回答を元にした、初めてのフィードバックの手引き。

2020年2月29日 池袋サンシャインシティ2F 展示ホールD にて開催の[技術書典8](https://techbookfest.org/event/tbf08)、Day1 お09「OSS Gate」にて刊行の予定。

[目次](./index.md)


## 対象読者

* やりたいフィードバックがあるが、やり方が分からなくてためらっている人
* 特に具体的なフィードバックがある訳ではないが、好きなOSSがあってそれに関わりたいという人
* 功名心などの外的なモチベーションでOSSに関わりたいという人
* 作った物をOSSとして公開してみたい人→ライブラリなどのバグを踏む事があるので



## 執筆者向け情報

### ページ数の概算

[1ページあたり1400文字と仮定して](https://qiita.com/ariaki/items/3cce5e0843275e737f82)ページ数を概算するには、以下のようにする。

`echo "scale=2; $(cat chapters/*.md | wc -m) / 1400" | bc`

### ビルド手順

Ubuntu 18.04LTS on WSL on Windows 10で動作を確認した。

Re:VIEWに必要なパッケージをインストールする。

```bash
$ sudo apt install texlive-binaries texlive-lang-japanese texlive-latex-recommended texlive-latex-extra imagemagick
$ gem install unicode-display_width
```

PDFtkをインストールする。

```bash
$ sudo add-apt-repository ppa:malteworld/ppa
$ sudo apt update
$ sudo apt install pdftk
```

Re:VIEWをインストールする。リリース版（4.0.0）ではビルドに失敗したため、masterを使う。

<!--
```bash
$ sudo gem install review
```
-->

```bash
$ git clone https://github.com/kmuto/review.git
$ cd review
$ bundle install --path vendor/bundle
$ rake build
$ sudo gem install pkg/review-*.gem
$ cd ..
```

easybooksをインストールする。リリース版ではビルドに失敗し、且つ、要件を満たさないため、改造版を使う。

<!--
```bash
$ sudo npm install -g easybooks
```
-->

```bash
$ git clone https://github.com/piroor/easybooks.git
$ cd easybooks
$ git checkout enhanced
$ npm install
$ npm run build
$ npm install -g .
$ cd ..
```

以上で準備完了。makeするとPDFとEPUBの両方が作られる。

```bash
$ make
```


## ライセンス

全体のライセンスは、[Wikipediaと同様](https://ja.wikipedia.org/wiki/Wikipedia:%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2%E3%82%92%E4%BA%8C%E6%AC%A1%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B)とします。

* [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.ja)
* [GFDL](https://www.gnu.org/licenses/fdl-1.3.html)

著作者のクレジットは以下のいずれかとします。

* 結城洋志（YUKI "Piro" Hiroshi）
* YUKI Hiroshi
* Piro
* Piro / YUKI Hiroshi
* YUKI Hiroshi / Piro
* Piro / 結城洋志
* 結城洋志 / Piro

ただし、寄稿頂いた部分などは別のライセンスが設定される場合があります。
