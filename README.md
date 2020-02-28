# これでできる！ はじめてのOSSフィードバックガイド ～ #駆け出しエンジニアと繋がりたい と言ってた私が野生のつよいエンジニアとつながるのに必要だったこと～

OSS Gateワークショップ参加者の方からよく寄せられる疑問への回答を元にした、初めてのフィードバックの手引き。

## 頒布予定

<!--
2020年2月29日 池袋サンシャインシティ2F 展示ホールD にて開催の[技術書典8](https://techbookfest.org/event/tbf08)、Day1 お09「OSS Gate」にて刊行の予定……でしたが、イベント中止のため予定変更になりました。
頒布予定は以下の通りです。
-->

* [書いた人のBOOTH](https://sysadgirl.booth.pm/)で電子書籍版のダウンロード販売（2020年2月29日～）
* [技術書典 応援祭](https://blog.techbookfest.org/2020/02/28/cheering-tbf/)で紙版＋電子書籍ダウンロードカード（2020年3月7日～4月6日）
* [第3回 技術書同人誌博覧会](https://gishohaku.dev/)の「OSS Gate」スペースで紙版＋電子書籍ダウンロードカード（2020年6月27日）
* 同人誌委託通販サービス等何らかの手段で紙版＋電子書籍ダウンロードカードの通販（2020年3月～？）

頒布物は、このリポジトリの内容を後述の手順でビルドした物と変わりありません。
値段が付いている物については、「ビルド環境を整える時間と手間をお金で買う」「書いた人にお布施する」というつもりでご購入頂ければ幸いです。

## 訂正情報

* [紙媒体 初刷分（2020年2月29日付）から電子書籍初版（2020年2月29日付）の変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.0..v1.1)

## 目次

* [はじめに](./chapters/introduction.md)
* 第1部 フィードバックするための準備
  - [本当に「誰でもできる」の？](./chapters/motivation.md)
  - [OSSを探そう](./chapters/oss.md)
  - [何をフィードバックしたらいいのか分からない](./chapters/what.md)
  - [どこにフィードバックしたらいいか分からない](./chapters/where.md)
* 第2部 最初のフィードバック
  - [どう報告すればいいのか分からない](./chapters/how.md)
  - [英語での報告の仕方が分からない](./chapters/english.md)
  - [それでもためらってしまうあなたへ](./chapters/hesitation.md)
  - [プルリクエストしてみたい](./chapters/pullrequest.md)
  - [他の人のフィードバックから学ぼう](./chapters/examples.md)
* 第3部 フィードバックした後のこと
  - [要望が通らない！](./chapters/do-not-intimidate.md)
  - [プルリクエストをマージしてもらえない！](./chapters/merge.md)
  - [仕事が忙しくてOSS活動に時間を割けない！](./chapters/business.md)
  - [バグ報告やパッチ提供以外のコントリビュート](./chapters/support.md)
  - [ライセンスについてより正確に知る](./chapters/licenses.md)
* [おわりに](./chapters/outroduction.md)


## 対象読者

* やりたいフィードバックがあるが、やり方が分からなくてためらっている人
* 特に具体的なフィードバックがある訳ではないが、好きなOSSがあってそれに関わりたいという人
* 功名心などの外的なモチベーションでOSSに関わりたいという人
* 作った物をOSSとして公開してみたい人→ライブラリなどのバグを踏む事があるので


## 執筆者向け情報

### ページ数の概算

[1ページあたり1400文字と仮定して](https://qiita.com/ariaki/items/3cce5e0843275e737f82)ページ数を概算するには、以下のようにする。

`echo "scale=2; $(cat chapters/*.md | wc -m) / 1400" | bc`

### 電子書籍用データ・印刷用データのビルド手順

Ubuntu 18.04LTS on WSL on Windows 10で動作を確認した。

Re:VIEWに必要なパッケージをインストールする。

```bash
$ sudo apt install texlive-binaries texlive-lang-japanese \
                   texlive-latex-recommended texlive-latex-extra \
                   imagemagick
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

以上で準備完了。makeするとPDFとEPUBの両方が作られ、distディレクトリ配下に出力される。

```bash
$ make
```



## 印刷・製本

以下のファイルを使用する。

* 表紙： images/cover-full-outline.ai
* 本文： dist/first-feedback-guidebook-print.pdf

初刷分は[日光企画](https://www.nikko-pc.com/index/top.html)にて以下の仕様で発注した。

* B5 196ページ（表紙込み）
* 表紙：NPホワイト200kg+マットPP
* 本文：上質90kg
* オフセット印刷 無線綴じ

個人用途などで1冊から製本したい場合、[製本直送.com](https://www.seichoku.com/)などのサービスがある。
初刷分と同等の仕様の場合、2020年2月29日時点の見積もりでは送料込みで1327円だった。


## ライセンス

全体のライセンスは、[Wikipediaと同様](https://ja.wikipedia.org/wiki/Wikipedia:%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2%E3%82%92%E4%BA%8C%E6%AC%A1%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B)とします。

* [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.ja)
* [GFDL](https://www.gnu.org/licenses/fdl-1.3.html)

著作者のクレジットは以下のいずれか、またはその併記とします。

* OSS Gate
* 結城洋志（YUKI "Piro" Hiroshi）：以下のバリエーションも可
  * YUKI Hiroshi
  * Piro
  * Piro / YUKI Hiroshi
  * YUKI Hiroshi / Piro
  * Piro / 結城洋志
  * 結城洋志 / Piro

ただし、寄稿頂いた部分などは別のライセンスが設定される場合があります。
