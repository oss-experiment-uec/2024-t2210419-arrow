Arrow: 日付と時刻をより簡単に取得する
======================================
動作確認

Dockerイメージの準備

    docker pull narutakatsukada/2024-t2210419-arrow
    docker run -it --rm --name console test-image2

初めにpython3の環境に移動
    
    python3

arrowをimportする
    
    >>> import arrow
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

    >>> local.timestamp()
    1368303838.970460

    >>> local.format()
    '2013-05-11 13:23:58 -07:00'

    >>> local.format('YYYY-MM-DD HH:mm:ss ZZ')
    '2013-05-11 13:23:58 -07:00'

    >>> local.humanize()
    'an hour ago'

    >>> local.humanize(locale='ko-kr')
    '한시간 전'

.. end-inclusion-marker-do-not-remove


改変内容

より人間が指定しやすい日付のサポートを行うように改変している(未完成)
具体的には、「来週の火曜日」や「前年」といった指定方法も対応するようにする。

