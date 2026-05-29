local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["EggHuntBoardBase"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        return u2.createElement("SurfaceGui", {
            ["LightInfluence"] = 0.25,
            ["Brightness"] = 1.5,
            ["Face"] = Enum.NormalId.Front,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        }, { u2.createElement(p3.uiHook, p3.hookProps) })
    end)
}