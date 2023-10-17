local _G = ShaguTweaks.GetGlobalEnv()

local module = ShaguTweaks:register({
    title = "动作条狮子模型",
    description = "[actionbar-gryphons]\n将动作栏的狮鹫改为狮子",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = nil,
})

module.enable = function(self)
    for _, g in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
        g:SetTexture[[Interface\MainMenuBar\UI-MainMenuBar-EndCap-Human]]  
    end
end