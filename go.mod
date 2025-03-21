module github.com/sec51/honeymail

go 1.23.2

replace github.com/Sirupsen/logrus => github.com/sirupsen/logrus v1.9.3

require (
	github.com/Sirupsen/logrus v0.0.0-00010101000000-000000000000
	github.com/boltdb/bolt v1.3.1
	github.com/julienschmidt/httprouter v1.3.0
	github.com/mvdan/xurls v1.1.0
	github.com/oschwald/geoip2-golang v1.11.0
	github.com/sec51/goconf v0.0.0-20180415123049-f3f7b14f2c1e
	github.com/sec51/honeyssh v0.0.0-20160809103751-fd54fe19c956
)

require (
	github.com/astaxie/beego v1.12.3 // indirect
	github.com/oschwald/maxminddb-golang v1.13.0 // indirect
	golang.org/x/sys v0.20.0 // indirect
)
