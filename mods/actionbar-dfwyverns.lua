local _G = ShaguTweaks.GetGlobalEnv()

local module = ShaguTweaks:register({
    title = "动作条双足飞龙模型",
    description = "[actionbar-dfwyverns]\n将动作栏的狮鹫改为双足飞龙",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = nil,
})

module.enable = function(self)
    ShaguTweaks.dfwyverns = true
    for _, g in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
        g:SetTexture[[Interface\AddOns\ShaguTweaks\img\df\wyvern]]  
    end
    MainMenuBarLeftEndCap:ClearAllPoints()
    MainMenuBarLeftEndCap:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMLEFT", 27, -2)
    MainMenuBarRightEndCap:ClearAllPoints()
    MainMenuBarRightEndCap:SetPoint("BOTTOMLEFT", MainMenuBar, "BOTTOMRIGHT", -27, -2)
end