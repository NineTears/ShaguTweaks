local _G = ShaguTweaks.GetGlobalEnv()

local module = ShaguTweaks:register({
    title = "动作条鹰头狮模型",
    description = "[actionbar-dfgryphons]\n将动作栏的狮鹫改为鹰头狮",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = nil,
})

module.enable = function(self)
    ShaguTweaks.dfgryphons = true
    for _, g in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
        g:SetTexture[[Interface\AddOns\ShaguTweaks\img\df\gryphon]]
    end    
    MainMenuBarLeftEndCap:ClearAllPoints()
    MainMenuBarLeftEndCap:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMLEFT", 26, -4)
    MainMenuBarRightEndCap:ClearAllPoints()
    MainMenuBarRightEndCap:SetPoint("BOTTOMLEFT", MainMenuBar, "BOTTOMRIGHT", -26, -4)
end