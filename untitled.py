git submodule的使用

1.在项目中使用Submodule

为当前工程添加submodule，命令如下：
git submodule add 仓库地址 路径
仓库地址：是指子模块仓库地址URL。
路径：指将子模块放置在当前工程下的路径。 
注意：路径不能以 / 结尾（会造成修改不生效）、不能是现有工程已有的目录（不能順利 Clone）
命令执行完成，会在当前工程根路径下生成一个名为“.gitmodules”的文件，其中记录了子模块的信息。
添加完成以后，再将子模块所在的文件夹添加到工程中即可。



2.修改Submodule
进入到子模块中，修改了文件后
提交Submodule的更改内容：git commit -a -m'test submodule'
然后push 到远程服务器:   git push
然后再回到父目录,提交Submodule在父项目中的变动：
git commit -m'update submodule'
git push

3.更新Submodule
更新Submodule有两种方式:
在父项目的目录下直接运行：git submodule foreach git pull
在Submodule的目录下面更新：git pull
更新Submodule:git submodule update
如果子模块有因的commitID产生，则需要重新提交到主工程


4.clone Submodule
clone Submodule有两种方式 一种是采用递归的方式clone整个项目，一种是clone父项目，再更新子项目。
采用递归参数 --recursive：git clone https://github.com/zhfei/MyTestWorkProduct.git --recursive
第二种方法先clone父项目，再初始化Submodule：
git clone https://github.com/zhfei/MyTestWorkProduct.git
cd pod-project
git submodule init


5.删除Submodule
git 并不支持直接删除Submodule需要手动删除对应的文件:
cd pod-project

git rm --cached subModule
rm -rf subModule
rm .gitmodules
更改git的配置文件config:
vim .git/config
可以看到Submodule的配置信息：

[submodule "subModule"]
  url = https://github.com/zhfei/ZFFlowLayout.git
删除submodule相关的内容,然后提交到远程服务器:

git commit -a -m 'remove subModule submodule'



参考文章：使用Git Submodule管理子模块 https://segmentfault.com/a/1190000003076028
demo地址：https://github.com/zhfei/MyTestWorkProduct.git

