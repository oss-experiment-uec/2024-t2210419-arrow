FROM ubuntu:24.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y

# カレントディレクトリ
WORKDIR /artifact

# 必要なAPTパッケージを適当にインストール
RUN apt install -y python3
RUN apt install -y git

# Gitリポジトリを展開しても良い
# RUN git clone 

# Dockerfileを実行する場所からファイルをコピーする場合
# COPY . /artifact
