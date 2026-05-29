local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.DarkBackground
local u7 = v3.DeviceUtil
local u8 = v3.SlideIn
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.RunService
local u17 = v14.UserInputService
local u18 = v14.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-type").TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY
local u25 = v1.import(script, script.Parent, "snake-shrine-upgrade-descriptions").SnakeShrineUpgradeDescriptions
local u26 = v1.import(script, script.Parent, "snake-shrine-upgrade-frame").SnakeShrineUpgradeFrame
local v104 = v12.new(u11)(function(u27, p28) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u20
        [3] = u24
        [4] = u22
        [5] = u10
        [6] = u15
        [7] = u18
        [8] = u19
        [9] = u9
        [10] = u16
        [11] = u17
        [12] = u2
        [13] = u21
        [14] = u11
        [15] = u6
        [16] = u5
        [17] = u23
        [18] = u26
        [19] = u4
        [20] = u25
        [21] = u8
    --]]
    local v29 = p28.useState
    local v30 = p28.useEffect
    local v31 = u7.isSmallScreen()
    local u32 = u20:getState().Game.myTeam
    if u32 ~= nil then
        u32 = u32.id
    end
    local v33, u34 = v29(u24[1])
    local v35 = u20:getState().Bedwars.teamBedStatus
    local v36, u37 = v29(u32 == nil and true or v35[u32] == u22.BedStatus.BED_BROKEN)
    local function v39(p38) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34(p38)
    end
    v30(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u15
            [3] = u27
            [4] = u18
            [5] = u19
            [6] = u9
            [7] = u16
            [8] = u17
            [9] = u2
            [10] = u21
            [11] = u20
            [12] = u32
            [13] = u22
            [14] = u37
        --]]
        local u40 = u10.new()
        local u41 = true
        u40:GiveTask(function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41 = false
            return u41
        end)
        if not u15.LocalPlayer then
            return nil
        end
        local u42 = u15.LocalPlayer.Character
        local v43
        if u42 == nil then
            v43 = u42
        else
            v43 = u42.PrimaryPart
        end
        if v43 then
            local v44 = u27.SnakeShrineInstance.Position
            local v45 = v44.X
            local v46 = u42.PrimaryPart.Position.Y
            local v47 = v44.Z
            local u48 = Vector3.new(v45, v46, v47)
            u42:PivotTo(CFrame.new(u42.PrimaryPart.Position, u48))
            local u49 = u18.CurrentCamera
            if u49 then
                local u50 = NumberRange.new(0.5, 14)
                local u51 = (u49.CFrame.Position - (u42.PrimaryPart.Position + Vector3.new(0, 1.5, 0))).Magnitude
                u40:GiveTask(function() --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u19
                        [3] = u9
                        [4] = u51
                        [5] = u50
                    --]]
                    u15.LocalPlayer.CameraMinZoomDistance = 6
                    u15.LocalPlayer.CameraMaxZoomDistance = 6
                    task.spawn(function() --[[ Line: 77 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u9
                            [3] = u15
                            [4] = u51
                            [5] = u50
                        --]]
                        u19(0.3, u9, function(p52) --[[ Line: 78 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                                [2] = u51
                            --]]
                            u15.LocalPlayer.CameraMinZoomDistance = p52 * u51 + (1 - p52) * 6
                            u15.LocalPlayer.CameraMaxZoomDistance = p52 * u51 + (1 - p52) * 6
                        end):Wait()
                        u15.LocalPlayer.CameraMinZoomDistance = u50.Min
                        u15.LocalPlayer.CameraMaxZoomDistance = u50.Max
                    end)
                end)
                u16:BindToRenderStep("SnakeShrineCameraPosition", Enum.RenderPriority.Camera.Value + 2, function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u49
                        [3] = u40
                        [4] = u17
                        [5] = u48
                        [6] = u27
                    --]]
                    if not (u42.PrimaryPart and u49.Parent) then
                        return u40:DoCleaning()
                    end
                    u17.MouseBehavior = Enum.MouseBehavior.Default
                    local v53 = u48
                    local v54 = u42.PrimaryPart
                    if v54 ~= nil then
                        v54 = v54.Position
                    end
                    local v55 = v53 - v54
                    local v56 = v55:Cross(Vector3.new(0, 1, 0)).Unit
                    local v57 = u42.PrimaryPart.Position
                    local v58 = v55.Unit * 1.5
                    local v59 = v56 * 6
                    local v60 = v57 - v58 + v59
                    local v61 = u27.SnakeShrineInstance.Position.Y
                    local v62 = Vector3.new(0, v61, 0)
                    local v63 = v60 * Vector3.new(1, 0, 1) + (v62 + Vector3.new(0, 4, 0))
                    local v64 = u27.SnakeShrineInstance.Position
                    u49.CFrame = CFrame.new(v63, v64 + Vector3.new(0, 1, 0))
                end)
                u40:GiveTask(function() --[[ Line: 115 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    return u16:UnbindFromRenderStep("SnakeShrineCameraPosition")
                end)
            end
        end
        local u65 = u27.SnakeShrineInstance:FindFirstChildWhichIsA("ProximityPrompt")
        u65 = u65
        local v66
        if u65 == nil then
            v66 = u65
        else
            v66 = u65.Enabled
        end
        if v66 then
            u65.Enabled = false
            u40:GiveTask(function() --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u65
                --]]
                u65.Enabled = true
                return u65.Enabled
            end)
        end
        u16:BindToRenderStep("SnakeShrineFirstPerson", Enum.RenderPriority.Character.Value + 1, function() --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u17
            --]]
            local v67 = u15.LocalPlayer.Character
            local v68
            if v67 == nil then
                v68 = v67
            else
                v68 = v67.PrimaryPart
            end
            if not v68 then
                return nil
            end
            u17.MouseBehavior = Enum.MouseBehavior.Default
            for v69, v70 in v67:GetDescendants() do
                local _ = v69 - 1
                if v70:IsA("BasePart") then
                    v70.LocalTransparencyModifier = 0
                end
            end
        end)
        u40:GiveTask(function() --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            return u16:UnbindFromRenderStep("SnakeShrineFirstPerson")
        end)
        task.delay(0.1, function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u41
                [3] = u40
                [4] = u2
                [5] = u21
            --]]
            local v71 = u42
            if v71 ~= nil then
                v71 = v71:FindFirstChildWhichIsA("Humanoid")
            end
            if u41 and v71 then
                u40:GiveTask(v71:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 165 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u21
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.SNAKE_SHRINE)
                end))
            end
        end)
        task.delay(0.1, function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u41
                [3] = u2
                [4] = u21
            --]]
            local v72 = u42
            if v72 ~= nil then
                v72 = v72.PrimaryPart
                if v72 ~= nil then
                    v72 = v72.Position
                end
            end
            if not v72 then
                return nil
            end
            while true do
                local v73 = task.wait(0.05)
                if v73 ~= 0 and (v73 == v73 and v73) then
                    v73 = u41
                end
                if v73 == 0 or (v73 ~= v73 or not v73) then
                    return
                end
                local v74 = u42.PrimaryPart
                if v74 ~= nil then
                    v74 = v74.Position
                end
                if not v74 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.SNAKE_SHRINE)
                    return nil
                end
                if ((v74 - v72) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.SNAKE_SHRINE)
                    return nil
                end
            end
        end)
        local u77 = u20.changed:connect(function(p75, _) --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u22
                [3] = u37
            --]]
            local v76 = u32
            if v76 ~= "" and v76 then
                v76 = p75.Bedwars.teamBedStatus[u32] == u22.BedStatus.BED_BROKEN
            end
            if v76 ~= "" and v76 then
                u37(true)
            end
        end)
        u40:GiveTask(function() --[[ Line: 216 ]]
            --[[
            Upvalues:
                [1] = u77
            --]]
            return u77:disconnect()
        end)
        return function() --[[ Line: 219 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:DoCleaning()
        end
    end, {})
    local v78 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = not u7.isSmallScreen()
    }
    local v79 = { u11.createElement(u6, {
            ["BackgroundTransparency"] = 0.9,
            ["AppId"] = u27.AppId
        }) }
    local v80 = #v79
    local v81 = {}
    local v82 = u11.createElement
    local v83 = "UIPadding"
    local v84 = {}
    local v85
    if v31 then
        v85 = UDim.new(0.05)
    else
        v85 = UDim.new(0.15)
    end
    v84.PaddingLeft = v85
    local v86
    if v31 then
        v86 = UDim.new(0.05)
    else
        v86 = UDim.new(0.15)
    end
    v84.PaddingRight = v86
    v84.PaddingTop = UDim.new(0.1)
    v84.PaddingBottom = UDim.new(0.1)
    __set_list(v81, 1, {v82(v83, v84), u11.createElement("UIListLayout", {
    ["FillDirection"] = Enum.FillDirection.Horizontal,
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
    ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceBetween
})})
    local v87 = #v81
    local v88 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 0,
        ["AnchorPoint"] = Vector2.new(0, 0)
    }
    local v89
    if v31 then
        v89 = UDim2.fromScale(0.03, 0.4)
    else
        v89 = UDim2.fromScale(0.2, 0.25)
    end
    v88.Position = v89
    v88.Size = UDim2.fromScale(0.2, 1)
    local v90 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }), u11.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["Text"] = "SELECT A BUFF",
            ["TextStrokeTransparency"] = 0,
            ["LayoutOrder"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextColor3"] = u5.WHITE,
            ["TextSize"] = v31 and 14 or 18,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
        }) }
    local v91 = #v90
    local v92 = 0
    local v93 = {}
    for v94, v95 in u24 do
        local _ = v94 - 1
        if not (u23[v95].disableOnBedBreak and v36) == true then
            v92 = v92 + 1
            v93[v92] = v95
        end
    end
    local v96 = table.create(#v93)
    for v97, v98 in v93 do
        local _ = v97 - 1
        v96[v97] = u11.createElement(u26, {
            ["SelectedBuff"] = v33,
            ["TeamBuffType"] = v98,
            ["OnClickedBuff"] = v39
        })
    end
    local v99 = {
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 1,
            ["ScrollBarImageTransparency"] = 0.15,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
        }
    }
    local v100 = { u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 2),
            ["PaddingLeft"] = UDim.new(0, 2),
            ["PaddingRight"] = UDim.new(0, 12)
        }), u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 6)
        }) }
    local v101 = #v100
    for v102, v103 in v96 do
        v100[v101 + v102] = v103
    end
    v90[v91 + 1] = u11.createElement(u4, v99, v100)
    v81.TeamBuffList = u11.createElement("Frame", v88, v90)
    v81[v87 + 1] = u11.createElement(u25, {
        ["SelectedTeamBuff"] = v33,
        ["FrameProps"] = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 0.4)
        }
    })
    v79[v80 + 1] = u11.createElement(u8, {}, v81)
    return u11.createFragment({
        ["SnakeShrineApp"] = u11.createElement("ScreenGui", v78, v79)
    })
end)
return {
    ["SnakeShrineApp"] = v13.connect(function(p105, p106) --[[ Line: 350 ]]
        local v107 = {}
        for v108, v109 in p106 do
            v107[v108] = v109
        end
        v107.ObservedInventory = p105.Inventory.observedInventory
        return v107
    end)(v104)
}