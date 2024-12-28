# Artifact Description

## 概要：日時指定方法の追加(人がより指定しやすく)


以下，記述事項の説明．

* 改変対象のOSSは[arrow](arrow-py/arrow)。
  + このOSSは日付、時刻、タイムスタンプを作成、操作、フォーマット変換をよりスマートに行うためのアプローチを行うpythonライブラリである。
  + 標準のdatetimeモジュールでは煩雑になりがちな操作を、短いコードで実現可能とする。
  + タイムゾーンの変換や、特定のタイムゾーンでの時刻操作が容易にできる。
  + 相対的な時刻、例えば3日前や2時間後のような自然言語的な操作を可能としている。
* 今回の改変内容は自然言語的な操作の範囲をより拡張するものである。
  + 具体的には「先週の火曜日」「去年」といった、より人が普段使う表現で操作ができるように拡張する。
  + 関連するissueはこちら[support dates like "next tuesday" #1100](https://github.com/arrow-py/arrow/issues/1100) 

## クイックスタート

以下，記述事項の説明．

* Dockerイメージをpullしてrunする手順を具体的に示す．

```
docker pull narutakatsukada/2024-t2210419-arrow
docker run -it --rm --name console narutakatsukada/2024-t2210419-arrow
```
* まず初めにpython3へ移動する
```
root@08f6bd03b1f0:/artifact/2024-t2210419-arrow# python3
Python 3.11.11 (main, Dec  4 2024, 08:55:08) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
* 上のようなメッセージが出れば成功
* 続いて、arrowをimportする
```
>>> import arrow
>>>
```
* ここから簡単な動作確認(簡単な動作確認ですので最初の動作が問題なく完了すれば途中で切り上げても大丈夫です)
* 動作確認内の日付について、実際の出力では実行時の日付をもとにした時刻が出力されますので必ずしも例通りの日付が出力されるわけではありません。

```
>>> arrow.get('2013-05-11T21:23:58.970460+07:00')
<Arrow [2013-05-11T21:23:58.970460+07:00]>
>>> utc = arrow.utcnow()
>>> utc
<Arrow [2013-05-11T21:23:58.970460+00:00]>
>>> utc = utc.shift(hours=-1)
>>> utc
<Arrow [2013-05-11T20:23:58.970460+00:00]>
>>> local = utc.to('US/Pacific')
>>> local
<Arrow [2013-05-11T13:23:58.970460-07:00]>
>>> local.humanize(locale='ko-kr')
'한시간 전'
```

## 評価手順

* 確認は一応コマンド1つでも可能。以下のコマンドを試すと良い
```
>>> arrow.now().dehumanize("next tuesday")
```
* このコマンドが正しく動くと以下のような出力が得られる。
```
<Arrow [2024-12-31T23:21:50.650621+09:00]>
```
* この出力はこのArtifactDescription.mdを記述している現在(2024/12/29)から見たときの次の火曜日である2024/12/31に日付が変わっていることが分かる。
* 他のコマンドを試したい場合は以下のような指定も対応している。
```
>>> arrow.now().dehumanize("previous year")
<Arrow [2023-12-29T00:41:38.196427+09:00]>
```
* こちらのコマンドでは1年前に日付が書き換わっていることが分かる。
* 対応していない指定だとどのようになるかについて、今回機能を拡張しなかった"last tuesday"を指定すると以下のような結果を返す。
```
>>> arrow.now().dehumanize("lust tuesday")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/artifact/2024-t2210419-arrow/arrow/arrow.py", line 1441, in dehumanize
    raise ValueError(
ValueError: Input string not valid. Note: Some locales do not support the week granularity in Arrow. If you are attempting to use the week granularity on an unsupported locale, this could be the cause of this error.
```
* 改変前の状態だと"next tuesday""previous year"も同様のエラーを返していた。
* 他に新しく追加したコマンドとしては"next 曜日"である。これらも各自で実践してみてほしい。

## 制限と展望

以下，記述事項の説明．

* 今回、当初の予定では新しい機能の拡張以外にもissueに記載されていたバグの修正も行うつもりであった。具体的な内容としては[Missing hour during DST long day when shifting or calculating ranges #1162](https://github.com/arrow-py/arrow/issues/1162)などに取り組んでみるつもりであった。しかし、DockerやGitの環境の整備に想像以上の時間を要したことから今回は行わなかった。
* 今回の改変の延長線上として、指定を英語でなく日本語でも行うことができるようにすることを考えたが時間が無く今回は見送った。恐らく、今回の改変と同じ要領で機能を拡張することができると考えているため、次に改変を行うとしたら、バグ修正より先にこちらに手を出したいと思う。
  
## 更なる使い方（オプション）

* 特になし、急に次の水曜日などがどうしても知りたくなった時にでも使ってほしいです。
