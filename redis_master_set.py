import redis

r = redis.StrictRedis(host='192.168.79.3', port=6379, db=0)
print ("set key1 123")
print (r.set('key1', '123'))
print ("get key1")
print(r.get('key1'))
