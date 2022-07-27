# Install wordpress

Установка и настрйока сервера приложений. Apache в качестве web-сервера, php74.

## Role Variables

`WP_HOME: "'https://wordpress.itili4.ru'"`    WP_HOME для wp-config.php
WP_SITEURL: "'https://wordpress.itili4.ru'"   WP_HOME для wp-config.php
WP_DB_USER: "wordpress"                       WP_HOME для wp-config.php 
WP_DB_PASS: "wordpress"                       WP_HOME для wp-config.php
WP_DB_HOST: "db01.itili4.ru"                  WP_HOME для wp-config.php
WP_DB_NAME: "wordpress"                       WP_HOME для wp-config.php      
WP_PROXY_HOST: "192.168.101.11"               WP_HOME для wp-config.php
WP_PROXY_PORT: "8118"                         WP_HOME для wp-config.php

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
