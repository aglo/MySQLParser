MySQLParser
===========

A Parser for MySQL's SQL.

### WHAT
以Select语句为例

```
SELECT * FROM TableName;  
```

>>+ 一次分析方法后，获得该语句全部信息，保存在一个对象中
>>+ 调用对象的方法get\_type()可以知道是哪一类的SQL语句
>>+ 调用对象的方法get\_table()可以知道是哪从什么表中获取
>>+ 其他的类似，待添加
>
>按照JSqlParser的visitor模式，具体代码仍在阅读

增加如何使用JSqlParser的部分

### HOW
+ 实际上是一个语法分析的程序，用lex类似程序可以进行词法分析，yacc类似程序来进行语法匹配。  
目前有一些程序已经可以对SQL语句进行语法分析，调研工作在pre-work目录之中。  
+ JSqlParser使用JAVACC，JAVACC的语法已经基本了解
+ 先使用现有JSQLParser的代码，完成最基本的查询语句类别、表的解析，之后再完善规则。

### INPUT & OUTPUT
todo

### EXAMPLE
todo
