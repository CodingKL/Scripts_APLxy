@echo off

goto xx1
Windows批处理更改当前工作路径
1、直接双击运行bat文件，一切正常。
2、右击bat文件，选择以“管理员身份运行”，这时现象出来了，屏幕输出当前工作路径是C//Windows/System32，
也就是cmd.exe的路径，导致bat文件运行异常--系统找不到指定路径。
要解决这个问题，首先要获取当前bat文件的路径，代码如下：
:xx1


set base_dir=%~dp0
%base_dir:~0,2%

goto xx2
这时，%base_dir%已经存储了当前bat文件的绝对路径了，接下来就是要将运行时的当前工作路径更换为%base_dir%就行了，代码如下：
:xx2

pushd %base_dir%

::bat批处理 code
notepad test

popd

goto xx3
修改之后，无论是双击直接运行，还是右击选择“以管理员身份运行”，结果都会是一样的。
系统定时任务在运行批处理文件时，当前的工作路径都会是
C//Windows/System32，
因此，都得用这种方法改变一下当前工作路径。

:xx3

pause