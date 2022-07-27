# MySQL Node and Cluster

Установка и настройка Mysql, настройка кластерной конфигурации.

## Role Variables

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml):

```yaml
mysql_user_home: /root
mysql_user_name: root
mysql_user_password: root
```
Домашная директория для хранения параметров подключения и переменные для выбора учетной записи для запуска MySQL.

```yaml
mysql_enabled_on_startup: true
```
Запускать ли службу MySQL при загрузке сервера.

```yaml
overwrite_global_mycnf: true
```
Указать true если необходимо каждый раз перезаписывать конфигурационный файл MySQL.

```yaml
mysql_databases: []
```

Заполняем если необходимо создать базы данных при запуске сервера.

```yaml
mysql_users: []
```

Заполняем если необходимо создать пользователя.

```yaml
mysql_port: "3306"
mysql_bind_address: '0.0.0.0'
mysql_datadir: /var/lib/mysql
mysql_socket: *default value depends on OS*
mysql_pid_file: *default value depends on OS*
```

Настройка параметров сервиса.

```yaml
mysql_server_id: "1"
mysql_max_binlog_size: "100M"
mysql_binlog_format: "ROW"
mysql_expire_logs_days: "10"
mysql_replication_role: ''
mysql_replication_master: ''
mysql_replication_user: {}
```

Параметры для настройки реплкации Master\Slave
