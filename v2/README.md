## Repository

```
├ frontend -> Nuxt
│ 
└ backend -> Rails
```

## 環境

```
// 初回
$ docker-compose build # build, up, run

// 2回目以降
$ docker-compose up 
  or
$ docker-compose up -d

// DB作成
$ docker-compose exec backend rails db:create
$ docker-compose exec backend rails db:migrate
$ docker-compose exec backend rails db:seed

// 停止
$ docker-compose down --volumes
```