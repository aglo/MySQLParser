MySQLParser
===========

A Parser for MySQL's SQL.

### WHAT
以Select语句为例

```
SELECT * FROM TableName;  
```

>>>+ 一次分析方法后，获得该语句全部信息，保存在一个对象中
>>>+ 调用对象的方法get\_type()可以知道是哪一类的SQL语句
>>>+ 调用对象的方法get\_table()可以知道是哪从什么表中获取
>>>+ 其他的类似，待添加
>>
>>按照JSqlParser的visitor模式，具体代码仍在阅读
>
>增加如何使用JSqlParser的部分

使用Query(sql)，Query提供访问_type和_tables的接口。


### HOW
>+ 实际上是一个语法分析的程序，用lex类似程序可以进行词法分析，yacc类似程序来进行语法匹配。  
>目前有一些程序已经可以对SQL语句进行语法分析，调研工作在pre-work目录之中。  
>+ JSqlParser使用JAVACC，JAVACC的语法已经基本了解
>+ 先使用现有JSQLParser的代码，完成最基本的查询语句类别、表的解析，之后再完善规则。

+ 使用JSqlParser的现有程序，修改少量javacc.jj文件

### INPUT & OUTPUT
调用方法

```
Query q = new Query(sql_statement);
String type = q.getType();
List<String> tables = q.getTables();
```

### TODO

+ 增加取出#后面注释部分
+ 目前仅支持select的子查询，需要增加支持其他类型语句的子查询

### EXAMPLE
todo
