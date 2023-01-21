
goto a1
————————————————————————————————————————————————————————————————————————————————
在一些批处理文件中看到@echo off这个命令，那它究竟有什么作用？
要想知道这个命令，我们首先得知道
echo这个命令的作用，这个命令叫做“回显”，
就是把这条命令后的内容显示到控制台上，接下来我们来看一下@echo off命令的作用。
@echo off表示执行了这条命令后, 关闭所有命令(包括本身这条命令)的回显。
而echo off命令则表示关闭其他所有命令(不包括本身这条命令)的回显，
@的作用就是关闭紧跟其后的一条命令的回显，
pause也是一条命令，作用就是使程序暂停，也就是输出“请按任意键继续…”的原因。
@echo off执行以后，后面所有的命令均不显示，包括本条命令。
echo off执行以后，后面所有的命令均不显示，但本条命令是显示的。
————————————————————————————————————————————————————————————————————————————————
————————————————————————————————————————————————————————————————————————————————
bat set命令详

set var=我是值 
BAT直接在批处理中设置变量的方法!
set是命令, var是变量名, =号右边的"我是值"是变量的值  
在批处理中我们要引用这个变就把var变量名用两个%(百分号)扩起来,如%var%  
————————————————————————————————————————————————————————————————————————————————
bat 批处理中set /p 中/p 参数有什么作用

set /p A=B
A是变量名, 
B会显示在屏幕上, 整个bat会暂停并等待用户输入数据,
你用键盘输入的东西同时会出现在B后面, 
输入完成按enter后，
你输入的数据就是变量值了，

在以后的操作中，如果要用到你刚才输入的数据，就用%A%代替就行了。
所以B最好是一些提示性的字符，比如“请选择”，“请输入”之类的，当然也可以为空，
为空当然屏幕上也不会显示提示语，只有一个光标在闪。

/P
命令行开关允许将变量数值设成用户输入的一行输入。
读取输入行之前，显示指定的promptString。
promptString可以是空的。
你可以用set /? 来看更详细的信息。
————————————————————————————————————————————————————————————————————————————————
批处理bat脚本if else条件语句
https://blog.csdn.net/wisoper/article/details/124780021

if (condition) (do_something) ELSE (do_something_else)
上述语句首先在“if”语句中评估一个条件。 
   如果条件为真，则执行后面的语句，并在else条件之前停止并退出循环。 
如果条件为false，则执行else语句块中的语句，然后退出循环。
———————————————————————————————————————————————————————————————————————————————————————
bat脚本里面if else if的写法
https://www.cnblogs.com/xiongzaiqiren/p/11364452.html
曾经困扰了很久的bat脚本，如果里面包含多种条件判断，就必须要试用if，else if，else的写法了。
———————————————————————————————————————————————————————————————————————————————————————
第一种写法：最简单，就是写一行。
@echo off
rem 写一行比较简洁，缺点是每一种判断内不方便写多条语句
set varA=B
if "%varA%"=="A" (echo %varA% is A) else if "%varA%"=="B" (echo %varA% is B) else (echo %varA% is C)

pause
———————————————————————————————————————————————————————————————————————————————————————
第二种写法：可读性好的语法是分行写
@echo off
rem 在这种写法可读性好，也能执行多语句，但兼容性不太好
set varA=B
if "%varA%"=="A" (
    echo %varA% is A
    echo AAA
) else if "%varA%"=="B" (
    echo %varA% is B
    echo BBB
) else (
    echo %varA% is C
    echo CCC
)

pause
———————————————————————————————————————————————————————————————————————————————————————
第三种写法：可读性好的语法是分行写的加强版
@echo off
rem 可读性好，兼容性好

setlocal EnableDelayedExpansion
set option=2
set sum=-1

if %option% == 3 ( 
  echo three 
  set /a sum=%option%*%option%*%option%
) ^
else if %option% == 2 ( 
  echo two 
  set /a sum=2*%option%
) ^
else if %option% == 1 ( 
  echo one 
  set /a sum=%option% 
) ^
else ( 
  echo zero 
  set /a sum=0 
)

echo sum = !sum!

pause
—————————————————————————————————————————————————————————————————————————————————
分行书写总结规则：
    if 语句与左括号 ( 同行
    右括号 ) 不与 else if 同行
    右括号 ) 后面加上续行操作符 ^
————————————————————————————————————————————————————————————————————————————————
:a1

echo "^ start powershell script ^"
rem @echo off
echo off

set base_dir=%~dp0
%base_dir:~0,2%

pushd %base_dir%

set pssExeFlag=no

set /p pssExeFlag=Let us start to execute the script job, is it ok?[yes/no](default - no):
::if %pssExeFlag%==yes (echo run pss & powershell ./pss/WpgFitter.ps1) else (Donot run pss!!!)
::if %pssExeFlag%==yes (echo run pss & powershell .//pss//WpgFitter.ps1) else (echo Donot run pss!!!)
::if %pssExeFlag%==yes (echo run pss & powershell .\pss\WpgFitter.ps1) else (echo Donot run pss!!!)
::if %pssExeFlag%==yes (echo run pss & powershell D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\pss\WpgFitter.ps1) else (echo Donot run pss!!!)
::if %pssExeFlag%==yes (echo run pss & powershell -ExecutionPolicy Unrestricted .\pss\WpgFitter.ps1) else (echo Donot run pss!!!)

::if %pssExeFlag%==yes (echo run pss & powershell .\pss\WpgFitter.ps1) else (echo Donot run pss!!!)
if %pssExeFlag%==yes (echo run pss & powershell C:\Users\user\zyh\Scripts_APLxy\Windows\powershell\WpgFitter\pss\WpgFitter.ps1) else (echo Donot run pss!!!)

goto xx
::https://jingyan.baidu.com/article/6fb756ec52ddd1241858fb05.html
::bat中代码注释的几种方法
rem bat 注释

::bat脚本中pause作用
rem pause命令可以让脚本程序暂停， 会打印输出 “请按任意键继续...”字样。
:xx

popd
pause


