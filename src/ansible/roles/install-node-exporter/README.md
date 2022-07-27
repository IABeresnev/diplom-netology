# Установка Node exporter

## Requirements

Использование роли возможно только на RHEL-like дистрибутивах, работоспособност проверена на Centos 7

## Role Variables

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml):

    node_exporter_version: '0.18.1'

Версия node_exporter используемая при развертывания.

    node_exporter_bin_path: /usr/local/bin/node_exporter

Путь для размещения исполняемого файла `node_exporter`.

    node_exporter_options: ''

Если необходимо передать дополнителные параметры при запуске.

    node_exporter_state: started
    node_exporter_enabled: true

Управление сервисом установленного node_exporter.

