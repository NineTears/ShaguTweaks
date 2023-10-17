local _G = ShaguTweaks.GetGlobalEnv()
local hooksecurefunc = ShaguTweaks.hooksecurefunc

local module = ShaguTweaks:register({
    title = "按下释放",
    description = "[actionbar-quick-actions]\n按下按键时，操作将立即激活而不是释放按键时。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = nil,
    enabled = true,
})

module.enable = function(self)
    local function setChecked(button, checked)
        if not button then return end
        button:SetChecked(checked)
    end

    local function checked(button)
        if not button then return end  
        if ( IsCurrentAction(ActionButton_GetPagedID(button)) ) then
            setChecked(button, 1)
        else
            setChecked(button, 0)
        end
    end

    hooksecurefunc("ActionButtonDown", function(id)
        ActionButtonUp(id)
        if ( BonusActionBarFrame:IsShown() ) then
            local button = _G["BonusActionButton"..id]
            if not button then return end   
            setChecked(button, 1)
        end
        local button = _G["ActionButton"..id]
        if not button then return end 
        setChecked(button, 1)
    end, true)

    hooksecurefunc("ActionButtonUp", function(id)
        if ( BonusActionBarFrame:IsShown() ) then
            local button = _G["BonusActionButton"..id]
            checked(button)
        end
        local button = _G["ActionButton"..id]    
        checked(button)
    end, true)

    hooksecurefunc("MultiActionButtonDown", function(bar, id)
        MultiActionButtonUp(bar, id)
        local button = _G[bar.."Button"..id]
        setChecked(button, 1)
    end, true)

    hooksecurefunc("MultiActionButtonUp", function(bar, id, onSelf)
        local button = _G[bar.."Button"..id]
        checked(button)
    end, true)

    hooksecurefunc("PetActionButtonDown", function(id)
        local button = _G["PetActionButton"..id]
        if ( button:GetButtonState() == "NORMAL" ) then
            button:SetButtonState("PUSHED")
            CastPetAction(id)
        end
    end)

    hooksecurefunc("PetActionButtonUp", function(id)
        local button = _G["PetActionButton"..id]
        if ( button:GetButtonState() == "PUSHED" ) then
            button:SetButtonState("NORMAL")
        end
    end)
end
