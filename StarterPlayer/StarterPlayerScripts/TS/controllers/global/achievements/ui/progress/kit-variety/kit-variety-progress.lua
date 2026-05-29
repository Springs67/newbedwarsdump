local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DropdownComponent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v58 = v7.new(u6)(function(p13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u11
        [4] = u12
        [5] = u6
        [6] = u9
        [7] = u3
        [8] = u4
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local u17, u18 = v15({})
    local u19 = {}
    local u20 = {}
    local v21 = u5.values(u10)
    local function v24(p22, p23) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        return u11(p22).name < u11(p23).name
    end
    table.sort(v21, v24)
    local function v32(p25) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u17
            [3] = u19
            [4] = u20
        --]]
        local v26 = u11(p25)
        if v26.kitClass == nil then
            return nil
        else
            local v27 = u17
            if v27 ~= nil then
                v27 = v27[p25]
                if v27 ~= nil then
                    v27 = v27.wins
                end
            end
            if v27 == nil then
                v27 = false
            end
            if v27 == 0 or (v27 ~= v27 or not v27) then
                local v28 = {
                    ["text"] = v26.name,
                    ["value"] = p25
                }
                local v29 = u20
                table.insert(v29, v28)
            else
                local v30 = {
                    ["text"] = v26.name,
                    ["value"] = p25
                }
                local v31 = u19
                table.insert(v31, v30)
            end
        end
    end
    local v33 = {
        ["text"] = "N/A",
        ["value"] = "na"
    }
    for v34, v35 in v21 do
        v32(v35, v34 - 1, v21)
    end
    v16(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
        --]]
        task.spawn(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u18
            --]]
            u12.Client:Get("RequestKitStats"):CallServerAsync():andThen(function(p36) --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18(p36)
            end)
        end)
    end, {})
    local v37 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 0, 30)
    }
    local v38 = p13.FrameProps
    if v38 then
        for v39, v40 in v38 do
            v37[v39] = v40
        end
    end
    local v41 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
        }) }
    local v42 = #v41
    local v43 = {
        ["LayoutOrder"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v44 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0, 5)
        }) }
    local v45 = #v44
    local v46 = {
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v47 = p13.ProfileData.achievementProgressValues[u9.KIT_VARIETY_1]
    local v48 = v47 == nil and 0 or v47
    v46.Text = "Completed (" .. tostring(v48) .. ")"
    v46.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
    v46.TextColor3 = u3.WHITE
    v46.TextTransparency = 0.3
    v46.BackgroundTransparency = 1
    v44[v45 + 1] = u6.createElement("TextLabel", v46, { u6.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 24
        }) })
    local v49 = {
        ["Size"] = UDim2.fromScale(0.95, 1)
    }
    local v50 = {}
    local v51 = #v50
    table.move(u19, 1, #u19, v51 + 1, v50)
    v49.Items = v50
    v49.DefaultItem = u19[1] or v33
    function v49.OnItemSelected() --[[ Line: 131 ]] end
    v49.LayoutOrder = 4
    v44[v45 + 2] = u6.createElement(u4, v49)
    v41[v42 + 1] = u6.createElement("Frame", v43, v44)
    local v52 = {
        ["LayoutOrder"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v53 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0, 5)
        }), u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["Text"] = "Incomplete",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
            ["TextColor3"] = u3.WHITE
        }, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 24
            }) }) }
    local v54 = #v53
    local v55 = {
        ["Size"] = UDim2.fromScale(0.95, 1)
    }
    local v56 = {}
    local v57 = #v56
    table.move(u20, 1, #u20, v57 + 1, v56)
    v55.Items = v56
    v55.DefaultItem = u20[1] or v33
    function v55.OnItemSelected() --[[ Line: 169 ]] end
    v55.LayoutOrder = 4
    v53[v54 + 1] = u6.createElement(u4, v55)
    v41[v42 + 2] = u6.createElement("Frame", v52, v53)
    return u6.createElement("Frame", v37, v41)
end)
return {
    ["KitVarietyProgress"] = v8.connect(function(p59, p60) --[[ Line: 176 ]]
        local v61 = {}
        for v62, v63 in p60 do
            v61[v62] = v63
        end
        v61.store = p59
        return v61
    end)(v58)
}