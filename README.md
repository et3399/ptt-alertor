# Ptt-Alertor

<img align="right" src="https://raw.githubusercontent.com/watain666/ptt-alertor/master/logo.jpg">

[![Build Status](https://github.com/watain666/ptt-alertor/actions/workflows/main.yml/badge.svg)](https://github.com/watain666/ptt-alertor/actions/workflows/main.yml)
[![codecov](https://codecov.io/gh/watain666/ptt-alertor/branch/master/graph/badge.svg)](https://codecov.io/gh/watain666/ptt-alertor)
[![Go Report Card](https://goreportcard.com/badge/github.com/watain666/ptt-alertor)](https://goreportcard.com/report/github.com/watain666/ptt-alertor)
[![Code Climate](https://api.codeclimate.com/v1/badges/f7047295fce56a0465dc/maintainability)](https://codeclimate.com/github/watain666/ptt-alertor/maintainability)
[![StackShare](https://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](https://stackshare.io/watain666/ptt-alertor)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Docker Deployment

1. (Optional) copy env template if you want to customize settings:

```bash
cp .env.example .env
```

2. Update `.env` if you need real channel tokens / secrets.

3. Start all services (app + redis + dynamodb-local):

```bash
docker compose up --build -d
```

4. Open app:

- http://localhost:9090
- docs page: http://localhost:9090/docs

5. Stop services:

```bash
docker compose down
```

## API

### Board

- GET /boards

- GET /boards/[board name]/articles

- GET /boards/[board name]/articles/[article code]

### Keyword

- GET /keyword/boards

### Author

- GET /author/boards

### PushSum

- GET /pushsum/boards

### Articles

- GET /articles

### User (Auth)

- GET /users

- GET /users/[account]

- POST /users

```json
{
  "profile": {
    "account": "sample",
    "email": "sample@mail.com"
  },
  "subscribes": [
    {
      "board": "gossiping",
      "keywords": ["問卦", "爆卦", "公告"]
    },
    {
      "board": "lol",
      "keywords": ["閒聊"]
    }
  ]
}
```

- PUT /users/[account]

```json
{
  "profile": {
    "account": "sample",
    "email": "sample@mail.com"
  },
  "subscribes": []
}
```

## Credits

### Real Life

Rose Li, Aries Huang, Scott Kao, Amy Li

### Ptt

DMM, oas, bestpika, Zero0910, lucky0509, wbreeze, chang0206, lindo0130, hungys, gyman7788, tooilxui, myamyakoko, whkuo, papago89, timeline, Kamikiri

### Facebook

Mr.clu, Woqeker
