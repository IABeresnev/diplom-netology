# Роль установки Gitlab CE сервера

При установке создается УЗ Admnistrator c логином root и паролем заданным через перенменную. Дополнительно добавлена возможности указания своего ключа регистрации runnerов для Gitlab CE сервера.

## Переменные

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml):

    gitlab_domain: gitlab
    gitlab_external_url: "https://{{ gitlab_domain }}/"

Домен и URL-ссылка по которому будет осуществляться доступ к серверу Gitlab CE

    gitlab_git_data_dir: "/var/opt/gitlab/git-data"

Указывае расположение хранилища репозиториев сервера Gitlab CE.

    gitlab_edition: "gitlab-ce"

Указываем варинт диструбутива который хотим установить `gitlab-ce` (Community Edition) или `gitlab-ee` (Enterprise Edition).

    gitlab_version: ''

Если хотим установить версию Gitlab сервера отличную от последний, необходимо заполнить это поле.

gitlab_initial_root_paswd: "VeryH@RDP@$SW0rD"

Указываем какой пароль будет у пользователя Administrator c логином root сразу после установки сервиса.

gitlab_token_for_runners: "6iLv81783GMRBHNw3f5-"

Указываем какой ключ доступа будет использоваться для регистрации runnerов на сервере.