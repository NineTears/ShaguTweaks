local _G = ShaguTweaks.GetGlobalEnv()
local gfind = string.gmatch or string.gfind
local rgbhex = ShaguTweaks.rgbhex
local strsplit = ShaguTweaks.strsplit

local module = ShaguTweaks:register({
    title = "聊天等级",
    description = "[chat-levels]\n在聊天中显示玩家的等级。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "社交&聊天",
    enabled = nil,
})
  
module.enable = function(self)
  local playerdb = ShaguTweaks_cache["players"]
  do -- add player level to chat
    for i=1,NUM_CHAT_WINDOWS do
      if _G["ChatFrame"..i] and not _G["ChatFrame"..i].HookAddMessageLevel and not Prat then
        _G["ChatFrame"..i].HookAddMessageLevel = _G["ChatFrame"..i].AddMessage
        _G["ChatFrame"..i].AddMessage = function(frame, text, a1, a2, a3, a4, a5)
          if text then
            for name in gfind(text, "|Hplayer:(.-)|h") do
              if playerdb[name] and playerdb[name].level then
                local level = playerdb[name].level
                local color = rgbhex(GetDifficultyColor(level))
                text = string.gsub(text, "|h|r".."]|r",
                "|h|r".." "..color..level.."|r]")
              end
            end
          end

          _G["ChatFrame"..i].HookAddMessageLevel(frame, text, a1, a2, a3, a4, a5)
        end
      end
    end
  end
end