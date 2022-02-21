# dockrdumpr
Docker filesystem extractor via BLOB files through Unauthenticated Docker Registry.

```
root@lab:~# bash dockrdumpr.sh http://privdocker.reg:5000
 -------------------
 | UNAUTHENTICATED |
 | DOCKER REGISTRY |
 |   BLOB DUMPER   |
 -------------------

 OK: DOCKER_REG_URL: http://privdocker.reg:5000

 * Dump started: prod-app
 --- BLOB: sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
 --- BLOB: sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
 --- BLOB: sha256:7930823325656499d9b027860e1befe1489f55455e0449ddc2422ad71682d126
 --- BLOB: sha256:1cf99c508e1d751ef6a64f44f6a365cbcd25727d3e51638d5cf51f80d8231a32
 --- BLOB: sha256:ad7d06de431290c64a44d34c5f35d2c580debf205a6fc017a07aa6ea8bba7788
 --- BLOB: sha256:0d4c7a46cc5e5c1ffd6b03cf599e8b5ee3794dbdc05e4a97c51338a3c2d5a48f
 ```
 
```
root@lab:~# cd prod-app/
root@lab:~/prod-app# ls -ltrah
total 2.1M
drwxr-xr-x  2 root root 4.0K Jul 11  2020 sys
drwxr-xr-x  2 root root 4.0K Jul 11  2020 proc
drwxr-xr-x  3 root root 4.0K Jul 11  2020 home
drwxr-xr-x  2 root root 4.0K Jul 11  2020 boot
drwxr-xr-x 11 root root 4.0K Apr  8 07:00 var
drwxr-xr-x 10 root root 4.0K Apr  8 07:00 usr
drwxr-xr-x  3 root root 4.0K Apr  8 07:00 tmp
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 srv
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 sbin
drwxr-xr-x  3 root root 4.0K Apr  8 07:00 run
drwxr-xr-x  3 root root 4.0K Apr  8 07:00 opt
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 mnt
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 media
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 lib64
drwxr-xr-x  8 root root 4.0K Apr  8 07:00 lib
drwxr-xr-x 50 root root 4.0K Apr  8 07:00 etc
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 dev
drwxr-xr-x  2 root root 4.0K Apr  8 07:00 bin
drwx------  5 root root 4.0K Jun  9 12:11 root
drwxr-xr-x 10 root root 4.0K Jun 22 16:35 ..
drwxr-xr-x 21 root root 4.0K Jun 22 19:00 .
```

# Requirements
- jq
- curl
