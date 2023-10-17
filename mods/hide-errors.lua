local _G = ShaguTweaks.GetGlobalEnv()

local module = ShaguTweaks:register({
  title = "隐藏Lua错误",
  description = "[hide-errors]\n隐藏由插件产生的所有Lua错误，再也不会有任何提示信息出现。",
  expansions = { ["vanilla"] = true, ["tbc"] = true },
  enabled = nil,
})

module.enable = function(self)
  error = function() return end
  seterrorhandler(error)
end
