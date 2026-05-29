local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v37 = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u7
        [4] = u3
        [5] = u6
        [6] = u12
        [7] = u11
        [8] = u5
    --]]
    local _ = p14.useState
    local v15
    if u13.Team == nil then
        v15 = nil
    else
        v15 = nil
        for v16, v17 in u13.QueueMeta.teams do
            local _ = v16 - 1
            if v17.id == u13.Team.id == true then
                v15 = v17
                break
            end
        end
    end
    local v18
    if v15 == nil then
        v18 = v15
    else
        v18 = v15.maxPlayers
    end
    local v19 = v18 == nil and 20 or v18
    local v20 = false
    local v21 = u13.Team
    if v21 then
        local v22 = u13.MyTeam
        if v22 ~= nil then
            v22 = v22.id
        end
        local v23 = u13.Team
        if v23 ~= nil then
            v23 = v23.id
        end
        v21 = v22 == v23
    end
    local v24 = v21 and true or (u13.Team == nil and u13.MyTeam == nil and true or v20)
    local v25
    if v15 then
        v25 = u4.hexColor(v15.colorHex)
    else
        v25 = nil
    end
    local v26 = not v15 and "Spectate" or v15.displayName
    local v27
    if u13.Team then
        v27 = 0
        for _ in u13.Team.members do
            v27 = v27 + 1
        end
    else
        local v28 = 0
        local v29 = {}
        for v30, v31 in u10:GetPlayers() do
            local _ = v30 - 1
            if (v31.Team == nil and true or v31.Team.Name == "Spectators") == true then
                v28 = v28 + 1
                v29[v28] = v31
            end
        end
        v27 = #v29
    end
    local v32 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["LayoutOrder"] = u13.LayoutOrder
    }
    local v35 = { u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3,
            ["DominantAxis"] = "Height"
        }), u7.createElement(u3, {
            ["Text"] = "<b><font color=\"" .. u4.richTextColor(v25 or Color3.fromRGB(255, 255, 255)) .. "\">" .. v26 .. "</font>" .. (not v15 and "" or "  (" .. tostring(v27) .. "/" .. tostring(v19) .. ")") .. "</b>",
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 106 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u12
                    [3] = u11
                    [4] = u13
                --]]
                u6:playSound(u12.UI_CLICK)
                local v33 = u11.Client:GetNamespace("CustomMatches"):Get("SelectTeam")
                local v34 = u13.Team
                if v34 ~= nil then
                    v34 = v34.name
                end
                v33:CallServerAsync(v34 == nil and "spectators" or v34):andThen(function(_) --[[ Line: 118 ]] end)
            end
        }) }
    local v36 = #v35
    if v24 then
        v24 = u7.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0.05, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["Position"] = UDim2.fromScale(0.5, -0.05),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        })
    end
    if v24 then
        v35[v36 + 1] = v24
    end
    return u7.createElement(u5, v32, v35)
end)
return {
    ["CustomMatchTeamButton"] = v9.connect(function(p38, p39) --[[ Line: 137 ]]
        local v40 = {}
        for v41, v42 in p39 do
            v40[v41] = v42
        end
        v40.MyTeam = p38.Game.myTeam
        return v40
    end)(v37)
}