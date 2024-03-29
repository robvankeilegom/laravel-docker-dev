# Laravel Docker Development Environment

A docker stack with `dnsmasq`, `php-7.4`, `php-8ss.0`, `php-8.1`, `mysql`, `redis` and `mailhog`. This will mount the parent folder of this project and make it available for all PHP versions. You can easily add more PHP versions in `docker-compose.yml`.

If you have the following project structure:
```bash
.
└── projects
    ├── laravel-docker-dev
    ├── project1
    └── project2
```

Then the following domains will be available: `project1.php74.loc`, `project1.php80.loc`, `project2.php74.loc`, `project2.php80.loc`, etc...

## Install

### Configure local dns to use the dnsmasq container to resolve `.loc` domains.
Edit `/etc/systemd/resolved.conf` and append:
```
DNS=127.0.0.2
Domains=loc
```

### Start the containers
```
docker-compose up -d --build
```


