local _G = ShaguTweaks.GetGlobalEnv()

local module = ShaguTweaks:register({
    title = "动作条狮头飞龙模型",
    description = "[actionbar-ecwyvern]\n将动作栏的狮鹫改为狮头飞龙模型",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = true,
})

module.enable = function(self)
    ShaguTweaks.ecwyvern = true
    for _, g in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
        g:SetTexture[[Interface\AddOns\ShaguTweaks\img\df\endcap-wyvern]]
    end
      MainMenuBarLeftEndCap:ClearAllPoints()
      MainMenuBarLeftEndCap:SetWidth(115)
      MainMenuBarLeftEndCap:SetHeight(135)
      MainMenuBarLeftEndCap:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", -290, -4)
      MainMenuBarRightEndCap:ClearAllPoints()
      MainMenuBarRightEndCap:SetWidth(115)
      MainMenuBarRightEndCap:SetHeight(135)
      MainMenuBarRightEndCap:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", 290, -4)
end