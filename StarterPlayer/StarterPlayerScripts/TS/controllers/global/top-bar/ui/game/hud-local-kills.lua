local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v19 = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u3
    --]]
    local _ = p10.useState
    local v11 = u5.createElement
    local v12 = u4
    local v13 = {
        ["LayoutOrder"] = p9.LayoutOrder
    }
    local v14 = {}
    local v15 = u5.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Image"] = u8.HUD_KILLS_ICON,
        ["Size"] = UDim2.new(0, 16, 0, 16),
        ["ImageColor3"] = Color3.fromRGB(255, 11, 70)
    })
    local v16 = u5.createElement
    local v17 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["TextSize"] = 16
    }
    local v18 = p9.LocalKills
    v17.Text = tostring(v18)
    v17.AutomaticSize = Enum.AutomaticSize.X
    v17.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v17.TextXAlignment = Enum.TextXAlignment.Left
    v17.TextColor3 = u3.WHITE
    __set_list(v14, 1, {v15, v16("TextLabel", v17)})
    return v11(v12, v13, v14)
end)
return {
    ["HudLocalKills"] = v7.connect(function(p20, p21) --[[ Line: 35 ]]
        local v22 = {}
        for v23, v24 in p21 do
            v22[v23] = v24
        end
        local v25 = p20.Bedwars.kills[p21.LocalPlayerId]
        v22.LocalKills = v25 == nil and 0 or v25
        return v22
    end)(v19)
}