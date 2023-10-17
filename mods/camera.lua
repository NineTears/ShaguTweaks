local _G = ShaguTweaks.GetGlobalEnv()
local GetExpansion = ShaguTweaks.GetExpansion

local module = ShaguTweaks:register({
    title = "最大视角",
    description = "[camera]\n增加相机的最大缩小距离，并使缩放速度更快。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "界面UI",
    enabled = nil,
})
  
module.enable = function(self)
    SlashCmdList["CONSOLE"]("cameraDistanceMax 50")
    SlashCmdList["CONSOLE"]("cameraDistanceMaxFactor 5")
    SlashCmdList["CONSOLE"]("cameraDistanceMoveSpeed 50")
    SlashCmdList["CONSOLE"]("cameraDistanceSmoothSpeed 1")
end