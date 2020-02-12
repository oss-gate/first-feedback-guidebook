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

```bash
$ sudo apt install texlive-binaries texlive-lang-japanese
$ sudo gem install review
$ sudo npm install -g easybooks
$ cd chapters
$ easybooks first-feedback-guidebook.json
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
