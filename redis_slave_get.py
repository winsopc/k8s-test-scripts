#!/usr/bin/python3
import redis
import sys
r = redis.StrictRedis(host=str(sys.argv[1]), port=6379, db=0)
if r.get('key1') == '123':
  print("good")
else:
  print("bad")
