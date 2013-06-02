#nawk script to extract connectivity from tree gp 
#
#WBL 21 July 2004 created $Revision: 1.2 $"
#http://www.cs.ucl.ac.uk/staff/W.Langdon/lisp2dot.html
#
#Inputs: file containing program as text

#Example gawk -f lisp2dot.awk example.txt > example.dot

#dot file documentation http://www.graphviz.org/cgi-bin/man?dot
#dot interpreter http://java.ist.unomaha.edu/~payne/dot/

BEGIN { 
#Arity is given by function name via these four strings NOT brackets
#all non-terminals from GProc1.8 sym.cc r1.124
#You may need to edit this file or override by command line.

  if(arity1=="") arity1 =",NOT,SMNOT,XC,YC,ANN,Int,Frac,INT,FRAC";
  if(arity2=="") arity2 =",ADD,SUB,MUL,DIV,AND,OR,NAND,NOR,XOR,EQ,APPROX,DIF,GT,GTEQ,LT,LTEQ,SMAND,SMOR,SMEQ,SMDIF,SMGE,SMLE,Max,Min,MaxA,MinA";
  if(arity3=="") arity3 ="";
  if(arity4=="") arity4 =",IFLTE,";
##else arity0, ie terminal
}

(FNR==1) {
  printf("//Created by lisp2dot.awk %s",substr("$Revision: 1.2 $",2));
  printf(" from file %s\n",FILENAME);
}

($1=="poly0" && (n1=index($0,"="))>1) { #GProc start of program
  code = substr($0,n1+1);
}

(index($0,"#")==0 && ($1!="poly0") ) {
  code = sprintf("%s %s",code,$0);
}


END{
# print code;
  print "digraph simpleDotFile {";
  l=split(code,inst,"[ \t()]"); #remove brackets and layout
  pc=0;
  parent=-1;
  args=1; #sanity check only
  for(i=1;i<=l;i++) {
    if(length(inst[i])>0) {
      node_name[pc]=inst[i];
      node_nxt[pc]=0;
      node_arity[pc]=arity(node_name[pc]);
      args += node_arity[pc]-1;
#      printf("//i=%3d pc=%3d %2d %d %5s %3d\n",            \
#	     i,                                          \
#	     pc,                                         \
#	     index(arity2,sprintf(",%s,",node_name[pc])),\
#	     node_arity[pc],                             \
#	     sprintf(",%s,",node_name[pc]),              \
#	     parent);

      if(args<0) print "ERROR badly formed tree. Check arity1-4? args",args," i=",i," pc=",pc,inst[i];
      node_back[pc]=parent;
      node_nxt[parent]++;
      node_child[parent,node_nxt[parent]]=pc;
      if(node_arity[pc]>0) parent=pc;
      else {
	for(j=parent; node_nxt[j]>=node_arity[j] && j>=0; ){
	  j=node_back[j];
	  parent=j;
#	  printf("//j=%3d parent=%3d\n",j,parent);
	}
      }
      pc++;
    }
  }
  if(args!=0) print "ERROR2 badly formed tree. Check arity1-4? args",args," i=",i," pc=",pc,inst[i];
  print_label(0);
  for(p=0;p<pc;p++) {
      for(i=1;i<=node_arity[p];i++) {
	  q=node_child[p,i];
	  print_label(q);
	  printf("%s -> %s;\n",id(p),id(q));
      }
  }
  print "}";
}

function print_label(pc) {
    printf("%s [label=%s];\n",id(pc),node_name[pc]);
}
function id(pc) {
    return sprintf("n%03d",pc);	     
}

function arity(name) {
    t_ = sprintf(",%s,",name);
#   printf("//t_'%s'\n",t_);
    if(index(arity1,t_)>0) return 1;
    if(index(arity2,t_)>0) return 2;
    if(index(arity3,t_)>0) return 3;
    if(index(arity4,t_)>0) return 4;
    return 0;
}
