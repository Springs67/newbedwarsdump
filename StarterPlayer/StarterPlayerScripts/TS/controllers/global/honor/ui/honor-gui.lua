local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent, "honor-team-gui").HonorTeamGUI
local v63 = v4.new(u3)(function(u8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u3
        [4] = u7
    --]]
    local v10 = p9.useState
    local v11 = p9.useEffect
    local v12 = u2.isSmallScreen() and 50 or 65
    local u13, u14 = v10(0)
    local u15, u16 = v10(0)
    v11(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u6
            [4] = u16
        --]]
        if u2.isHoarceKat() then
            u14(1)
            return nil
        end
        local u19 = u6.LocalPlayer:GetAttributeChangedSignal("HonorPointsLeftToGiveToAllies"):Connect(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u6
            --]]
            local v17 = u14
            local v18 = u6.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToAllies")
            v17(v18 == nil and 0 or v18)
        end)
        local u22 = u6.LocalPlayer:GetAttributeChangedSignal("HonorPointsLeftToGiveToOpponents"):Connect(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u6
            --]]
            local v20 = u16
            local v21 = u6.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToOpponents")
            v20(v21 == nil and 0 or v21)
        end)
        local v23 = u14
        local v24 = u6.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToAllies")
        v23(v24 == nil and 0 or v24)
        local v25 = u16
        local v26 = u6.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToOpponents")
        v25(v26 == nil and 0 or v26)
        return function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u22
            --]]
            local v27 = u19
            if v27 ~= nil then
                v27:Disconnect()
            end
            local v28 = u22
            if v28 ~= nil then
                v28:Disconnect()
            end
        end
    end, {})
    local v29 = {}
    local _ = #v29
    local v30 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, v12),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["BackgroundTransparency"] = 0.2,
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
    }
    local v31 = { u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }), u3.createElement("Frame", {
            ["BorderSizePixel"] = 4,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, {
            u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }),
            ["MainHonorHeader"] = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 28,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = tostring(u13) .. " Honor Points Remaining for Allies, " .. tostring(u15) .. " for Opponents",
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }) }
    local v32 = #v31
    local v33 = {}
    local v34 = #v33
    local v35 = u8.Teams
    table.move(v35, 1, #v35, v34 + 1, v33)
    table.sort(v33, function(p36, _) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v37 = p36.id
        local v38 = u8.MyTeam
        if v38 ~= nil then
            v38 = v38.id
        end
        return v37 == v38
    end)
    local function v53(p39, p40) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u15
            [4] = u3
            [5] = u7
        --]]
        local v41 = p39.id
        local v42 = u8.MyTeam
        if v42 ~= nil then
            v42 = v42.id
        end
        local v43 = false
        local v44
        if v41 == v42 then
            v44 = u13 == 0 and true or v43
        else
            v44 = u15 == 0 and true or v43
        end
        local v45 = 0
        local v46 = {}
        local v47 = {
            ["Team"] = p39,
            ["LayoutOrder"] = p40
        }
        for v48, v49 in u8.PlayerDatas do
            local _ = v48 - 1
            if v49.teamId == p39.id == true then
                v45 = v45 + 1
                v46[v45] = v49
            end
        end
        local v50 = table.create(#v46)
        for v51, v52 in v46 do
            local _ = v51 - 1
            v50[v51] = v52.playerInfo
        end
        v47.Players = v50
        v47.HonoredPlayers = u8.HonoredPlayers
        v47.Disabled = v44
        return u3.createElement(u7, v47)
    end
    local v54 = table.create(#v33)
    local v55 = {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 1000
    }
    for v56, v57 in v33 do
        v54[v56] = v53(v57, v56 - 1, v33)
    end
    local v58 = {
        ["AutomaticCanvasSize"] = "Y",
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["ScrollBarThickness"] = 0,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["ScrollingDirection"] = Enum.ScrollingDirection.Y
    }
    local v59 = { u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 16)
        }) }
    local v60 = #v59
    for v61, v62 in v54 do
        v59[v60 + v61] = v62
    end
    v31[v32 + 1] = u3.createElement("ScrollingFrame", v58, v59)
    v29.HonorMatchEndGUI = u3.createElement("Frame", v30, v31)
    return u3.createElement("ScreenGui", v55, v29)
end)
return {
    ["HonorGUI"] = v5.connect(function(p64, p65) --[[ Line: 200 ]]
        local v66 = {}
        for v67, v68 in p65 do
            v66[v67] = v68
        end
        v66.HonoredPlayers = p64.Game.honoredPlayers
        v66.Teams = p64.Game.teams
        v66.MyTeam = p64.Game.myTeam
        return v66
    end)(v63)
}