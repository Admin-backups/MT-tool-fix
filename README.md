# MT-tool-fix

wget https://raw.githubusercontent.com/Admin-backups/MT-tool-fix/master/index2.lua

Misstar tools 好像不能用了，提供一个临时解决办法。

开发版升级到最新后 2.23.64 ，点击MT工具箱会提示出错 。。。

类似于这种：

研究了一下，是 /web/misstar/index 没有在luci中注册 ，翻代码后发现，index.lua 。。。 等等系统自带的lua文件都加密了 。。。

所以，安装脚本不能往里面写入文件配置。

临时解决办法：

在 /usr/lib/lua/luci/controller/web 目录下新建一个文件 index2.lua

内容如下：

module("luci.controller.web.index2", package.seeall)

function index()
    local page   = node("web","misstar")
        page.target  = firstchild()
        page.title   = ("")
        page.order   = 100
        page.sysauth = "admin"
        page.sysauth_authenticator = "jsonauth"
        page.index = true

        entry({"web", "misstar", "index"}, template("web/setting/misstar/index"), _("Tools"), 81)
        entry({"web", "misstar", "add"}, template("web/setting/misstar/add"), _("Tools"), 82)
        entry({"web", "misstar"}, alias("web","misstar","index"), _("Tools"), 80)
        entry({"web", "misstar", "ss"}, template("web/setting/applications/ss/html/ss"), _("Tools"), 85)

end

然后执行一下这个命令：
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache/*

应该可以正常访问了。
