local module = ShaguTweaks:register({
    title = "优化游戏引擎",
    description = "[max-smoothness]\n优化游戏引擎，让游戏更流畅。请注意，这将永久地将设置添加到Config.wtf文件。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = nil,
    enabled = true,
})
  
module.enable = function(self)
    -- https://forum.nostalrius.org/viewtopic.php?t=1100&f=32#
    SlashCmdList["CONSOLE"]("bspcache 1")
    SlashCmdList["CONSOLE"]("gxTripleBuffer 1")
    SlashCmdList["CONSOLE"]("M2UsePixelShaders 1")
    SlashCmdList["CONSOLE"]("M2UseZFill 1")
    SlashCmdList["CONSOLE"]("M2UseClipPlanes 1")
    SlashCmdList["CONSOLE"]("M2UseThreads 1")
    SlashCmdList["CONSOLE"]("M2UseShaders 1")
    SlashCmdList["CONSOLE"]("M2BatchDoodads 1")
end