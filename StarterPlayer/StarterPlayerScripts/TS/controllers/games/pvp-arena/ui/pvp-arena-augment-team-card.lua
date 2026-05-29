local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "pvp-arena-augment-icon").PvPArenaAugmentIcon
local v55 = v7.new(u6)(function(u12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u5
        [4] = u3
        [5] = u10
        [6] = u4
        [7] = u11
    --]]
    local _ = p13.useState
    local v14 = p13.useEffect
    local u15 = u6.createRef()
    v14(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
        --]]
        local v16 = u15:getValue()
        if not v16 then
            return nil
        end
        u9:Create(v16, TweenInfo.new(1), {
            ["Position"] = UDim2.fromScale(0, 0)
        }):Play()
    end, {})
    local v17 = u5.values(u12.team.members)
    local function v46(p18, p19) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u10
            [4] = u4
            [5] = u12
            [6] = u11
            [7] = u5
        --]]
        local v20 = {}
        local v21 = #v20
        local v22 = {
            ["ZIndex"] = -9,
            ["Size"] = UDim2.fromScale(0.485, 1)
        }
        local v23 = { u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.06, 0),
                ["PaddingBottom"] = UDim.new(0.06, 0),
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }) }
        local v24 = #v23
        local v25 = {
            ["ZIndex"] = -9,
            ["Size"] = UDim2.fromScale(0.25, 1)
        }
        local v26 = {}
        local _ = #v26
        local v27 = {
            ["BackgroundTransparency"] = 0.1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v28 = p18.userId
        local v29
        if v28 == 0 or (v28 ~= v28 or not v28) then
            v29 = nil
        else
            local v30 = p18.userId
            v29 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v30) .. "&w=48&h=48"
        end
        v27.Image = v29
        v27.ZIndex = -9
        local v31 = p18.userId
        v26["PlayerCard" .. tostring(v31)] = u6.createElement("ImageLabel", v27, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u10.backgroundSecondary
            }) })
        v23[v24 + 1] = u6.createElement(u4, v25, v26)
        local v32 = u12.userIdAugmentMap
        if v32 ~= nil then
            local v33 = v32[p18.userId]
            if v33 == nil then
                v32 = v33
            else
                local function v37(p34) --[[ Line: 75 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u11
                    --]]
                    local v35 = u6.createFragment
                    local v36 = {
                        ["PvPArenaAugmentIcon" .. p34] = u6.createElement(u11, {
                            ["EnableTooltip"] = true,
                            ["Augment"] = p34,
                            ["FrameProps"] = {
                                ["ZIndex"] = -9
                            }
                        }, { u6.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }) })
                    }
                    return v35(v36)
                end
                v32 = table.create(#v33)
                for v38, v39 in v33 do
                    v32[v38] = v37(v39, v38 - 1, v33)
                end
            end
        end
        local v40 = {
            ["ZIndex"] = -9,
            ["Size"] = UDim2.fromScale(0.75, 1),
            ["Position"] = UDim2.fromScale(0.25, 0)
        }
        local v41 = { u6.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 3,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["CellSize"] = UDim2.fromScale(0.3, 0.5),
                ["CellPadding"] = UDim2.fromOffset(0, 0)
            }) }
        local v42 = #v41
        if v32 then
            for v43, v44 in v32 do
                v41[v42 + v43] = v44
            end
        end
        v23[v24 + 2] = u6.createElement(u4, v40, v41)
        v20[v21 + 1] = u6.createElement(u4, v22, v23)
        local v45
        if p19 < #u5.values(u12.team.members) - 1 then
            v45 = u6.createFragment({
                ["Divider"] = u6.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = -9,
                    ["Size"] = UDim2.fromScale(0.01, 1),
                    ["BackgroundColor3"] = u10.backgroundTertiary
                })
            })
        else
            v45 = false
        end
        if v45 then
            v20[v21 + 2] = v45
        end
        return u6.createFragment(v20)
    end
    local v47 = table.create(#v17)
    for v48, v49 in v17 do
        v47[v48] = v46(v49, v48 - 1, v17)
    end
    local v50 = {
        ["Size"] = UDim2.fromScale(2, 1),
        ["ZIndex"] = -99,
        [u6.Ref] = u15,
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(2, 0),
        ["BackgroundColor3"] = u10.backgroundSecondary
    }
    local v51 = { u6.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Transparency"] = 0,
            ["Color"] = u10.backgroundTertiary
        }), u6.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
        }) }
    local v52 = #v51
    for v53, v54 in v47 do
        v51[v52 + v53] = v54
    end
    return u6.createFragment({
        ["PvpArenaAugmentTeamCard" .. u12.team.id] = u6.createElement("Frame", v50, v51)
    })
end)
return {
    ["PvpArenaAugmentTeamCard"] = v8.connect(function(p56, p57) --[[ Line: 169 ]]
        local v58 = {}
        for v59, v60 in p57 do
            v58[v59] = v60
        end
        local v61 = p56.Bedwars.pvpArena
        if v61 ~= nil then
            v61 = v61.userIdAugmentMap
        end
        v58.userIdAugmentMap = v61
        return v58
    end)(v55)
}