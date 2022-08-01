# Роль устанавливает GitLab Runner  

Роль устанавливает дистрибутив Gitlab Runner указанной версии и регистрирует его на указанном сервере с указанными параметрами.  

## Переменные  

Основные переменные описаны ниже, полный список переменных представлен в директории [defaults/main.yml](defaults/main.yml):  

Ссылка по котороый runner будет зарегистрирован на серевере GitLab  

`gitlab_runner_coordinator_url: 'http://gitlab.itili4.ru'`  

Токен авторизации необходим для добавления runner на сервер.  

`gitlab_runner_registration_token: '6iLv81783GMRBHNw3f5-'`  

Параметеры необходимые для работы runner.  

```yml
gitlab_runner_runners:  
    # Идентификатор Runner
  - name: '{{ ansible_hostname }}'
    # Состояние runner present - должен быть в наличии, установлен.
    state: present
    # Тип executor для данного runner
    executor: 'shell'
    # Список тегов закрепленных за runner, необходимо для запуска на нем pipeline.
    tags: []
    # Если true, то runner может запускать задания без тегов
    run_untagged: true
    # Указываем может ли runner использовать protected переменные
    protected: false
    # Опция важна при создании Runner если false, то можно использоваться на несколько проектов.
    locked: 'false'
    # Можно передать перменные среды при необходимости.
    env_vars: []
```