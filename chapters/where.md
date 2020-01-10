# フォーラムとイシュートラッカーのどちらに報告するべきか分からない

# [フィードバック] OSSへのフィードバックはユーザーフォーラムとイシュートラッカーのどちらに書くべきか？

※注：この記事の対象読者は、「OSSを使用していてトラブルに遭遇しているか、改善の提案があり、その情報を開発元に伝えたいが、どこで伝えればよいかわからない」という人です。「どういう体裁で報告すればよいか分からない」「何を報告すればよいか分からない」という人向けの話はまた日を改めて書くつもりです。


結城です。

[OSS Gateワークショップ](20190529)で、初めてフィードバックをしようとしているビギナー参加者のサポートをしていると、ビギナー参加者から以下のような質問を受ける事があります。

* こんな簡単な・くだらないレベルの事を報告してもいいんでしょうか？
* ユーザーフォーラムとイシュートラッカー（バグトラッキングシステム）[^bts]]のどちらに報告すればいいんでしょうか？
* どのプロジェクト（開発元）に報告すればいいんでしょうか？

[^bts]: 「ソフトウェアの不具合」を「バグ」と呼ぶことから、バグの修正状況の追跡をする物として「バグトラッキングシステム（Bug Tracking System、BTS）」という呼び方が以前はよく使われていました。しかし、この呼び方だと「不具合ではないただの要望はバグとして取り扱うべきなのかどうなのか？」という点で混乱が生じる場合があります。Mozillaが運用するバグトラッキングシステム「Bugzilla」では、不具合報告だけでなく要望もすべてひっくるめて「バグ」と呼ぶという運用ルールにする事でこの混乱を回避していますが、運用ルールを知らない人にとっては違和感が残ります。そのため現在は一般的には、バグや要望などを「解決されるべき課題＝issue」と捉えて「イシュートラッキングシステム（Issue Tracking System、ITS）」や「イシュートラッカー」と呼んだり、あるいは、どんな課題であってもシステム上で管理される時はひとつの「チケット」になるからという事で「チケットトラッキングシステム」と呼んだりします。本稿では、ひとまず「イシュートラッカー」で統一しています。

これらの点に対する筆者の回答は、端的には以下のようになります。

* 簡単でも些細でも何でも、*あらゆる未解決の問題*は報告していい。
* *これは自分個人の問題ではなく、そのソフトウェアの全ユーザー向けに解決されるべき問題だ*、と思えるならイシュートラッカーに報告していい。
* *自分で確かめられる範囲ではこのプロダクトの上でしか問題に遭遇しない、他のプロダクトでは問題が再現しない*、と言えるならとりあえずその開発元に報告していい。

奇しくも最近、これらの事を考える上で非常に興味深い事例に出会いました。以下、それを題材として上記の点をどのように判断しているのかを語ってみます。



## 報告者からフォーラムへ、フォーラムからイシュートラッカーへ、MozillaからMicrosoftへ

当社の法人向けのThunderbirdサポートにおいて、数ヶ月前から複数のお客さまより「メール作成時に日本語入力で漢字への変換ができなくなる」という現象のお問い合わせを頂くという事がありました。

お問い合わせの中には[MozillaZineフォーラムに同様の事例の報告がある](https://forums.mozillazine.jp/viewtopic.php?f=3&t=17326)旨をお書き添え頂いた物もあり、参照してみると、スレッドの大まかな流れは以下のようになっていました。

1. このような現象が起こっている、既知の解決策はどれも有効でなかった、という情報が投稿される。（2018年12月末）
2. 現象の再現条件の特定が複数人によって進められる。（2018年12月末～1月頭）
3. Thunderbirdに対して行われた変更のうち、どの変更以降からこの現象が起こるようになったのかが特定される。(2019年1月）
4. 暫定的な回避作として、このアドオンをインストールすると現象が起こらなくなる、という情報が寄せられる。(2019年1月末～2月）

当社の検証環境でも、条件が整うと確かに現象が再現するという事を確認できました。そこで、Mozillaが製品開発のために運用しているイシュートラッカーであるBugzillaに何か情報が無いかと検索してみたのですが、思いつく限りのキーワードで検索しても該当するBugを見つけられませんでした。そのため、ひとまず筆者自身で[新しいBugとして報告を行いました](https://bugzilla.mozilla.org/show_bug.cgi?id=1550670 "1550670 - Impossible to do kana-kanji composition with MS-IME when the master password is activated")。これが2019年5月の事です。

もし既に報告されている問題であれば、そちらへの参照情報が追加され、この新しいBugは「重複する報告」としてクローズされます。しかし実際にはこれが最初の報告だったようで、最終的にはFirefoxとThunderbirdの共通基盤であるGeckoエンジンの日本語入力部分の担当であるMozillaの中野さんにまで連絡が行くという事にまでなりました[^workaround-intl]。

[^workaround-intl]: またその過程で、`intl.tsf.enable`という設定の値を`false`に変更すると現象が解消されるという、別の暫定的解決策も紹介されていました。これはWindows XP以降で標準となっている文字入力の仕組みを使うかどうかを制御する設定で、`false`に設定すると従来の文字入力の仕組みを使うようになります。音声からの文字入力などTSFで初めて可能になった事はできなくなりますが、その状態でも、キーボードからの一般的な文字入力操作に関しては特に支障なく行えます。

ただ、話はそれで終わりませんでした。仮にこれがGeckoの明白なミスに起因する現象だったのであれば、Gecko側で修正されてBugはクローズされます。しかし実際には、Mozillaの中野さんによる詳細な調査ではGecko側に問題は見当たらなかったため、Microsoft IME（MS-IME）側の不具合である可能性があるとして、中野さんからMicrosoftのフィードバック窓口へ2019年5月末に報告されたそうです。

以上が、この件の2019年5月末時点の状況です。

*ずっと以前から現象が確認されていても全く進展が無かったのが、イシュートラッカーに報告された途端に事態が動き出す*、という事は度々あります。上記の経緯のうち、フォーラムからBugzillaへの報告までの流れはまさにそのような推移に見えます。

しかし最終的な結果を見ると、*Thunderbirdの問題でなくMicrosoft IMEの問題である可能性があるなら、MozillaのイシュートラッカーであるBugzillaではなくMicrosoftに報告するのが正しかったのではないか？*　という見方もできます。もし仮に本当にMicrosoft IMEの問題だったのであれば、現象の確認から適切な場へ情報が伝わるまでに半年もの時間がかかってしまったという事になります。

さて、この問題は一体どのように取り扱われるべきだったのでしょうか？



## 誰の問題か、何をしたいかという観点で持ち込み先は変わる

ここまでの経緯には多数の論点が入り交じっていますが、目的・動機という点では大まかに以下の2つにまとめられます。

* 報告者にとっての「どうすれば自分が今困っているこの状況を脱せるのか？」という視点＝*個人の問題*を解決したいという視点
* 開発者にとっての「そのソフトウェアにどんな問題があるのか、解決されるべき問題はどんな内容なのか」という視点＝*ソフトウェアの問題*を解決したいという視点

ソフトウェアの問題が解決された結果として個人の問題が解決されるという事も、個人の問題を解決するためにした事が結果的にソフトウェアの改善にもなるという事もあります。しかし、それらはあくまで*偶然の結果そうなっただけ*で、最初から偶然に期待するというのは効率が悪くお薦めできません。

OSSでは、というよりもこれは人間社会で一般的に言える事ですが、報告・投稿を持ち込む先は目的によって決めるものです。問題がいつまでも解決されない場合、最大の原因は*問題を持ち込んだ先が適切でなかったからだった*、という事がよくあります。

## フォーラムが解決できる問題

上記の「フォーラムに報告がなされた例」では、関わった人達の期待とその結果は以下のように言えます。

* トラブルに遭遇した本人（フォーラムに最初に投稿した人）にとって：
  - 期待：
    - 自分が遭遇した問題の解決。
  - 結果：
    - フォーラムに集う人達に調べて貰えて、発生条件を絞り込めた。
    - その人固有の状況で有効な暫定的回避策が判明し、当座をしのげるようになった。
* フォーラムに集う人達にとって：
  - 期待：
    - 相談者によって持ち込まれた問題の解決の手助け。
  - 結果：
    - 助けを求めてやってきた人の問題の解決に力を貸せた。
* その後同様の問題に躓いた人達にとって：
  - 期待：
    - *問題にそもそも遭遇しない事*。
  - 結果：
    - ソフトウェアの問題は未解決のままだったので、*同じ現象に後から遭遇してしまった*。
    - フォーラムの投稿者と状況が一致していれば、暫定的解決策で現象を回避できる。
    - *フォーラムの投稿者と状況が一致しないと、暫定的解決策では現象を回避できない*。
* ソフトウェアの開発・品質向上に関わる人達にとって：
  - 期待：
    - ソフトウェアの開発が進む事、品質が向上する事。
  - 結果：
    - 普段見ていない場所で話が進行していたので、*問題の存在自体を把握できなかった*。
    - 問題が把握されなかったため、*対応もなされなかった*。

このように、個々のトラブルの解決や、同様のトラブルに遭遇した人の解決のための情報源にはなるものの、*同様のトラブルが繰り返される事そのものの解決にまではならない*のが、ユーザーフォーラムの性質と言えます。

また、ユーザーフォーラムは「ユーザー同士の相互扶助の場所」であるという点にも注意が必要です。基本的にはボランティア運営なので、分かる人がいなければ反応を得られないという事もあります。そこに集まる人は全く無関係の人よりは詳しい人である可能性が高いですが、開発者ほどには詳しくない場合も多いです[^commercial]。

[^commercial]: これに対し、当社の法人向け有償サポートサービスは、ソースコードレベルの調査を実施したり、一定の期限内で回答したり、という事をお約束する事をもって対価を頂いているという事になります。

## イシュートラッカーが解決できる問題

では仮に、最初から問題をイシュートラッカーに投稿しようとしていたら何が起こったでしょうか。筆者の見立てでは、最悪の場合の結果は以下のようになったのではないかと考えています。

* トラブルに遭遇した本人や、同様の問題に躓いた人達にとって：
  - 問題の原因調査の方法に詳しくないと、有用な情報を提供できない。
  - そもそも技術的な知識の有無以前に、英語が不得意だと、自分の置かれた状況（問題の発生条件）を上手く説明できない。
  - 原因が特定され、次のバージョンで修正されても、*今使っているバージョンでの問題は解決しない*。
  - 調査の過程で暫定的な解決策がたまたま見つからなければ、*今この瞬間のトラブルは解決しない*。
* ソフトウェアの開発・品質向上に関わる人達にとって：
  - 調査方法を知らない・開発者レベルの知識が無い人に調査の仕方を説明するために、時間と手間を使う必要がある。
  - 有効な情報を得られないと、スッキリしないものを抱えたままになる。

一方、もし理想的に推移したとすると、以下のようになるでしょう。

* トラブルに遭遇した本人や、同様の問題に躓いた人達にとって：
  - 原因が特定され、次のバージョンで修正される事になれば、そのバージョンのリリースを待てば問題は解決する。
  - *しかし、今使っているバージョンでは問題は解決しない*。
  - 調査の過程で暫定的な解決策がたまたま見つからなければ、*今この瞬間のトラブルは解決しない*。
* ソフトウェアの開発・品質向上に関わる人達にとって：
  - 問題の原因を特定できれば、根本的解決や回避策を検討できる。
  - その成果を次のバージョンに盛り込めれば、同様のトラブルの発生を防げる。
  - 根本的な原因がそのソフトウェアに無いとしても、より適切な場所へ、開発者レベルでの詳細な調査結果を報告できる。

いずれの場合も、*今この瞬間に起こっている問題の解決には必ずしもつながらないし、また、その優先順位も低い*、という事には注意が必要です。

イシュートラッカーに関わる人には、ある程度の知識が要求されます。報告者に全く知識が無いという場合、問題自体の深刻度がよほど高いと判断されれば、開発者もなんとか原因究明に必要な情報を報告者から引き出そうとして手厚く手助けする事もあります。しかし、それだけの手間をかけるのは割に合わないとなれば、残念ながらそれ以上の手助けはなされません。

このような事になるのは、OSSプロジェクトのイシュートラッカーは「個人の問題を解決する場所」ではなく、*あくまで「ソフトウェアの開発を進め品質を向上する事を目的とする場所」だから*です。


## ソフトウェアの改善・ソフトウェアの問題の解決に関わりたいならイシュートラッカーへ

例えて言えば、これは*企業の社屋や工場に誰でも出入り自由になっている状況のようなもの*です。社会科見学では見学しかできないのに対し、見学ルートを外れて「中の人達」同士の議論に混ざって発言できる、*参加の機会が開かれている*のがOSSです。そう考えれば、そこで行われている議論や開発に誰でも気軽についていける訳ではなく、機会があるかどうかとその中で一人前の参加者として振る舞えるかどうかは別の話だ、という事も納得しやすいでしょう。

しかし、これは言い換えれば、*開発に関わりたい・品質向上に寄与したいという積極的な意志を持つ人にとっての門戸が開かれている*という事です。開発の拠点が海外でも、普段の仕事がソフトウェア開発と無関係でも[^non-software-engineer]、あるいはライバル製品の開発元に所属していてすらも[^competitor]、やる気次第で自分から参入できます。

[^non-software-engineer]: ソフトウェア開発ではなく運用に従事しているという人や、まだ就職していなくて学生で開発に参加する人もいます。
[^competitor]: 実際に、Mozillaに雇用されている人達もChromiumにバグ報告をしています。

* 「ここの所に穴が開いてるみたいなんだけど、大丈夫かなあ……塞がれないのかなあ……？　気になる……」「この機能のこの部分、これだと不十分に見えるんだけどなあ……ソワソワする……」という風に、ソフトウェアのちょっとした不具合が気になって仕方ない人。
* 「ああもう！　この人達（開発者）はまるで分かってない！　俺の方がずっとスマートにこの問題を解決できるのに！」「ああもう！　なんでここの所はこんな風にできてるんだ？　使いにくい！　俺ならこんな作り方にしないのに！」という風に、問題が放置されている事に我慢がならない人[^bumptiousness]。

[^bumptiousness]: 「プログラマーの三大美徳」の1つの「傲慢」とは、このような事（自分にはこの問題を解決できるはず、という考え方をすること）を指します。

こういったモヤモヤを感じた時に、*「でも、手を出せないんだからしょうがない」と諦めないで根本的解決できる可能性が開かれているのがOSS*なのです。

ですから、「OSS開発に関わってみたい、ソフトウェアの改善に関わりたい、その最初の一歩を踏み出してみたい」と思ってOSS Gateワークショップに参加を考えた人であれば、もうその時点で「イシュートラッカーに報告する」という選択をして全く問題ない訳です。

また、その際には最初から理想的に振る舞える必要はありません。OSSプロジェクトに初めて関わる人というのは会社の新入社員と同じですから、当然要領は良くありませんし、最初は簡単な仕事からしかこなせませんし、あるいはミスもします。分からない事があれば、会社の先輩に質問するのと同じように、先に参加していた人を捕まえて質問するだけの事です。

「フォーラムに書くべきか、イシュートラッカーに書くべきか」「こんな些細な問題を報告してもいいのか」という問いへの筆者の答えが「個人の問題でないならイシュートラッカーに書いてよい」「些細でも報告してよい」となるのは、以上のような理由からです。

## まとめ

以上、OSS Gateワークショップの中で度々聞かれる「フォーラムとイシュートラッカーのどちらに書くべきか判断できない」という悩みについて、*フォーラムとイシュートラッカーの目的を把握した上で、「ソフトウェアの問題を解決する場所」というイシュートラッカーの目的に沿った報告をすればよい*、という事を語ってみました。

イシュートラッカーへの報告は、問題が解決されればより多くの人に恩恵がもたらされます[^feedback-to-upstream]。OSSのイシュートラッカーはソフトウェア開発の現場ですので、ソフトウェア開発の知識がある人はよりよい報告ができる可能性がありますし、パッチやプルリクエストを通じて直接的に問題解決を図る事もできます。一歩進んだ関わり方として、皆さんもイシュートラッカーへの報告にぜひ挑戦してみて下さい。

[^feedback-to-upstream]: 当社の法人向けサポートサービスは、お客様の問題（個別の問題）について原因や回避方法を調査してその解決を図ると同時に、その問題がソフトウェアの問題であった場合はソフトウェアの品質向上のためアップストリームへのフィードバックも行う事を心がけています。

ところで、先の事例にはもう1つ気になる点が残っています。それは、Microsoft IMEの問題だった可能性があるのにThunderbirdの問題として報告してしまってよかったのか、*自分では適切な判断ができない時は一体どこに報告すればよいのか*、という点です。[次の記事](20190619)では、それも含めて「どんな報告の仕方をすればいいか、報告の内容はどう書けばよいか」について語ってみます。

なお、当社ではOSS開発を推進したい企業さまのお手伝いをするOSS開発支援サービスを行っています（[直近のアカツキさまでの事例の紹介](20190529)）。社内のITエンジニアのOSS開発者としての活躍を促進したいとお考えの担当者さまがいらっしゃいましたら、ぜひ[お問い合わせフォーム](/contact/)よりご連絡下さい。





-----

# コラム：なぜフォーラムに投稿してしまいたくなるのか

フォーラムはユーザー同士の場だから

イシュートラッカーこわい



筆者自身もかつては、

* まず匿名掲示板で、おずおずと「こういう風に困ってるんだけど、誰か解決策を知らないだろうか？」と切り出してみる。
* それでも答えが得られなければ、おっかなびっくりユーザーフォーラムに書き込んでみる。
* 後は、誰か詳しい人が情報を吸い上げて自分の代わりに開発者に報告してくれるのを待つ。

といった考え方・行動をしていた頃があり、バグ報告をしている人の事を「すごい人達だ！」と羨望の目で見ていた記憶があります。

何故「自分で報告する」のではなく「誰かがやってくれるのを待つ」という行動を選択していたのでしょうか。


ひとつには、「バグは報告を待つのではなく、開発者自ら見つけるべき物だ」という思いがあったから

  * 自分はここまで頑張って調べたのだから、この情報には大きな価値があるはず。
  * 価値ある情報は当然注目されるべきで、当然開発者にも見つけてもらえるべき。
  * むしろ、この価値ある情報を見つけに来ない開発者の方に問題がある。

なぜそうも傲慢になるのか？
心からそう信じているという部分がないとは言えないが、それよりも、本心を包み隠すための態度が傲慢さのような形を取って表出しているのではないか？

怖いから、失敗するのが怖いから、「自分でやる」のではなく「代わりにやってくれるのを待つ」
自分の恐怖を他人の怠慢として責任転嫁

素人や部外者が下手に口出ししたら迷惑になりそうだと思うと、イシュートラッカーやメーリングリストに報告するなんてとても自分ではできない、と思ってしまう。

イシュートラッカーに報告しても「無関係」「情報が足りない」などの理由でにべもなく却下されてしまうというケースが度々あるのも事実です。筆者自身も、勇気を奮い立たせて行った報告があっというまに却下されてしまって、あの勇気は無駄だったのか……と心が折れてしまった事が何度かありました。筆者がバグ報告をためらっていた時期があった理由の1つには、そのような体験