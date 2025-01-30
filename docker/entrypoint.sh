#!/bin/bash

# 必要なディレクトリを作成
if [ ! -d "/usr/src/app/django_project" ]; then
    mkdir -p /usr/src/app/django_project
fi

# Djangoプロジェクトが存在しない場合に作成
if [ ! -f "/usr/src/app/django_project/manage.py" ]; then
    echo "Django project not found. Creating a new one..."
    django-admin startproject django_project /usr/src/app/django_project
fi

# サーバーを起動
exec "$@"
