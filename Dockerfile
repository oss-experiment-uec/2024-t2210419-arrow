FROM ubuntu:24.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y

# カレントディレクトリ
WORKDIR /artifact

# 必要なAPTパッケージを適当にインストール
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.11 python3.11-venv python3.11-dev
RUN apt install -y less
RUN apt install -y git
RUN apt install -y make
RUN apt install -y python3-arrow
RUN apt install -y python3-tzlocal

# Gitリポジトリを展開しても良い
# RUN git clone 

# Dockerfileを実行する場所からファイルをコピーする場合
# COPY . /artifact
