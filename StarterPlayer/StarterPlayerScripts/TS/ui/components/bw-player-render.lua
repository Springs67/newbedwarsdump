local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").PlayerRender
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit
local v12 = {}
local u13 = setmetatable({}, {
    ["__index"] = v12
})
u13.DEFAULT = 0
v12[0] = "DEFAULT"
u13.NONE = 1
v12[1] = "NONE"
u13.KIT = 2
v12[2] = "KIT"
local function v38(p14, p15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u3
        [4] = u13
        [5] = u11
        [6] = u10
        [7] = u4
        [8] = u7
        [9] = u8
        [10] = u2
    --]]
    local _ = p15.useState
    local v16 = u6:GetPlayerByUserId(p14.PlayerUserId)
    local v17 = {}
    for v18, v19 in p14 do
        v17[v18] = v19
    end
    v17.FallbackMode = nil
    v17.PlayerThumbnail = nil
    if not (v16 and (u9.getGamePlayer(v16):isInStreamerMode() or u3.Controllers.StreamerModeController:inStreamerMode())) then
        local v20 = {}
        for v21, v22 in v17 do
            v20[v21] = v22
        end
        v20.Thumbnail = p14.PlayerThumbnail
        return u4.createElement(u2, v20)
    end
    if p14.FallbackMode ~= u13.KIT and p14.FallbackMode ~= u13.NONE then
        local v23 = {}
        for v24, v25 in v17 do
            v23[v24] = v25
        end
        v23.PlayerUserId = nil
        return u4.createElement(u2, v23)
    end
    local v26
    if p14.FallbackMode == u13.KIT then
        v26 = u11(v16)
    else
        v26 = nil
    end
    local v27 = {
        ["Size"] = p14.Size or UDim2.new(1, 0, 1, 0),
        ["Position"] = p14.Position,
        ["AnchorPoint"] = p14.AnchorPoint
    }
    local v28 = p14.BorderSizePixel
    v27.BorderSizePixel = v28 == nil and 0 or v28
    local v29 = p14.BackgroundTransparency
    v27.BackgroundTransparency = v29 == nil and 1 or v29
    v27.BackgroundColor3 = p14.BackgroundColor3 or u10.backgroundPrimary
    v27.SizeConstraint = p14.SizeConstraint
    local v30 = p14.ClipsDescendants
    v27.ClipsDescendants = v30 == nil and true or v30
    local v31 = p14.LayoutOrder
    v27.LayoutOrder = v31 == nil and 1 or v31
    v27.ZIndex = p14.ZIndex
    local v32 = u4.createFragment
    local v33 = {}
    local v34 = u4.createElement
    local v35 = "Frame"
    local v36 = {}
    local v37
    if v26 then
        v37 = u4.createFragment({
            ["PlayerKitImage"] = u4.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = "Crop",
                ["BackgroundTransparency"] = 1,
                ["Image"] = u7[v26].renderImage,
                ["Size"] = UDim2.fromScale(1.25, 1.25),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["ZIndex"] = p14.ZIndex
            })
        })
    else
        v37 = u4.createFragment({
            ["NoKitImage"] = u4.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = "Crop",
                ["BackgroundTransparency"] = 1,
                ["Image"] = u8.X,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["ZIndex"] = p14.ZIndex
            })
        })
    end
    __set_list(v36, 1, {v37})
    v33.PlayerKitFrame = v34(v35, v27, v36)
    return v32(v33)
end
return {
    ["PlayerRenderFallbackMode"] = u13,
    ["BWPlayerRender"] = v5.new(u4)(v38)
}