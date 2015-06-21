#!/usr/bin/env bash
PORT='2272'
IP='212.26.132.49'

rackup  -o $IP -p $PORT config.ru
