# Установка Grafana

Устанавливаем сервис по обработке метрик и красивому выводу их на экран для пользователя. 
Подключаем источники данных через перменные. Дашборды тоже можно подключить через переменные(для работы нужен европейский хостинг) иначе загружаем дашборды из папки dashboards в формате .json. 

## Role Variables

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml).

| `grafana_version` | latest | Версия Grafana для развертывания |
| `grafana_instance` | {{ ansible_fqdn \| default(ansible_host) \| default(inventory_hostname) }} | Название сервиса |
| `grafana_logs_dir` | /var/log/grafana | Путь до директории с логами |
| `grafana_data_dir` | /var/lib/grafana | Путь до директории с базой данных |
| `grafana_address` | 0.0.0.0 | Адрес на котором будет установлен сервис |
| `grafana_port` | 3000 | Порт который будет слушать сервис |
| `grafana_url` | "http://{{ grafana_address }}:{{ grafana_port }}" | Полная ссылка для доступа в сервис |
| `grafana_security` | { admin_user: admin, admin_password: "" } | Указаваем учетные данные для входа |
| `grafana_database` | { type: sqlite3 } | Настройка параметров используемой БД для сервиса |
| `grafana_dashboards` | [] | Список дашбордов для загрузки с оффициального репозитория |
| `grafana_dashboards_dir` | "dashboards" | Путь до локальной папки с файлами дашбордов для загрузки на сервис |
| `grafana_datasources` | [] | Источники получения данных для сервиса |
| `grafana_alert_notifications` | [] | Список истчников оповещений для сервиса |
