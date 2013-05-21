# Exist tools


<table>
    <tr>
        <td>名称</td>
        <td>项目地址</td>
        <td>优点</td>
        <td>缺点</td>
    </tr>
    <tr>
        <td>JSqlParser</td>
        <td>https://github.com/wumpz/JSqlParser</td>
        <td>长期活跃状态，已经支持较复杂SQL语句</td>
        <td>工程较大，改动工作量需评估，支持标准SQL语句，针对MYSQL需要修改</td>
    </tr>
    <tr>
        <td>ZQL</td>
        <td>http://zql.sourceforge.net/</td>
        <td>工程较小</td>
        <td>作者指出2002年完成大部分代码，时效性差</td>
    </tr>
    <tr>
        <td>JAVACC</td>
        <td>https://javacc.java.net/</td>
        <td>语法分析程序</td>
        <td>需要从0写Parser，重复工作</td>
    </tr>
    <tr>
        <td>ANTLR</td>
        <td>http://www.antlr.org/</td>
        <td>规则明晰，符合官方文档标准</td>
        <td>v3.0已有mysql规则，需评估v4.0是否仍支持，同时需要自己手写规则匹配后的函数</td>
    </tr>
</table>



### ZQL
ZQL是一个用JAVA写的SQL语法分析工具，他本身是使用JAVACC来写自动生成语法分析程序的。

### JSqlParser
+ JSqlParser也是一个用JAVACC写的语法分析工具。
+ 与ANTLR的mysql语法规则相比较，该工具语法支持的是标准的SQL语句。
+ 不支持mysql中各种函数，系统变量等

### JAVACC
+ 相当于yacc的基于JAVA语言的语法分析程序。
+ 使用的自顶向下的分析方法。

### ANTLR
+ ANTLR是一个对语言进行分析、转换为AST的程序，已经有针对MYSQL的语法规则，需评估是否满足要求。由于ANTLR和MYSQL的版本都有变动，需评估修改工作量。
+ 根据mysql官方文档和ANTLR的mysql语法规则对比，该工具对mysql语法规则支持已经相当完善
+ 需要指出的是，ANTLR仅仅是一个对语言进行分析的程序，如果需要写我们的parser，还需要加入大量的代码。

### YACC
+ C语言的语法分析程序
+ 使用的是自下向上的分析方法。

### GSP(General SQL Parser JAVA Version)
+ 商业软件
+ 待评估


