# これでできる！ はじめてのOSSフィードバックガイド ～ #駆け出しエンジニアと繋がりたい と言ってた私が野生のつよいエンジニアとつながるのに必要だったこと～

OSS Gateワークショップ参加者の方からよく寄せられる疑問への回答を元にした、初めてのフィードバックの手引き。

## 頒布予定

<!--
2020年2月29日 池袋サンシャインシティ2F 展示ホールD にて開催の[技術書典8](https://techbookfest.org/event/tbf08)、Day1 お09「OSS Gate」にて刊行の予定……でしたが、イベント中止のため予定変更になりました。
頒布予定は以下の通りです。
-->

<!--
* [技術書典 応援祭で紙版＋電子書籍](https://techbookfest.org/product/6214306890776576)（2020年3月7日～4月5日）
-->
* [書いた人のBOOTH](https://sysadgirl.booth.pm/items/1842855)で電子書籍版（EPUB/PDF）のダウンロード販売（2020年2月29日～）
* [Amazon Kindle ダイレクト・パブリッシング ](https://www.amazon.co.jp/%E3%81%93%E3%82%8C%E3%81%A7%E3%81%A7%E3%81%8D%E3%82%8B%EF%BC%81-%E3%81%AF%E3%81%98%E3%82%81%E3%81%A6%E3%81%AEOSS%E3%83%95%E3%82%A3%E3%83%BC%E3%83%89%E3%83%90%E3%83%83%E3%82%AF%E3%82%AC%E3%82%A4%E3%83%89-%EF%BD%9E-%E9%A7%86%E3%81%91%E5%87%BA%E3%81%97%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%81%A8%E7%B9%8B%E3%81%8C%E3%82%8A%E3%81%9F%E3%81%84-%E3%81%A8%E8%A8%80%E3%81%A3%E3%81%A6%E3%81%9F%E7%A7%81%E3%81%8C%E9%87%8E%E7%94%9F%E3%81%AE%E3%81%A4%E3%82%88%E3%81%84%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%81%A8%E3%81%A4%E3%81%AA%E3%81%8C%E3%82%8B%E3%81%AE%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%A0%E3%81%A3%E3%81%9F%E3%81%93%E3%81%A8%EF%BD%9E-ebook/dp/B0859MFRJ9/ref=sr_1_1?qid=1582966785&s=digital-text&sr=1-1&text=Piro+%2F+%E7%B5%90%E5%9F%8E%E6%B4%8B%E5%BF%97)（2020年2月29日～）
* 同人誌委託通販サービス等何らかの手段で紙版＋電子書籍ダウンロードカードの通販（2020年4月～？）

頒布物は、このリポジトリの内容を後述の手順でビルドした物と変わりありません。
値段が付いている物については、「ビルド環境を整える時間と手間をお金で買う」「書いた人にお布施する」というつもりでご購入頂ければ幸いです。

## 訂正情報・変更点

* 最新の原稿との比較
  * [電子書籍2刷（2020年4月6日付）からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.2..master)
  * [電子書籍初版（2020年2月29日付）からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.1..master)
  * [紙媒体 初刷分（2020年2月29日付）からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.0..master)
* v1.2：電子書籍2刷（2020年4月6日付）
  * 「はじめに」「おわりに」の内容を、最新のOSS Gateワークショップ開催状況に合わせて更新した。
  * 「第4章 どこにフィードバックしたらいいか分からない」内コラム「イシュートラッカーとは？」について、バグトラッキングシステムからイシュートラッキングシステムが生まれたという書き方になっていたのを、イシュートラッキングシステムの一形態がバグトラッキングシステムであるという書き方に改めた。
  * 「第5章 どう報告すればいいのか分からない」内にコラム「エラーの原因を探ってみよう」を追加した。
  * 「第6章 英語での報告の仕方が分からない」で、図版の挿入位置を変えた。
  * 「第6章 英語での報告の仕方が分からない」で、機械翻訳の例としてDeepL翻訳への言及を追加した。
  * 「第10章 要望が通らない！」内コラム「理不尽な却下もあり得る、と心得ておこう」を、章末へ移動した。
  * 「第11章 プルリクエストをマージしてもらえない！」で、よくないコミットメッセージの例を追加した。
  * 「第14章 ライセンスについてより正確に知る」内の「14.2 オープンソースの定義って？」において、オープンソースの定義の第7項に対する注釈が、誤って第4項に対する注釈になっていたのを修正した。
  * 「第14章 ライセンスについてより正確に知る」内の「14.2 オープンソースの定義って？」において、オープンソースの定義の第7項の説明が誤っていたのを修正した。
  * 全体に渡って、「という」の連続使用を減らしたり、文意がより分かりやすくなるよう表現を改めたりして、読みやすさを向上させた（つもり）。
  * 本文中で強調されたフレーズを、印刷時にも分かりやすいよう、明朝体の太字ではなくゴシック体で表示するようにした。
  * [v1.1からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.1..v1.2)
  * [v1.0からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.0..v1.2)
* v1.1：電子書籍初版（2020年2月29日付）
  * 「第9章 他の人のフィードバックから学ぼう」内の「9.2 画面上の表示に関わる問題の、より分かりやすい説明」のフィードバック例について、投稿者がインド在住の方である旨を追記した。
  * [v1.0からの全変更点](https://github.com/oss-gate/first-feedback-guidebook/compare/v1.0..v1.1)
* v1.0：紙媒体 初刷分（2020年2月29日付）


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

必要なパッケージをインストールする。

```bash
$ sudo apt install texlive-binaries texlive-lang-japanese \
                   texlive-latex-recommended texlive-latex-extra \
                   imagemagick \
                   ruby-dev build-essential
$ sudo gem install bundler unicode-display_width
```

npmのインストールも必要。
aptで入るバージョンは古いので、[Ubuntuに最新のNode.jsを難なくインストールする - Qiita](https://qiita.com/seibe/items/36cef7df85fe2cefa3ea)などで紹介されているように、`n`を使って最新安定版のnpmを使える状態にする。

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
$ sudo npm install -g .
$ cd ..
```

以上で準備完了。makeするとPDFとEPUBの両方が作られ、distディレクトリ配下に出力される。

```bash
$ git clone https://github.com/oss-gate/first-feedback-guidebook.git
$ cd first-feedback-guidebook
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
