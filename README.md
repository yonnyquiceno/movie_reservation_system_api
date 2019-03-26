# Movie reservation system API

* bundle installation

```
$ gem install bundler
$ bundle install
```

* Database creation
```
$ rails db:create
```

* Database initialization
```
$ rails db:migrate db:seed
```

* Start server (3001 is the default port)
```
$ rails s
```

# available GET endpoints
* movies: returns movies available at provided date
```
/v1/movies?date=YYYY/MM/DD
```
example
```
http://localhost:3001/v1/movies?date=2019/04/26
```

---

* reservations: returns movies available at provided date
```
/v1/reservations?date_range=YYYY/MM/DD%20-%20YYYY/MM/DD
```
example
```
http://localhost:3001/v1/reservations?date_range=2019/03/23%20-%202019/03/27
```
---