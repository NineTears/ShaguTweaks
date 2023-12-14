local HookScript = ShaguTweaks.HookScript

local module = ShaguTweaks:register({
  title = "改进的高级选项",
  description = "[improved-advanced-options]\n允许移动和缩放高级选项菜单（拖动以移动，按住Ctrl并滚动鼠标滚轮以缩放）。",
  expansions = { ["vanilla"] = true, ["tbc"] = nil },
  category = "界面UI",
  enabled = true,
})

module.enable = function(self)
  local function position()
    AdvancedSettingsGUI:SetScale(1)
    AdvancedSettingsGUI:ClearAllPoints()
    AdvancedSettingsGUI:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
  end

  if not this.hooked then
    this.hooked = true

    HookScript(AdvancedSettingsGUI, "OnShow", function()
      this:EnableMouseWheel(1)
      position()
    end)

    HookScript(AdvancedSettingsGUI, "OnMouseWheel", function()
      if IsControlKeyDown() then
        AdvancedSettingsGUI:SetScale(AdvancedSettingsGUI:GetScale() + arg1/10)
      end
    end)

    HookScript(AdvancedSettingsGUI, "OnMouseDown",function()
      AdvancedSettingsGUI:StartMoving()
    end)

    HookScript(AdvancedSettingsGUI, "OnMouseUp",function()
      AdvancedSettingsGUI:StopMovingOrSizing()
    end)
  end

  AdvancedSettingsGUI:SetMovable(true)
  AdvancedSettingsGUI:EnableMouse(true)
  position()  
end