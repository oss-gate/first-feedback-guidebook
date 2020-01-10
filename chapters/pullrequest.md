# [フィードバック] プルリクエストを出してもなかなかマージしてもらえない場合にするべきこと

OSS初心者がつまづきながらOSSマナーを学んでいく話 - Speaker Deck
https://speakerdeck.com/fuqda/osschu-xin-zhe-gatumadukinagaraossmanawoxue-ndeikuhua-4edf8e12-a019-4fa6-bc93-5be40a788e86

OSSで結果を出す方法 - Speaker Deck
https://speakerdeck.com/knu/ossdejie-guo-wochu-sufang-fa?slide=3

このあたりで語られているような内容。


----

OSS Gateワークショップは、まだOSSにフィードバックをした事がない人に「不具合や要望を報告する過程を体験する」という事を目標にしています。しかしOSS開発に参加してみたいという人の中には、「実際にコードを書く事を通じて参加したい」という思いが強い人もいるでしょう。また、「英語の読み書きは苦手だけれどもコードなら書ける」ということで、英語で長々と説明するよりも端的にコード（プルリクエスト）だけで済ませたいという人もいると思います。筆者もそのように考えていましたし、今でもいきなりプルリクエストを送るという場面は度々あります。


## プルリクエストから始めると、泥沼にはまりやすい








## プルリクエストから始めていい場面は確かにある

「このような場合は報告を経ずにいきなりプルリクエストを送った方が良い」と言えるパターンを紹介します。これは端的にいえば、*誰の目にも明らかなミスの訂正や、是非の議論の余地が無い変更*という事になります。例えば、ソースコード上のミスタイプ（綴りの間違い）の修正や、言語リソースの翻訳ミスの修正、未翻訳部分の訳文の追加などがこれにあたります。

また、対面での相談やチャットなど別の場所で既に議論が尽くされていて、後はコードを変更するだけであるという場合に、傍目からは「急にプルリクエストが行われて、何故かすぐにマージされた」という見え方になる場合もあります。これは表面的には「プルリクエストがいきなり行われた例」のように見えても、実際には次に述べる「報告から始まった例」に類するケースなので、注意が必要です。

いずれにしても、「議論の余地なくマージできる変更」というのは実はそれほど多くありません。上記の例に該当するように見えても、「誤記のように見えて実は意図的にそう書いてあった」「一般的な文脈では誤訳に見えるが、他のアプリケーションに合わせるとその訳の方が適切である」のような場合は度々あります。いきなりプルリクエストを送った方が良いと言える場面は、非常に限定的と考えた方が無難でしょう。