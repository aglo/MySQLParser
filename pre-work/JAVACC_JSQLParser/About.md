# JSqlParser

## JAVACC

JAVACC的具体语法也很简单

+ TOKEN 类似正则表达式 如 <NUMBER : ["0" - "9"]+ >
+ 语法规则也很简单

```
start(){
    TOKEN t;      //这里的是局部变量
    int i;        //
    int value;    //
}{
    t = <NUMBER>  //规则的匹配
    {变量}{语句}  //在规则匹配之后就可以写具体怎么处理了

    ()+           //正则表达式的闭包除空（忘记叫什么了orz）
    ()*           //闭包
    ()?           //存在或者不存在
    ～            //非
}
```

## JSQLParser的规则

选取最简单的DELETE来分析这个Parser

```
todo
```

## 提供给外部的接口
Query(String sql)

+ setType();
+ getType();

+ setTable();
+ getTableList();









## 
