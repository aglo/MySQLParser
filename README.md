MySQLParser
===========
***
A Parser for MySQL's SQL.

+ Use JSqlParser for further dev.
 + [My fork of JSqlParser (support mysql, sid)](https://github.com/ent-worm/JSqlParser)
 + [Origin wumpz/JSqlParser](https://github.com/wumpz/JSqlParser)
 + [Origin ultimoamore in Sourceforge.net](http://jsqlparser.sourceforge.net/)

***

### News

+ Add # comment
+ Partly supported(Need more test!)
 + select
 + insert
 + update
 + delete

### Known Issues
+ [TableNames Finder not supported by JSqlParser(#issue6)](https://github.com/aglo/MySQLParser/issues/6)
 + SET
 + SHOW
 + COMMIT
 + Delete table1, table2 ...
 + Keywords
   + EXTRACT
   + ON DUPLICATE

***

### What
Take Select as example

```sql
SELECT * FROM TableName; # comment by ent-worm
```

+ Type: select
+ Tables name used： TableName


### How

+ JAVACC, parse statements from top to bottom.
+ tr & sed for clean origin query file

***

### Method

```shell
./clean.sh input [output]
```

```java
String sql_statement = "select * from table1";

SimpleQuery q = new SimpleQuery(sql_statement);

String type = q.getType();
List<String> tables = q.getTables();
```
