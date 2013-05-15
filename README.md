MySQLParser
===========

A Parser for MySQL's SQL.

### WHAT
以Select语句为例

    SELECT * FROM TableName;

调用which\_type()可以知道是哪一类的SQL语句

调用which\_table()可以知道是哪从什么表中获取

其他的类似

### HOW
实际上是一个语法分析的程序，用lex类似程序可以进行词法分析，yacc类似程序来进行语法匹配。

目前有一些程序已经可以对SQL语句进行语法分析，调研工作在pre-work目录之中。
