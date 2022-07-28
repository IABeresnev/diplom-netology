# Prometheus

Роль устаналивает Prometheus, настраивает точки сбора метрик, базовые алерты.

## Role Variables

Полный список переменных представлен в файле [defaults/main.yml](defaults/main.yml).

Основныне необходимые перменные описаны ниже.

| prometheus_version            | latest или 2.37.0                                                                                                                                                                                                                                                                            | Версия сервиса для развертывания                   |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------|
| prometheus_web_external_url   | http://prometheus.itili4.ru:9090                                                                                                                                                                                                                                                             | Ссылка для входа в сервис                          |
| prometheus_targets            | node:     - targets:         - 192.168.101.11:9100       labels:         env: Proxy                                                                                                                                                                                                          | Точки сбора данных                                 |
| prometheus_web_listen_address | 0.0.0.0:9090                                                                                                                                                                                                                                                                                 | Используемый адрес и порт для запуска сервиса      |
| prometheus_alert_rules        | - alert: RebootRequired     expr: 'node_reboot_required > 0'     labels:       severity:warning     annotations:       description: '{% raw %}{{ $labels.instance }} requires a reboot.{% endraw %}'       summary: '{% raw %}Instance {{ $labels.instance }} - reboot required{% endraw %}' | Описываем правила для создания алертов(оповещений) |

