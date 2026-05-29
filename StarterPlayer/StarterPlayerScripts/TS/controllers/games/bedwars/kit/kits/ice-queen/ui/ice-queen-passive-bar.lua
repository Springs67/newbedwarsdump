local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
local u8 = v1.import(script, script.Parent, "ice-shard").IceShard
local u9 = v7("Shard1")
local u10 = v7("Shard2")
local u11 = v7("Shard3")
local u12 = v7("Shard4")
local u13 = v7("ShardOutline")
local u14 = u3.Component:extend("IceQueenPassiveBar")
function u14.init(_) --[[ Line: 18 ]] end
function u14.render(p15) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u9
        [4] = u8
        [5] = u10
        [6] = u11
        [7] = u12
    --]]
    local v16 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.new(0.6, 0, 0.6, 0)
    }
    local v17 = p15.props.shardImages
    if v17 ~= nil then
        v17 = v17.shardsOutline.Image
    end
    if v17 == nil then
        v17 = u13.Image
    end
    v16.Image = v17
    local v18 = p15.props.shardImages
    if v18 ~= nil then
        v18 = v18.shardsOutline.ImageRectSize
    end
    if v18 == nil then
        v18 = u13.ImageRectSize
    end
    v16.ImageRectSize = v18
    local v19 = p15.props.shardImages
    if v19 ~= nil then
        v19 = v19.shardsOutline.ImageRectOffset
    end
    if v19 == nil then
        v19 = u13.ImageRectOffset
    end
    v16.ImageRectOffset = v19
    local v20 = { u3.createElement("UIGradient", {
            ["Rotation"] = -90,
            ["Color"] = p15.props.iceShardGradient or ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 255)),
            ["Offset"] = Vector2.new(0, 0.1)
        }) }
    local v21 = #v20
    local v22 = {}
    local v23 = p15.props.shardImages
    if v23 ~= nil then
        v23 = v23.shard1
    end
    if v23 == nil then
        v23 = u9
    end
    v22.shard = v23
    v22.barNumber = 0
    v22.currentBar = p15.props.bar
    v22.gradient = p15.props.iceShardGradient
    v20[v21 + 1] = u3.createElement(u8, v22)
    local v24 = {}
    local v25 = p15.props.shardImages
    if v25 ~= nil then
        v25 = v25.shard2
    end
    if v25 == nil then
        v25 = u10
    end
    v24.shard = v25
    v24.barNumber = 1
    v24.currentBar = p15.props.bar
    v24.gradient = p15.props.iceShardGradient
    v20[v21 + 2] = u3.createElement(u8, v24)
    local v26 = {}
    local v27 = p15.props.shardImages
    if v27 ~= nil then
        v27 = v27.shard3
    end
    if v27 == nil then
        v27 = u11
    end
    v26.shard = v27
    v26.barNumber = 2
    v26.currentBar = p15.props.bar
    v26.gradient = p15.props.iceShardGradient
    v20[v21 + 3] = u3.createElement(u8, v26)
    local v28 = {}
    local v29 = p15.props.shardImages
    if v29 ~= nil then
        v29 = v29.shard4
    end
    if v29 == nil then
        v29 = u12
    end
    v28.shard = v29
    v28.barNumber = 3
    v28.currentBar = p15.props.bar
    v28.gradient = p15.props.iceShardGradient
    v20[v21 + 4] = u3.createElement(u8, v28)
    return u3.createFragment({
        ["IceQueenPassiveBar"] = u3.createElement("ImageLabel", v16, v20)
    })
end
local u30 = u3.Component:extend("StackIndicator")
function u30.init(_) --[[ Line: 126 ]] end
function u30.render(u31) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.createElement("TextLabel", {
        ["Font"] = "LuckiestGuy",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["Text"] = u31.props.bar:map(function(_) --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            local v32 = u31.props.bar
            return tostring(v32:getValue())
        end),
        ["TextColor3"] = u31.props.stackIndicatorColor or Color3.new(0.42, 0.63, 0.95),
        ["Size"] = UDim2.fromScale(0.75, 0.25),
        ["Position"] = UDim2.fromScale(0.5, 0.3),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    })
end
local function v40(p33, p34) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u3
        [5] = u30
        [6] = u14
    --]]
    local _ = p34.useState
    local v35 = nil
    local v36 = nil
    local v37 = nil
    local v38 = p33.lastAttackerUserId
    if v38 ~= 0 and (v38 == v38 and v38) then
        local v39 = u5:GetPlayerByUserId(p33.lastAttackerUserId)
        if v39 ~= nil then
            v39 = v39.Character
        end
        if v39 then
            v37 = u6[u2.Controllers.KitSkinController:getKitSkin(v39)].freiya
            if v37 == nil then
                v35 = v37
            else
                v35 = v37.iceShardGradient
            end
            if v37 == nil then
                v36 = v37
            else
                v36 = v37.stackIndicatorColor
            end
            if v37 ~= nil then
                v37 = v37.shardImages
            end
        end
    end
    return u3.createElement("BillboardGui", {
        ["AlwaysOnTop"] = false,
        ["ResetOnSpawn"] = false,
        ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 4.3, 0),
        ["Adornee"] = p33.adornee,
        ["Size"] = UDim2.fromScale(3, 3)
    }, { u3.createElement(u30, {
            ["bar"] = p33.bar,
            ["stackIndicatorColor"] = v36
        }), u3.createElement(u14, {
            ["bar"] = p33.bar,
            ["iceShardGradient"] = v35,
            ["shardImages"] = v37
        }) })
end
return {
    ["IceQueenPassiveBar"] = u14,
    ["StackIndicator"] = u30,
    ["IceQueenPassiveBarWrapper"] = v4.new(u3)(v40)
}