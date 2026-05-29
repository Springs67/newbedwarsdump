local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-mode").MatchDraftMode
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase
local u13 = v1.import(script, script.Parent, "match-draft-multi-team-page").MatchDraftMultiTeamPage
local u14 = v1.import(script, script.Parent, "match-draft-two-teams-page").MatchDraftTwoTeamsPage
local v48 = v7.new(u6)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u5
        [4] = u9
        [5] = u12
        [6] = u3
        [7] = u4
        [8] = u11
        [9] = u14
        [10] = u13
    --]]
    local v17 = p16.useEffect
    local _ = p16.useState
    local _ = p16.useValue
    local _ = p16.useMemo
    local u18 = u6.createRef()
    local v19 = u15.MapId
    local v20
    if v19 == "" or not v19 then
        v20 = u10.DEFAULT_MAP_IMAGE
    else
        v20 = u10.getMapImage(u15.MapId)
    end
    local v21 = v20 == u10.DEFAULT_MAP_IMAGE and "rbxassetid://71356717298935" or v20
    local u22 = nil
    local function v31() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
            [3] = u9
            [4] = u15
            [5] = u22
        --]]
        local u23 = u18:getValue()
        if not u23 then
            return nil
        end
        local u24 = u5.new()
        local u25 = u9:Create(u23, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        })
        local v26 = u9
        local v27 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local v28 = {}
        local v29 = u15.store.Draft.sharedData
        if v29 ~= nil then
            v29 = v29.matchDraftPhase
        end
        v28.BackgroundColor3 = u22(v29)
        local u30 = v26:Create(u23, v27, v28)
        u24:GiveTask(u25.Completed:Connect(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u30
            --]]
            u24:GiveTask(task.delay(0.5, function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30:Play()
            end))
        end))
        u24:GiveTask(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:Cancel()
            u25:Destroy()
        end)
        u24:GiveTask(u30.Completed:Connect(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u25
            --]]
            u24:GiveTask(task.delay(0.5, function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:Play()
            end))
        end))
        u24:GiveTask(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:Cancel()
            u30:Destroy()
        end)
        u25:Play()
        return function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u23
            --]]
            u24:Destroy()
            u23.Transparency = 0
        end
    end
    local v32 = u15.store.Draft.sharedData
    if v32 ~= nil then
        v32 = v32.matchDraftPhase
    end
    v17(v31, { v32 })
    u22 = function(p33) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v34 = false
        if p33 == u12.BANNING then
            return Color3.fromRGB(255, 153, 153)
        elseif p33 == u12.BANNING_TRANSITION and true or v34 or p33 == u12.LOADING then
            return Color3.fromRGB(255, 255, 145)
        elseif p33 == u12.KIT_SELECT then
            return Color3.fromRGB(135, 135, 255)
        else
            return Color3.fromRGB(255, 255, 255)
        end
    end
    local v35 = {
        ["DisplayOrder"] = 1500,
        ["IgnoreGuiInset"] = true
    }
    local v36 = {}
    local _ = #v36
    local v37 = {
        ["AutoButtonColor"] = false,
        ["ZIndex"] = -1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Image"] = v21,
        ["ScaleType"] = Enum.ScaleType.Crop
    }
    local v38 = {}
    local v39 = #v38
    local v40 = {
        ["ZIndex"] = -1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v41 = {
        ["HeaderPane"] = u6.createElement("Frame", {
            ["Transparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["BackgroundColor3"] = u3.BLACK
        }),
        ["LeftPane"] = u6.createElement("Frame", {
            ["Transparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.25, 0.75),
            ["Position"] = UDim2.fromScale(0, 0.25),
            ["BackgroundColor3"] = u3.BLACK
        }),
        ["RightPane"] = u6.createElement("Frame", {
            ["Transparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.25, 0.75),
            ["Position"] = UDim2.fromScale(1, 0.25),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundColor3"] = u3.BLACK
        })
    }
    local _ = #v41
    local v42 = {
        ["Transparency"] = 0.2,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.5, 0.75),
        ["Position"] = UDim2.fromScale(0.5, 0.25),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["BackgroundColor3"] = u3.BLACK
    }
    local v43 = u15.store.Draft.sharedData
    if v43 ~= nil then
        v43 = v43.matchDraftPhase
    end
    v42.ZIndex = v43 == u12.LOADING and 1000 or -1
    v41.CenterBodyPane = u6.createElement("Frame", v42)
    v38.DraftAppBackgroundTint = u6.createElement(u4, v40, v41)
    local v44 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v45 = u15.store.Draft.sharedData
    if v45 ~= nil then
        v45 = v45.matchDraftPhase
    end
    v44.BackgroundColor3 = u22(v45)
    v44[u6.Ref] = u18
    v44.ZIndex = -1
    v38.BackgroundGradient = u6.createElement("Frame", v44, { u6.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
            ["Color"] = ColorSequence.new(u3.WHITE)
        }) })
    local v46 = v39 + 1
    local v47
    if u15.store.Draft.draftMode == u11.TWO_TEAMS then
        v47 = u6.createElement(u14, {
            ["store"] = u15.store
        })
    elseif u15.store.Draft.draftMode == u11.MULTI_TEAM then
        v47 = u6.createElement(u13, {
            ["store"] = u15.store
        })
    else
        v47 = u6.createFragment()
    end
    v38[v46] = v47
    v36.DraftAppBackground = u6.createElement("ImageButton", v37, v38)
    return u6.createElement("ScreenGui", v35, v36)
end)
return {
    ["MatchDraftApp"] = v8.connect(function(p49, p50) --[[ Line: 179 ]]
        local v51 = {}
        for v52, v53 in p50 do
            v51[v52] = v53
        end
        v51.store = p49
        return v51
    end)(v48)
}