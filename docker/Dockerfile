# Python 3.10 Slimベースイメージを使用
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean

# requirements.txtをコピー
COPY requirements.txt /usr/src/app/

# Pythonパッケージをインストール
RUN pip install --no-cache-dir -r requirements.txt

# entrypoint.shをコピーして実行権限を付与
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# ホストと同期するためのVOLUMEを設定
VOLUME /usr/src/app/django_project

# ポートを開放
EXPOSE 8000

# entrypoint.shをエントリポイントとして指定
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# デフォルトコマンド
CMD ["python", "/usr/src/app/django_project/manage.py", "runserver", "0.0.0.0:8000"]
