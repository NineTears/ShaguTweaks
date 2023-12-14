-- Based on zUI skinning (https://github.com/Ko0z/zUI)
-- Credit to Ko0z (https://github.com/Ko0z/)

local module = ShaguTweaks:register({
    title = "改进的界面选项",
    description = "[improved-interface-options]\n重新调整界面选项菜单的比例并移除背景。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = nil,
})
  
module.enable = function(self)
    UIOptionsFrame:SetScript("OnShow", function()
        -- default events
        UIOptionsFrame_Load();
        MultiActionBar_Update();
        MultiActionBar_ShowAllGrids();
        Disable_BagButtons();
        UpdateMicroButtons();

        -- customize
        UIOptionsBlackground:Hide()
        UIOptionsFrame:SetScale(.8)
    end)
end