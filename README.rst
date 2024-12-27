Arrow: 日付と時刻をより簡単に取得する
======================================
動作確認

初めにarrowをimportする
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

Documentation
-------------

For full documentation, please visit `arrow.readthedocs.io <https://arrow.readthedocs.io>`_.

Contributing
------------

Contributions are welcome for both code and localizations (adding and updating locales). Begin by gaining familiarity with the Arrow library and its features. Then, jump into contributing:

#. Find an issue or feature to tackle on the `issue tracker <https://github.com/arrow-py/arrow/issues>`_. Issues marked with the `"good first issue" label <https://github.com/arrow-py/arrow/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_ may be a great place to start!
#. Fork `this repository <https://github.com/arrow-py/arrow>`_ on GitHub and begin making changes in a branch.
#. Add a few tests to ensure that the bug was fixed or the feature works as expected.
#. Run the entire test suite and linting checks by running one of the following commands: ``tox && tox -e lint,docs`` (if you have `tox <https://tox.readthedocs.io>`_ installed) **OR** ``make build39 && make test && make lint`` (if you do not have Python 3.9 installed, replace ``build39`` with the latest Python version on your system).
#. Submit a pull request and await feedback 😃.

If you have any questions along the way, feel free to ask them `here <https://github.com/arrow-py/arrow/discussions>`_.

Support Arrow
-------------

`Open Collective <https://opencollective.com/>`_ is an online funding platform that provides tools to raise money and share your finances with full transparency. It is the platform of choice for individuals and companies to make one-time or recurring donations directly to the project. If you are interested in making a financial contribution, please visit the `Arrow collective <https://opencollective.com/arrow>`_.
