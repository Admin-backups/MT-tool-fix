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
