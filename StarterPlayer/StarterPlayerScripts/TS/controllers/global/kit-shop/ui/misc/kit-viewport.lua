local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u7 = v1.import(script, script.Parent, "player-viewport").PlayerViewport
local v8 = u2.Component:extend("KitViewport")
function v8.init(_) --[[ Line: 12 ]] end
function v8.render(p9) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u3
        [6] = u4
    --]]
    local v10 = {}
    for v11, v12 in p9.props do
        v10[v11] = v12
    end
    v10[u2.Children] = nil
    v10.Kit = nil
    v10.Skin = nil
    if not p9.props.Kit then
        local v13 = {}
        for v14, v15 in v10 do
            v13[v14] = v15
        end
        local v16 = {}
        local v17 = #v16
        local v18 = p9.props[u2.Children]
        if v18 then
            for v19, v20 in v18 do
                if type(v19) == "number" then
                    v16[v17 + v19] = v20
                else
                    v16[v19] = v20
                end
            end
        end
        return u2.createElement(u7, v13, v16)
    end
    local v21 = u6(u5.GRIM_REAPER).renderImage
    local v22 = v21 == nil and "" or v21
    if p9.props.Kit then
        local v23 = u6(p9.props.Kit)
        if v23 then
            v22 = v23.renderImage
        else
            warn(p9.props.Kit .. " is not a valid kit")
        end
    end
    if p9.props.Skin and p9.props.Skin ~= u3.DEFAULT then
        local v24 = u4[p9.props.Skin]
        if v24 then
            v22 = v24.renderImage
        else
            warn(p9.props.Skin .. " is not a valid kit skin")
        end
    end
    local v25 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Image"] = v22,
        ["ScaleType"] = Enum.ScaleType.Fit,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
    }
    local v26 = p9.props.ImageTransparency
    v25.ImageTransparency = v26 == nil and 0 or v26
    v25.ZIndex = p9.props.ZIndex
    for v27, v28 in v10 do
        v25[v27] = v28
    end
    local v29 = {}
    local v30 = #v29
    local v31 = p9.props[u2.Children]
    if v31 then
        for v32, v33 in v31 do
            if type(v32) == "number" then
                v29[v30 + v32] = v33
            else
                v29[v32] = v33
            end
        end
    end
    return u2.createElement("ImageLabel", v25, v29)
end
return {
    ["KitViewport"] = v8
}