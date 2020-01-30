# プルリクエストをマージしてもらえない！

「プルリクエスト」は元々はGitHubの用語で、GitHub登場以前は一般的には「パッチを送る」とか「変更を取り込んでもらう」といった言い方をされていました。また、GitLabでは同じような機能が「マージリクエスト」という名前になっています。色々な言い方はありますが、本書ではGitHubや同様の形態のサービスで変更を取り込んでもらうこと全般をひっくるめて「プルリクエスト」と呼称することにします。

プルリクエストは、イシューとして報告された問題を実際に解決するための変更の提案です。イシューが却下されることがあるのと同様に、プルリクエストも却下される場合はあります。この節では、プルリクエストするときの様々な注意事項をご紹介していきます。


## イシュー無しでプルリクエストするのは、基本的には控えよう


OSS Gateワークショップは、まだOSSにフィードバックをした事がない人に「不具合や要望を報告する過程を体験する」という事を目標にしています。しかしOSS開発に参加してみたいという人の中には、「実際にコードを書く事を通じて参加したい」という思いが強い人もいるでしょう。また、「英語の読み書きは苦手だけれどもコードなら書ける」ということで、英語で長々と説明するよりも端的にコード（プルリクエスト）だけで済ませたいという人もいると思います。筆者もそのように考えていましたし、今でもいきなりプルリクエストを送るという場面は度々あります。


## プルリクエストから始めると、泥沼にはまりやすい








### 議論の余地が無い変更なら、プルリクエストから始めてもいいけど……

*誰の目にも明らかなミスの訂正や、翻訳関係の変更など、是非の議論の余地が無い変更*の場合、イシューを経ずにプルリクエストから始めても問題無いと筆者は考えています。ソースコード上のミスタイプ（綴りの間違い）の修正や、言語リソースの翻訳ミスの修正、未翻訳部分の訳文の追加などがこれにあたります。

ただ、時には「誤記のように見えて実は意図的にそう書いてあった」「一般的な文脈では誤訳に見えるが、他のアプリケーションに合わせるとその訳の方が適切である」のような場合もあります。そういったケースでは、作成したプルリクエストのコメント上ののやり取りで指摘を受けることになります。

なお、プロジェクトメンバー間での対面での相談やチャットなど別の場所で既に議論が尽くされていて、後はコードを変更するだけであるという場合に、傍目からは「急にプルリクエストが行われて、何故かすぐにマージされた」という見え方になる場合もあります。これは経緯を知らない人には区別が付かないので、注意が必要です。

### コラム：「Good First Issue」から始めるフィードバック

本書では基本的に「自分が遭遇したつまずきを報告する」という流れでのフィードバックを推奨しています。しかし、まだ何もつまずいていないものの、自分が普段からお世話になっている有名なOSSの開発に参加してみたい、問題解決に取り組んだりプルリクエストを出したりしてみたい、という人もいるかもしれません。あるいは、つまずいた問題が大きすぎて、自分には手に負えない、という場合もあるかもしれません。

そういう人は、そのプロジェクトのイシュートラッカーで「Good First Issue」や「Good First Bug」などとタグ付けされたイシューを探してみるとよいかもしれません。規模の大きなプロジェクトで、プロジェクトに協力してくれる人を随時募っている場合には、新規のプロジェクト参加者が挑戦するうのにちょうどいい難易度の課題にそのようなタグが付けられている場合があります。「これに挑戦します」と宣言するコメントをして、進捗状況を随時共有しながら課題の解決に取り組んでみるとよいでしょう。分からないことがあったら、質問をするとプロジェクトに参加中の先達からアドバイスをもらえるかもしれません。

[Node.jsへのコントリビュート解説、そしてOSSへ貢献するということ - 別にしんどくないブログ](https://shisama.hatenablog.com/entry/2019/12/04/204400#%E8%8B%B1%E8%AA%9E%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)






Supershipさまで「既存のコードを変更するノウハウ」を学ぶ研修を行いました - ククログ(2018-11-12)
https://www.clear-code.com/blog/2018/11/12.html


# 既存のコードを変更する時の流れ

 1. 変更対象のコードを把握する
 2. 変更の計画を立てる
 3. 自動テストを書く
 4. 実際に変更を行う

# 実際には

 1. **変更対象のコードを把握する**
 2. 変更する
    1. 変更の計画を立てる
    2. 自動テストを書く
    3. 実際に変更を行う

# つまり

*変更対象のコードを把握する事*
のウェイトが非常に大きい。



*周囲のコードに*
*馴染むコード*
を書く



# 理想的な仕上がりの「変更」

 * 現在は、この機能がない・こういう問題がある
 * 機能があったとしたら・問題がなかったとしたら、*当然*こう書かれているはずだろう
   （元々作った人が実装していたら、当然こう実装されていただろう）

# それをするためには？

 * 元作者になりきる
 * 前提知識を共有した
   *チームの一員*になる

# 馴染むコードにするために

 * *コーディングスタイル*を合わせる
 * *設計方針*を合わせる
 * *背景事情*に合わせる

# つまり、読み取るべき情報は

 * コーディングスタイル
 * 設計方針
 * 背景事情

どういう所を見ればそれらが分かる？


 * *コーディングスタイル*
 * 設計方針
 * 背景事情

# コーディングスタイル

 * コード全体
 * スタイルガイド、コーディング規約（ある場合）

# コーディングスタイルの例

 * 命名規則
 * スペースの空け方、詰め方
 * 改行の入れ方
 * 「この機能は使わない」
   「この書き方はしない」


# 命名規則1

 * *C*lass*N*ame （Pascal Case / Upper Camel Case）
 * variable*N*ame （Camel Case / Lower Camel Case）
 * variable*_*name （Snake Case）
 * file*-*name （Kebab Case / Chain Case）
 * CONSTANT_NAME （すべて大文字）

# 命名規則2

 * String#include
   （原形）
 * String#include*s* 
   （三人称単数形）
 * items（複数形）
 * itemArray（単数形）

# 命名規則3

よく使われるネーミング

 * *is*Multiple / *has*Item
 * *get*Name / *set*Name
 * *fetch*Data
 * valid*?* / save*!* (ActiveRecord)


# 「map」か「collect」か

```ruby
results = items.map {|item| ... }
results = items.collect {|item| ... }
```

# 「こう書く事もできる」

 * 色々な書き方ができる≠色々な書き方をしていい
 * どの書き方でもいいので、*統一する事*が大事
 * 迷ったら有名プロジェクトのコーディングスタイルをそのまま採用

# 良いコードと馴染むコードは別

 * リーダブルコードなどで
   「これは冗長」「おすすめしない」
   とされているスタイルが
   採用されている場合もある
 * 「馴染むコードを書く事」と
   「よりリーダブルなコードに直す事」
   は別の作業と考えよう



# 設計方針を読み取る

 * ディレクトリ構成を見る
 * 自動テストを読む
 * コードの流れを追う
   * 初期化処理から
   * 「この機能を調べたい」と
     決めた部分から

# ディレクトリ構成

「この機能を変更するときは
*このあたり*を探せば
ファイルが見つかる*はず*」

という判断に必要な情報

# モジュールの設計上の分類でまとめるのか？

```
+ models
|  + login.rb
|  + user.rb
+ controllers
|  + login_controller.rb
|  + user_controller.rb
+ views
   + login
   + user
```

# アプリケーションとしての機能単位でまとめるのか？

```
+ model
+ login
|  + controller
|  + view
+ user
   + controller
   + view
```



# 自動テスト

 * TDD（test）形式？
 * BDD（spec）形式？

形式の違いよりも
*中身*の方に注目しよう

# テストの「テスト」以外の意義

 * 自動テストは*各モジュールの*
   *実際の使い方のサンプル集*
   である
 * モジュールの実装を見るより、
   テストを見た方がよく分かる

# テストの例

```ruby
# test/unit/issue_test.rb

class IssueTest < ActiveSupport::TestCase
...
  def test_create_minimal
    issue = Issue.new(:project_id => 1, :tracker_id => 1,
:author_id => 3, :subject => 'test_create')
    assert issue.save
    assert_equal issue.tracker.default_status, issue.status
    assert issue.description.nil?
    assert_nil issue.estimated_hours
  end
```

# テストから読み取れる設計方針

 * モジュールの分け方
 * モジュール同士の連携のさせ方


同じプロダクトの中でも、Modelの中とControllerの中など文脈によっても視点が変わってくる

# モジュールの粒度（責任範囲）

入力した文章を機械学習のために整形する例

```ruby
# トークナイズだけを担うモジュールがある
words = Tokenizer::Whitespace.call(
          "this is a list of cool words!")
...
# トークンのフィルタリングだけを担うモジュールがある
words = TokenFilter::Stopword.call(words)
```

# モジュール同士の連携の様子の見方

 * どのような順番で初期化するのか？
 * 必要な情報を外部からどうやって与えるのか？

を見よう

# コードの流れを追ってみる

 * 初期化処理から・呼び出し元から順に流れを追う
 * 目に見えている情報から逆順に処理の流れを追う


# 設計を「合わせる」という事

 * *今の自分が*分かりやすいかどうかではなく、*次にコードを変更する人が*分かりやすいかどうか
 * 「欲しい物は、一般的な傾向に従って探せば見つかる」という状態を維持する事が大切



# 背景事情を読み取る

 * ドキュメント
 * コメント
 * コミットログ

# ドキュメント

（省略）

# コメント

「なぜそうしているのか」が書かれていることがある

# コミットログ

 * `git log app/models/issue.rb`
 * `git log -p app/models/issue.rb`

などの方法で見られるが、
漫然と読むのは現実的でない

# テーマで辿る1

例：Railsのバージョンアップにあたってどういう作業をしたのか？

`git log | grep -i 'rails' -B 4`

```
commit 9947003a1145d66fb5457075908d1b1493763528
Author: Go MAEDA <maeda@farend.jp>
Date:   Wed Aug 8 13:29:11 2018 +0000

    Update Rails to 5.2.1.
--
commit ce1c65225037622c10568b3e6955cecce7e80fd9
Author: Jean-Philippe Lang <jp_lang@yahoo.fr>
Date:   Sat Jun 23 05:13:29 2018 +0000

    Upgrade to Rails 5.2.0 (#23630).
```

# テーマで辿る2

`$ git show ce1c65225037622c10568b3e6955cecce7e80fd9`

```diff
commit ce1c65225037622c10568b3e6955cecce7e80fd9
Author: Jean-Philippe Lang <jp_lang@yahoo.fr>
Date:   Sat Jun 23 05:13:29 2018 +0000

    Upgrade to Rails 5.2.0 (#23630).
    
    git-svn-id: http://svn.redmine.org/redmine/trunk@17410 e93f8b46-1217-0410-a6f0-8f06a7374b81

diff --git a/Gemfile b/Gemfile
index 64598a5..98f27f6 100644
--- a/Gemfile
+++ b/Gemfile
@@ -4,7 +4,7 @@ if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('1.5.0')
   abort "Redmine requires Bundler 1.5.0 or higher (you're using #{Bundler::VERSION}).\nPlease update with 'ge
 end
 
-gem "rails", "5.1.6"
+gem "rails", "5.2.0"
 gem "coderay", "~> 1.1.1"
 gem "request_store", "1.0.5"
 gem "mime-types", "~> 3.0"
diff --git a/app/models/issue.rb b/app/models/issue.rb
index 91f53c1..114d962 100644
--- a/app/models/issue.rb
+++ b/app/models/issue.rb
@@ -1016,8 +1016,7 @@ class Issue < ActiveRecord::Base
   # Returns the previous assignee whenever we're before the save
```


# 行ごとの変更履歴から辿る1

`git blame app/models/user.rb`

```
027bf938 app/models/user.rb         (Jean-Philippe Lang  2007-03-12 17:59:02 +0000  17) 
027bf938 app/models/user.rb         (Jean-Philippe Lang  2007-03-12 17:59:02 +0000  18) require "digest/sha1"
027bf938 app/models/user.rb         (Jean-Philippe Lang  2007-03-12 17:59:02 +0000  19) 
77074571 app/models/user.rb         (Jean-Philippe Lang  2009-09-12 08:36:46 +0000  20) class User < Principal
a4d7a99c app/models/user.rb         (Jean-Philippe Lang  2010-12-12 13:19:07 +0000  21)   include Redmine::SafeAttributes
e86f9711 app/models/user.rb         (Toshi MARUYAMA      2011-08-21 01:57:25 +0000  22) 
5a1fcf82 app/models/user.rb         (Jean-Philippe Lang  2011-11-26 17:37:20 +0000  23)   # Different ways of displaying/sortin
79f92a67 app/models/user.rb         (Jean-Philippe Lang  2008-01-25 10:31:06 +0000  24)   USER_FORMATS = {
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  25)     :firstname_lastname => {
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  26)         :string => '#{firstname} #{last
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  27)         :order => %w(firstname lastname
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  28)         :setting_order => 1
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  29)       },
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  30)     :firstname_lastinitial => {
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  31)         :string => '#{firstname} #{last
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  32)         :order => %w(firstname lastname
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  33)         :setting_order => 2
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  34)       },
6e6c6fac app/models/user.rb         (Jean-Philippe Lang  2014-01-24 09:23:11 +0000  35)     :firstinitial_lastname => {
6e6c6fac app/models/user.rb         (Jean-Philippe Lang  2014-01-24 09:23:11 +0000  36)         :string => '#{firstname.to_s.gs
6e6c6fac app/models/user.rb         (Jean-Philippe Lang  2014-01-24 09:23:11 +0000  37)         :order => %w(firstname lastname
6e6c6fac app/models/user.rb         (Jean-Philippe Lang  2014-01-24 09:23:11 +0000  38)         :setting_order => 2
6e6c6fac app/models/user.rb         (Jean-Philippe Lang  2014-01-24 09:23:11 +0000  39)       },
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  40)     :firstname => {
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  41)         :string => '#{firstname}',
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  42)         :order => %w(firstname id),
399223da app/models/user.rb         (Jean-Philippe Lang  2012-10-30 08:40:12 +0000  43)         :setting_order => 3
de0e0f09 app/models/user.rb         (Toshi MARUYAMA      2012-10-01 07:07:49 +0000  44)       },
```


# 行ごとの変更履歴から辿る2

`git show de0e0f09`

```diff
commit de0e0f09a33b20170468d9fdc67c4b5b7ac085d2
Author: Toshi MARUYAMA <marutosijp2@yahoo.co.jp>
Date:   Mon Oct 1 07:07:49 2012 +0000

    pin user format order at setting panel (#10937)
    
    git-svn-id: svn+ssh://rubyforge.org/var/svn/redmine/trunk@10542 e93f8b46-1217-0410-a6f0-8f06a7374b81

diff --git a/app/controllers/settings_controller.rb b/app/controllers/settings_controller.rb
index 3d2f9c1..e3387e4 100644
--- a/app/controllers/settings_controller.rb
+++ b/app/controllers/settings_controller.rb
@@ -39,7 +39,8 @@ class SettingsController < ApplicationController
       redirect_to :action => 'edit', :tab => params[:tab]
     else
       @options = {}
-      @options[:user_format] = User::USER_FORMATS.keys.collect {|f| [User.current.name(f), f.to_s] }
+      user_format = User::USER_FORMATS.collect{|key, value| [key, value[:setting_order]]}.sort{|a, b| a[1] <=
+      @options[:user_format] = user_format.collect{|v| v[0]}.collect{|f| [User.current.name(f), f.to_s]}
       @deliveries = ActionMailer::Base.perform_deliveries
 
       @guessed_host_and_path = request.host_with_port.dup
```


# コミットログを活用するためには

コミットメッセージに*有用な情報*を含めておかないといけない

 * 「ユーザーがグループに所属していない時にログインに失敗する問題を修正」
 * 「チケットの作成時に空のフィールドを許容しないように変更」

5W1Hのうちの「Why」

# いいかげんなコミットメッセージはログの有用性を損なう

 * 「バグ修正」
 * 「テスト」
 * 「腹減った」

コミットログの書き方も揃える。





理想的には、その開発者が書いたらこうなるであろう、というコードを書くのがよい。


コーディングスタイルを合わせる
他のコードに合わせる
指摘を受けたら直す
丁寧なプロジェクトでは、ビルド手順の中にコーディングスタイルのチェックの仕方が書いてあることもある
前章の例の「プロジェクトオーナーの普段の作業環境と異なる作業環境への対応」でやっているように、コードフォーマッターを常に通すようにするようなフィードバックをしてもいい。


名前付けを合わせる。
「リーダブルコード」などで「こういう書き方をすると読みやすい」という例がいくつも紹介されているが、そういう中でどの書き方を選ぶか？　というところに個性が出る。
例えば

n_items
itemsCound


設計を合わせる。モジュールの分割の粒度を揃える。





OSS初心者がつまづきながらOSSマナーを学んでいく話 - Speaker Deck
https://speakerdeck.com/fuqda/osschu-xin-zhe-gatumadukinagaraossmanawoxue-ndeikuhua-4edf8e12-a019-4fa6-bc93-5be40a788e86

OSSで結果を出す方法 - Speaker Deck
https://speakerdeck.com/knu/ossdejie-guo-wochu-sufang-fa?slide=3

このあたりで語られているような内容。







### コラム：自動テストと良い報告の類似性


開発現場でソフトウェア開発を手がけている人にとっては、「再現手順」「実際の結果」「期待される結果」の3要素に近い物にすでに馴染みがあるかもしれません。それは、自動テストです。

自動テストは、「テストの手順、実測値、期待値」の3つを定義しておき、手順の実行結果の実測値が期待値と異なっていればテスト失敗と見なすというものです。

報告の内容をそのままテストにした回帰テストが有効





## 悪いフィードバック：プロジェクトの背景を踏まえないハックの提案

筆者も、過去に強引な実装のパッチを代理で投稿してもらった事がありましたが、実装の筋が悪すぎたためか、それ以上話が進む事はありませんでした。

[61846 - Undockable My Sidebar - in a new window](https://bugzilla.mozilla.org/show_bug.cgi?id=61846)










## 何をしても駄目なときは

### フォークするしかない？　無闇にフォークしちゃ駄目？

問題を再定義して、プロジェクトのスコープに収まるようにして、筋の良い実装も用意して、それでも要望を受け入れてもらえない、ということはあります。最終的に要望を受け入れるかどうかは、そのプロジェクト内部の人が決定することです。外部から協力するだけの立場の人には、残念ですがその判断への介入はできません。

そういうときに、外部協力者の立場で取れる最後の手段が「フォーク」です。設定されているライセンスの条件に従う限り、誰もが自由にそのOSSを改造し、再配布することができます。その改造の成果を元の開発プロジェクトに還元しないまま独立したプロジェクトとして継続する、という選択肢です。

リソースの無駄な分散を防ぐためにも、ユーザーの混乱を避けるためにも、*フォークは可能な限り避けるのが望ましい*です。どうしてもフォークする場合は、それ以後の開発やメンテナンスに要するすべてのリソースを自前でまかない、最後までそのソフトウェアの面倒を見続ける覚悟が必要です。

そのため、大きなOSSプロジェクトほど、フォークは珍しいです。近年で観測された大きなフォークといえば、WebKitからGoogleがフォークして始めたBlinkのように、フォーク主体に膨大なリソースがある場合か、OpenOffice.orgからのLibreOfficeya
ownCloudからのNextcloudのように、フォーク元の主要開発者達が何らかの理由で元プロジェクトから離反して、フォーク先にそのまま合流した場合くらいでしょう。

Firefox 28からフォークしたPale Moonや、Firefox 56からフォークしたWaterfoxのように、個人や少人数のグループが大規模なプロジェクトをフォークしたケースは、健全な状態を保ち続けられていないことが多い、という印象が筆者にはあります[^forked-gecko]。「フォークしたはいいものの、実際やってみたら意外と大変で、しばらくしたら更新が滞ってしまいました」というのは、ユーザーに過剰な期待を持たせた挙げ句に振り回してしまう、最悪の結末です。

[^forked-gecko]: これらのフォーク版は、フォーク以後のFirefoxで行われた性能向上や安全性向上のための抜本的な変更、最新のWeb技術への対応などが反映されておらず、最新のFirefoxと比べるとだいぶ見劣りする状態になっています。

### いざというときの選択肢として

しかし、そうは言っても「絶対にフォークしてはならない」というわけでもありません。

上述のとおり、プロジェクトの運営主体を完全に引き継いで責任を持って継続できそうなのであれば、あるいは、フォーク版を自分しか使わなくて不利益はすべて折り込み済みなのであれば、フォークは選択肢の一つとして考慮する価値があります。

実際に筆者にも、元プロジェクトには絶対に取り込んでもらえない独自の機能が、どうしても切実に業務上必要だという理由で、他の人の開発したOSSをフォークして以後、ニーズに応じて回収を続けながら10年近く維持し続けている[実例](https://github.com/clear-code/flex-confirm-mail/)があります。

「いざとなったらフォークして続けられる」という点は、OSSの強みです。もしフォークという手段が許されていなければ、やりたいビジネスを諦めたり、自分の使い方での致命的な不便を強いられたりしなくてはなりません。*覚悟と努力次第で困難を乗り越えられる余地が常に残されている*ということに筆者は安心感を覚え、逆に、プロプライエタリな製品には「これ、いつまで使い続けられるんだろう？」と不安を覚える、というのは、誇張ではなく実際の思いです。

「そんなタフな選択ができるのは、あなた（筆者）がスーパーエンジニアだからだ」と思われるでしょうか？　いいえ、そんなことはありません。筆者のOSS開発者としてのキャリア自体、他の人が開発を放棄して動かなくなってしまったソフトウェアを、再び動くように見よう見まねで修正したところから始まっています[^fork-of-non-free-software]。当時の筆者はオブジェクト指向もロクに分かっていないようなド素人でした。その元ソフトウェアはごく単純な物でしたが、それでも当時の筆者にとっては、全貌を理解しきれない、手に余る代物としか思えませんでした。

[^fork-of-non-free-software]: 実を言うと、このときフォークの元にしたソフトウェア（Mozilla Application Suiteのコンテキストメニュー拡張機能）にはオープンソースライセンスが設定されていませんでした。自分の記憶が正しければ、元の作者の方が「習作のような物なので権利は主張しない」という旨のことをおっしゃっていたため、パブリックドメイン扱いとして、こちらでオープンソースなライセンスを設定したという経緯だったように思います。

しかし、動かなくなっていた原因箇所をどうにか直して動く状態に戻せたことで、筆者はそれを足がかりとして学習を進められました。当時の筆者にとっては、入門書に書かれていた内容（基本中の基本）と自分のやりたかった事（高度なGUIを持つソフトウェア）との間のギャップが大きすぎて途方に暮れていましたが、「すでに動く状態のソフトウェア」のソースコードを読むことによって、「そうか、こういう機能を作りたいときはこういう書き方をするんだ」という実践的な知識を得ていけたのでした。

また、ソフトウェアの公開の仕方、継続的なメンテナンスの仕方、要望の受け答えの仕方など、コーディングそのものとは異なる周辺領域の様々な経験についても、そうして「自分のプロジェクト」を持つようになって以降、必要に迫られて身に着ける形で、非常に多くのものを得られました。

本書は「OSSへのフィードバックの仕方」を解説していますが、実際の所、*良いフィードバックとは「プロジェクトオーナーが受け取って嬉しいと思えるフィードバック」の一言に尽きます*。どうだったら嬉しいのかということは、プロジェクトオーナーの立場を経験してみるとよく分かる部分が多々あります。そういう機会になるという意味で、皆さんもフォークをきっかけに「自分のプロジェクト」を持ってみてはいかがでしょうか？
