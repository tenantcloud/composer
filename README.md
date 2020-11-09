# Composer

Composer is a tool for dependency management in PHP. Based on `composer:2` 
(https://hub.docker.com/_/composer). 
Added additional library for Laravel projects.

## Use

```bash
docker run --rm -it -v  $PWD:/app tenantcloud/composer \
    composer install --no-interaction --prefer-dist --optimize-autoloader
```

