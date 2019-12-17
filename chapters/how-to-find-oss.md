# OSSを探そう

OSSにフィードバックするということは、当たり前ですが、フィードバック先のOSSが必要です。本節では、フィードバック先を思いつけない人のために、無理のないフィードバック先OSSの見つけ方を紹介します。（すでに「このOSSにフィードバックしたい」という対象が決まっている・フィードバックしたい対象がOSSと分かっている場合、この章は斜め読みで飛ばしてもらってもおおむね問題ないです。）


## 身のまわりにたくさんあるOSS

OSS Gateワークショップに来られた方に「フィードバックしたいOSSは何かありますか？」と聞くと、「Linuxカーネル」や「Docker」といった有名なプロジェクトの名前を挙げられる事が度々あります。もちろん、本当にLinuxカーネルをガッツリ読んでパッチを書きたいという人もいるとは思うのですが、単に「OSSと言われてそれらの有名なプロジェクトくらいしか思い浮かばなかった」と見受けられるケースでは、筆者はなるべく*もっと身近な・小規模のOSS*へのフィードバックから始めるようお薦めしています[^small-start]。

[^small-start]: というのも、有名だったり大規模だったり歴史が長かったりするOSSは、「別に今の段階で何か具体的に使用上で困っているわけではない」という人がフィードバック先にするには色々とハードルが高い場合が多いからです。例えば、Issue Trackerではなくメーリングリストが主な情報のやり取りの場だったり、独自の高機能なイシュートラッカーを使っていたり、プルリクエスト形式ではなく伝統的なパッチの形で修正を送る必要があったりということがあります。

「身近なOSS」なんて思いつかない、という人でも、普段の仕事で使うアプリケーションやコマンドを作業の順番に従って思い浮かべてみると、恐らくOSSがいくつも見つかるはずです。例えば以下の要領です。

* インターネット上の情報を調べるためにChromeを起動した。
  - ChromeのベースとなっているChromiumはOSSです。
  - Chrome/Chromiumが依存している[crc32c](https://github.com/google/crc32c)、[dom-distiller-js](https://github.com/chromium/dom-distiller)、[enum34](https://bitbucket.org/stoneleaf/enum34/src/default/)などの多数のライブラリ（ `chrome://credits/` で確認できます）もOSSです。
  - Chrome/Chromiumで使える拡張機能にもOSSが多くあります。
* 作業を始めるために、ターミナルを起動して、Bashの上で`git clone`を実行した。
  - GitはOSSです。
  - BashもOSSです。
* Ruby on Railsで構築されたサービスのユニットテストを走らせるために、`bundle instalL`して`rake test`した。
  - Ruby on RailsはOSSです。
  - RubyもOSSです。
  - RailsやRailsアプリケーションの`Gemfile`に従って`bundle install`でインストールされた多くのGemもOSSです。
  - `bundle`コマンドを提供するBundlerもOSSです。
  - `rake`コマンドを提供するRakeもOSSです。
* ソースコードを編集するためにVisual Studio Codeを起動した。
  - VSCodeはOSSです。
  - VSCodeのベースになっているElectronもOSSです。
  - ElectronのベースになっているChromiumもOSSです。
  - VSCodeで使えるプラグインにもOSSが多くあります。
* Vue.jsで構築されたフロントエンドにファイルを追加し、ESLintでエラーがない事を確かめて、Babelでトランスパイルした。
  - Vue.jsはOSSです。
  - ESLintもOSSです。
  - BabelもOSSです。
  - ESLintやBabelの`package.json`に従ってインストールされた多くのNPMモジュールもOSSです。
* 編集したソースコードをコミットする時、コミットメッセージの編集にVimを使った。
  - VimもOSSです。
  - VimのプラグインにもOSSが多くあります。

こうして見てみると、*開発に使用しているフレームワーク自体*や*ツール*がOSSであったり、また、有名なOSSも*名前を聞いた事のないような無数のOSSを利用*して作られていたり、という状況である事が分かります。現代のソフトウェア開発の現場では、OSSを全く使わずにいるということはあまりないでしょう。

## ソフトウェアがOSSかどうかを調べよう

ところで、いきなりたくさん例を挙げましたが、そもそも「どうだったらOSSなのか？」を説明していませんでした。皆さんは、「GitHubにある物はみんなOSSなんだろう」「ソースコードを読める物はみんなOSSなんだろう」と思っていませんか？　だとしたら、それは大きな誤解です。

OSS（Open Source Software）とは、端的には*[オープンソースイニシアティブという団体（OSI）がオープンソースライセンスだと認定しているライセンス一覧](https://opensource.org/licenses)に載っているいずれかのライセンスの元で頒布されているソフトウェア*のことを言います。

多くのオープンソースライセンスは「何らかの形でライセンスを明記する事」を利用条件に含めているため、根気よく調べると何かしらの情報を見つけられるようになっているはずです。「OSSに何かフィードバックしてみたいが、具体的にはビッグネーム以外すぐに思いつけない」という場合には、まずは自分が直接的・間接的に使用しているソフトウェアの中からOSSを探してみるのがお薦めです。LinuxカーネルやDockerよりは、ずっと身近な所で見つけられるはずです。

以下に、ソフトウェアのライセンスを確認する方法の代表的な例をご紹介します。

### ソフトウェア自体を操作してライセンス情報を見る

GUIを持つソフトウェアだと、「ファイル」や「ヘルプ」メニュー配下の「（ソフトウェア名）について」「ライセンス」のような項目からライセンスを情報を確認できる場合が多いです。いくつか例を示しましょう。

* Microsoft Visual Studio Codeでは、[「Help」→「View License」で開かれるページ](https://code.visualstudio.com/license)の冒頭に「Source Code for Visual Studio Code is available at [https://github.com/Microsoft/vscode](https://github.com/Microsoft/vscode) under the MIT license agreement at [https://github.com/Microsoft/vscode/blob/master/LICENSE.txt](https://github.com/Microsoft/vscode/blob/master/LICENSE.txt).（VSCodeのソースコードはMITライセンスの元で入手可能です）」と書かれています。MITライセンスは前述したOSIのオープンソースライセンス一覧に記載されているので、VSCodeはOSSだと言えます。
* Mozilla Firefoxでは、「ヘルプ」→「Firefoxについて」を選択して開かれるバージョン情報のダイアログに含まれている「ライセンス情報」というリンクをクリックすると、`about:license` というFirefoxに内蔵されたページが開かれます。この冒頭には「Binaries of this product have been made available to you by the Mozilla Project under the Mozilla Public License 2.0 (MPL).（この製品のバイナリはMozillaプロジェクトによってMozilla Public License 2.0で利用可能とされています）」と書かれています。MPL2.0もOSIのオープンソースライセンス一覧に記載されているので、FirefoxもOSSだと言えます。

CLI（コマンドラインインターフェース）のソフトウェアだと、必要な引数を何も指定しなかったり、`--version` オプションを指定したり、あるいは `--help` オプションを指定して起動したりすると、バージョン情報の一環としてライセンスに関する記述が出力される場合があります。例えばUbuntu 18.04LTSの端末上で`bash --version`を実行すると、以下のように出力されます。

```
$ bash --version
GNU bash, バージョン 4.4.20(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 またはそれ以降 <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

GPLバージョン3もOSIのオープンソースライセンス一覧に記載されているので、GNU bashもOSSと言えます。

デーモンのような常駐型の物やライブラリなどのように、直接操作するためのインターフェースを持たないソフトウェアでは、残念ながらこの方法は使えません。それらの場合は別の方法でライセンスを確認する必要があります。

### パッケージの詳細ページでライセンス情報を見る

RubyGems、npmなどのパッケージ管理システムのリポジトリのWebサイトでは、パッケージの詳細情報を見るとライセンスの情報が標示されている場合があります。代表的な各言語のパッケージ管理システムで、ライセンスを実際に確認できる例をいくつかご紹介しましょう。

* Mocha（Node.jsのnpm）：[パッケージの詳細ページ](https://www.npmjs.com/package/mocha)の右側に、ライセンスはMITであると標示されています。
* XlsxWriter（PythonのPyPI）：[パッケージの詳細ページ](https://pypi.org/project/XlsxWriter/)の左側に、ライセンスはBSDであると標示されています。
* Rails（RubyのRubyGems）：[パッケージの詳細ページ](https://rubygems.org/gems/rails)の右側に、ライセンスはMITであると標示されています。
* Composer（PHPのPackagist）：[パッケージの詳細ページ](https://packagist.org/packages/composer/composer)の下の方に、ライセンスはMITであると標示されています。
* libc（Rustのcrates.io）：[パッケージの詳細ページ](https://crates.io/crates/libc)には、ライセンスはMITまたはApacheライセンス2.0であると標示されています。
* MongoDB（PerlのCPAN）：[パッケージの詳細ページ](https://metacpan.org/pod/MongoDB)の左側に、ライセンスはApacheライセンス2.0であると標示されています。

これらのライセンス情報は、作者によってパッケージ自体に記載されたメタ情報に基づいて標示されています。ライセンス情報はメタ情報としては必須項目になっていない場合があるため、パッケージによってはライセンスが標示されていない事もあります。

LinuxやBSDなどのOSディストリビューションのパッケージ管理システムにおいても、同様に各ソフトウェアのライセンス情報が標示されています。例えばファイルを同期するユーティリティのrsyncであれば、以下の要領です。

* [Debianのパッケージ詳細ページ](https://packages.debian.org/ja/sid/rsync)や[Ubuntuのパッケージ詳細ページ](https://packages.ubuntu.com/eoan/rsync)では、右側にある「著作権ファイル」というリンクの遷移先に、ライセンスはGPLバージョン3である旨が標示されています。
* [Portsのパッケージ検索結界地欄](https://www.freshports.org/search.php?query=rsync&search=go&num=10&stype=name&method=match&deleted=excludedeleted&start=1&casesensitivity=caseinsensitive)では、検索結果の情報の中に「Licenses: GPLv3」と標示されています。
* [MacPortsのパッケージ検索結果一覧](https://www.macports.org/ports.php?by=name&substr=rsync)では、検索結果の情報の中に「Licenses: GPL-3+」と標示されています。

各OSディストリビューションのパッケージリポジトリでは、パッケージは各ソフトウェアの作者ではなくパッケージメンテナーという専任者が登録作業を行っています。ライセンスが不明瞭なままリポジトリに格納されることはあり得ないため[^package-license]、これらの情報の信頼性は高いと言えます。

[^package-license]: 各パッケージリポジトリは、ソフトウェアの作者が許諾した条件の下で各ソフトウェアをパッケージ化して再配布しています。よって、リポジトリへ収録されている時点で、そのソフトウェアのライセンスの確認は必ず取れている事になります。

### プロジェクトの公式サイトを見る

信頼できる情報ソースという意味では、各ソフトウェアの開発プロジェクトの公式サイトを参照するのも良い方法に思えます……が、実はこれは筆者としてはあまりお進めできません。何故かというと、*調べるのが大変なわりに不正確な情報である場合があるから*です。

例えば[MariaDBの公式サイト](https://mariadb.org/)では「About」配下にライセンスの情報があり「MariaDB Server is open source software and free to use as stated in the General Public License.（MariaDBサーバーはオープンソースソフトウェアで、GPLの条件下で無償/自由に利用できます。）」と書かれていますが、GPLのバージョンがいくつであるか記載されていません。GPLはバージョンによって条件が異なるため、バージョンを誤認して使うとトラブルの元になり得ます。

別の例として、[Apache HTTP Serverの公式サイト](https://httpd.apache.org/)は左側のメニューに「License」という項目があり、ここからライセンスの情報を確認できそうに見えますが、実際にはこのリンク先はApacheライセンスというオープンソースライセンスそのものの説明になっています。ここからは、Apache HTTP Serverというソフトウェア自体がApacheライセンスのバージョンいくつに該当するかは読み取れません。

このように、公式サイトから正確なライセンス情報を確認するのは意外と大変で、しかも場合によっては公式サイトの更新が滞って不正確な情報のままになっていて内容を鵜呑みにできないとなると、労多くして実り無しという事になってしまいます。こういう事が起こってしまうのは、公式Webサイトが外部ドキュメントの一種として、ソフトウェア本体とは別に管理されている場合が多いためです。ソフトウェアだけ更新されてドキュメントが更新されていないというのは、残念ですがOSSに限らずよくあることですよね。

ですので、筆者は*ソースコード自体に添付されたライセンス情報を確認すること*をお薦めしています。


### ソースコードを見る


* `README`ファイルに端的に「このソフトウェアは何々ライセンスです」と書かれている事もあります。
* 公開されているソースコードのリポジトリ上に`COPYING`（著作権情報）や`LICENSE`（ライセンス情報）といった名前のファイルがあり、そこに詳細が書かれている場合もあります。


### ライセンスが明記されていない場合は？






### コラム：実は「OSS」ではないソフトウェア

[Nginxの公式サイト](https://nginx.org/en/)はトップページ上に「The sources and documentation are distributed under the 2-clause BSD-like license.（ソース及びドキュメントは2条項BSDライクライセンスで配布されます。）」と書かれていますが、2条項BSD「ライク」ライセンスは前述のオープンソースライセンス一覧に記載されていないので、厳密にはNginxはOSSではないということになります。これについては、詳細は別項で解説しています。

なお、GNUプロジェクトで言うところの「自由ソフトウェア」についてはそのような認定は特に行われておらず、[自由ソフトウェアの条件](https://www.gnu.org/philosophy/free-sw.ja.html)を満たしていれば自由ソフトウェアと呼んでよいようなので、Nginxは「OSSではないが自由ソフトウェアである」という事になります。

