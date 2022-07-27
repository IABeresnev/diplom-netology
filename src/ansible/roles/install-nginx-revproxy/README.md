# Reverse-proxy Nginx и LetsEncrypt.

Установка, настройка обратного прокси, получение сертификатов для доменов, настройка автоматического продления через cron.

## Requirements

Использование роли возможно только на RHEL-like дистрибутивах, работоспособност проверена на Centos 7

## Role Variables

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml):

nginx_revproxy_sites:                                         # Список доменов для reverse прокси
  example.com:                                                # Доменное имя
    client_max_body_size: "256M"
    proxy_read_timeout: "360"
    domains:                                                  # Alias для доменного имени
      - example.com
      - www.example.com
      - app.example.com
    upstreams:                                                # Куда перенаправлять запрос Upstreams
      - {backend_address: 192.168.0.100, backend_port: 80}
      - {backend_address: app.example.com, backend_port: 9090}
    ssl: true                                                 # Если надо перенаправлять http на https указываем true
    hsts_max_age: 63072000                                    # HSTS header устанавливаем максимальную длительность
    letsencrypt: false                                        # true если используем letsencrypt
    letsencrypt_email: ""                                     # email для letsencrypt

nginx_revproxy_certbot_auto: false

