local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CollectionTagAdded
local u5 = v3.ColorUtil
local u6 = v3.ConstraintType
local u7 = v3.DeviceUtil
local u8 = v3.GameQueryUtil
local u9 = v3.GameTheme
local u10 = v3.IndicatorUIType
local u11 = v3.SoundManager
local u12 = v3.StringUtil
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u14 = v13.KnitClient
local u15 = v13.KnitClient
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u21 = v20.CollectionService
local u22 = v20.Players
local u23 = v20.ReplicatedStorage
local u24 = v20.RunService
local u25 = v20.TweenService
local u26 = v20.Workspace
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u28 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "ping", "ui", "ping-gui-object").PingGuiObject
local u29 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u30 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u39 = v1.import(script, script.Parent, "ui", "flag-capture-ui").ScoreBoardWrapper
local u40 = v1.import(script, script.Parent, "ui", "flag-timer-app").FlagTimerApp
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "FlagCaptureController"
    end,
    ["__index"] = u29
})
u41.__index = u41
function u41.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u17
    --]]
    u29.constructor(p44)
    p44.Name = "FlagCaptureController"
    p44.rayMap = {}
    p44.flagMap = {}
    p44.flagLocation = {}
    p44.cooldown = 0
    p44.flagBaseCooldown = 0
    p44.slowMaid = u17.new()
    p44.teamPosition = 0
end
function u41.KnitStart(u45) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u17
        [3] = u36
        [4] = u30
        [5] = u35
        [6] = u31
        [7] = u19
        [8] = u39
        [9] = u22
        [10] = u27
        [11] = u16
        [12] = u34
        [13] = u11
        [14] = u9
        [15] = u37
        [16] = u14
        [17] = u24
        [18] = u4
        [19] = u40
        [20] = u18
        [21] = u38
        [22] = u7
        [23] = u21
    --]]
    u29.KnitStart(u45)
    local u46 = u17.new()
    u36.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p47, _, _) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u35
            [3] = u31
            [4] = u19
            [5] = u39
            [6] = u22
            [7] = u46
        --]]
        local v48 = u30:getState().Game.queueType
        if p47 == u35.RUNNING and v48 == u31.FLAG_CAPTURE then
            local u49 = u19.mount(u39(), u22.LocalPlayer:WaitForChild("PlayerGui"))
            u46:GiveTask(function() --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u49
                --]]
                u19.unmount(u49)
            end)
        end
        if p47 == u35.POST then
            u46:DoCleaning()
        end
    end)
    u27.StartLaunchProjectile:setPriority(u16.HIGHEST):connect(function(p50) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if p50:isCancelled() then
            return nil
        end
        if p50.projectileType ~= "telepearl" then
            return nil
        end
        if u22.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil
        end
        p50:setCancelled(true)
    end)
    u27.BeginProjectileTargeting:setPriority(u16.HIGHEST):connect(function(p51) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u22
            [3] = u11
            [4] = u9
        --]]
        if p51:isCancelled() then
            return nil
        end
        if p51.handItem.itemType ~= u34.TELEPEARL then
            return nil
        end
        if u22.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil
        end
        u11:playSound(u9.sound.uiDisabled)
        p51:setCancelled(true)
    end)
    u27.ZiplineMount:setPriority(u16.HIGHEST):connect(function(p52) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u11
            [3] = u9
        --]]
        if p52:isCancelled() then
            return nil
        end
        if u22.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil
        end
        u11:playSound(u9.sound.uiDisabled)
        p52:setCancelled(true)
    end)
    u36.Client:Get("PlayerCaptureFlag"):Connect(function(p53) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u22
        --]]
        u45:addSlow(p53.player)
        local v54 = u45:createRay(p53.player, p53.neutral)
        if p53.player ~= u22.LocalPlayer then
            u45:createIndicatorOnPlayer(p53.player, v54)
        end
    end)
    u36.Client:Get("FlagHolderRemove"):Connect(function(p55) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:removeSlow(p55.player)
        local v56 = u45.rayMap[p55.player]
        if v56 then
            v56:Destroy()
            u45.rayMap[p55.player] = nil
        end
        local v57 = u45.flagMap[p55.player]
        if v57 then
            v57:Destroy()
            u45.flagMap[p55.player] = nil
        end
    end)
    u36.Client:Get("FlagHolderUpdate"):Connect(function(p58) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u37
        --]]
        if not p58.teamFlag then
            u11:playSound(u37.FLAG_CAPTURE)
        end
    end)
    u22.LocalPlayer:GetAttributeChangedSignal("FlagHolder"):Connect(function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u14
        --]]
        local v59 = u22.LocalPlayer:GetAttribute("FlagHolder")
        if v59 == 0 or (v59 ~= v59 or (v59 == "" or not v59)) then
            u14.Controllers.WormholeController:enableWormholeAbility()
        else
            u14.Controllers.WormholeController:disableWormHoleAbility()
        end
    end)
    u24.Heartbeat:Connect(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        for v60, v61 in u45.rayMap do
            local v62 = v60.Character
            if v62 ~= nil then
                v62 = v62.PrimaryPart
            end
            if not v62 then
                v61:Destroy()
            end
            local v63
            if v61 then
                if v60 == nil then
                    v63 = v60
                else
                    v63 = v60.Character
                end
            else
                v63 = v61
            end
            if v63 then
                v61.Position = v60.Character:GetPrimaryPartCFrame().Position
            end
        end
        local v64 = u45.flagMap
        local function v72(p65, p66) --[[ Line: 187 ]]
            local v67 = p66.Character
            if v67 ~= nil then
                v67 = v67.PrimaryPart
            end
            if not v67 then
                p65:Destroy()
            end
            local v68
            if p65 then
                if p66 == nil then
                    v68 = p66
                else
                    v68 = p66.Character
                end
            else
                v68 = p65
            end
            if v68 then
                local v69 = p66.Character
                if v69 ~= nil then
                    local v70 = v69:GetPrimaryPartCFrame()
                    local v71 = CFrame.Angles(0, 1.5707963267948966, 0)
                    v69 = (v70 + Vector3.new(0, 8, 0)) * v71
                end
                p65:PivotTo(v69)
            end
        end
        for v73, v74 in v64 do
            v72(v74, v73, v64)
        end
    end)
    u4("flag", function(u75) --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u22
            [3] = u19
            [4] = u40
            [5] = u18
            [6] = u38
            [7] = u7
            [8] = u36
            [9] = u24
            [10] = u45
        --]]
        local v76 = u75:GetAttribute("Team")
        local v77 = u14.Controllers.TeamController:getPlayerTeam(u22.LocalPlayer)
        if v77 ~= nil then
            v77 = v77.id
        end
        local v78 = u75:GetAttribute("OriginalPosition")
        if v78 == 0 or v78 ~= v78 then
            v78 = false
        elseif v78 == "" then
            v78 = false
        end
        local v79 = not v78
        if v79 then
            v79 = v76 ~= "Neutral"
        end
        if v79 then
            local u80 = os.time()
            local u81 = u80 + 10 - os.time()
            local v82 = u19.mount
            local v83 = u19.createElement
            local v84 = {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 5.5, 0),
                ["MaxDistance"] = 110,
                ["ExtentsOffset"] = Vector3.new(0, 0, 2),
                ["Size"] = UDim2.fromScale(4.5, 1)
            }
            local v85 = {}
            local v86 = {
                ["Countdown"] = u81
            }
            __set_list(v85, 1, {u19.createElement(u40, v86)})
            local u87 = v82(v83("BillboardGui", v84, v85), u75)
            task.spawn(function() --[[ Line: 244 ]]
                --[[
                Upvalues:
                    [1] = u81
                    [2] = u80
                    [3] = u19
                    [4] = u87
                    [5] = u40
                --]]
                while true do
                    local v88 = task.wait(0.2)
                    if v88 == 0 or (v88 ~= v88 or not v88) then
                        break
                    end
                    if u81 <= 0 then
                        return nil
                    end
                    local v89 = u80 + 10 - os.time()
                    local v90 = math.round(v89)
                    local v91 = math.max(0, v90)
                    if u81 ~= v91 then
                        u81 = v91
                        local v92 = u19.update
                        local v93 = u87
                        local v94 = u19.createElement
                        local v95 = {
                            ["StudsOffsetWorldSpace"] = Vector3.new(0, 5.5, 0),
                            ["MaxDistance"] = 110,
                            ["ExtentsOffset"] = Vector3.new(0, 0, 2),
                            ["Size"] = UDim2.fromScale(4.5, 1)
                        }
                        local v96 = {}
                        local v97 = {
                            ["Countdown"] = u81
                        }
                        __set_list(v96, 1, {u19.createElement(u40, v97)})
                        v92(v93, v94("BillboardGui", v95, v96))
                    end
                end
            end)
        end
        if v76 == v77 then
            local v98 = u75:GetAttribute("OriginalPosition")
            if v98 == 0 or (v98 ~= v98 or (v98 == "" or not v98)) then
                u18("ProximityPrompt", {
                    ["ActionText"] = "Return Flag",
                    ["RequiresLineOfSight"] = false,
                    ["MaxActivationDistance"] = 6,
                    ["HoldDuration"] = 1.5,
                    ["Parent"] = u75,
                    ["KeyboardKeyCode"] = u38.promptKeyboardKey,
                    ["ClickablePrompt"] = u7.isMobileControls()
                }).PromptButtonHoldEnded:Connect(function() --[[ Line: 283 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u75
                    --]]
                    local v99 = {
                        ["flag"] = u75
                    }
                    u36.Client:Get("PlayerReturnFlag"):SendToServer(v99)
                end)
            end
        end
        local u102 = u24.Heartbeat:Connect(function(_) --[[ Line: 303 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u75
                [3] = u45
                [4] = u36
            --]]
            local v100 = u22.LocalPlayer.Character
            if v100 ~= nil then
                v100 = v100.PrimaryPart
                if v100 ~= nil then
                    v100 = v100.Position
                end
            end
            if not v100 then
                return nil
            end
            if (v100 - u75.Position).Magnitude < 10 then
                if tick() < u45.cooldown then
                    return nil
                end
                u45.cooldown = tick() + 0.2
                local v101 = {
                    ["block"] = u75
                }
                u36.Client:Get("TouchedBlock"):SendToServer(v101)
            end
        end)
        u75.Destroying:Connect(function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u102
            --]]
            u102:Disconnect()
        end)
        if u45.flagLocation[u75] == nil then
            u45.flagLocation[u75] = u75.Position
        end
        u45:createIndicatorOnFlag(u75)
    end)
    u4("FlagBase", function(u103) --[[ Line: 342 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u45
            [3] = u24
            [4] = u36
        --]]
        local u104 = u103:GetAttribute("TeamName")
        local v105
        if u104 == "" or not u104 then
            v105 = u104
        else
            local v106 = u22.LocalPlayer.Team
            if v106 ~= nil then
                v106 = v106.Name
            end
            v105 = u104 == v106
        end
        if v105 == "" or not v105 then
            if u104 ~= "" and u104 then
                u45.enemyFlagOrigin = u103.Position
            end
        else
            u45.teamFlagOrigin = u103.Position
        end
        local u111 = u24.Heartbeat:Connect(function(_) --[[ Line: 357 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u103
                [3] = u104
                [4] = u45
                [5] = u36
            --]]
            local v107 = u22.LocalPlayer.Character
            if v107 ~= nil then
                v107 = v107.PrimaryPart
                if v107 ~= nil then
                    v107 = v107.Position
                end
            end
            if not v107 then
                return nil
            end
            if (v107 - u103.Position).Magnitude < 10 then
                local v108 = u104
                if v108 ~= "" and v108 then
                    local v109 = u22.LocalPlayer.Team
                    if v109 ~= nil then
                        v109 = v109.Name
                    end
                    v108 = u104 == v109
                end
                if v108 ~= "" and v108 then
                    if tick() < u45.flagBaseCooldown then
                        return nil
                    end
                    u45.flagBaseCooldown = tick() + 0.2
                    local v110 = {
                        ["part"] = u103
                    }
                    u36.Client:Get("FlagDeliver"):SendToServer(v110)
                end
            end
        end)
        u103.Destroying:Connect(function() --[[ Line: 391 ]]
            --[[
            Upvalues:
                [1] = u111
            --]]
            u111:Disconnect()
        end)
    end)
    u21:GetInstanceRemovedSignal("flag"):Connect(function(p112) --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.flagLocation[p112] = nil
    end)
end
function u41.createRay(p113, p114, p115) --[[ Line: 401 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u26
        [3] = u18
        [4] = u23
        [5] = u8
    --]]
    Color3.fromRGB(230, 255, 0)
    local v116
    if p114.Team == u22.LocalPlayer.Team then
        v116 = Color3.fromRGB(0, 255, 13)
    else
        v116 = Color3.fromRGB(255, 0, 0)
    end
    local v117 = {
        ["Parent"] = u26
    }
    local v118 = p114.Character
    if v118 ~= nil then
        v118 = v118:GetPrimaryPartCFrame()
    end
    v117.CFrame = v118
    v117.Shape = Enum.PartType.Cylinder
    v117.Color = v116
    v117.Material = Enum.Material.ForceField
    v117.CastShadow = false
    v117.Size = Vector3.new(1200, 4, 4)
    v117.Orientation = Vector3.new(0, 0, 90)
    v117.Transparency = 0.25
    v117.Anchored = true
    v117.CanCollide = false
    v117.CanQuery = false
    v117.CanTouch = false
    local v119 = u18("Part", v117)
    local v120 = p114.Character
    if v120 ~= nil then
        v120 = v120:GetPrimaryPartCFrame()
    end
    if v120 then
        local v121 = u23.Assets.Effects.Flag:Clone()
        v121.Parent = u26
        local v122 = v121:WaitForChild("TeamIndicator1", 3)
        local v123 = v121:WaitForChild("TeamIndicator2", 3)
        local v124 = p114.Team
        if v124 ~= nil then
            v124 = v124.Name
        end
        local v125
        if v124 == "Blue" then
            v125 = Color3.fromRGB(230, 255, 0)
        else
            v125 = Color3.fromRGB(0, 120, 255)
        end
        if p115 then
            v125 = Color3.fromRGB(204, 0, 255)
        end
        v122.Color = v125
        v123.Color = v125
        local v126 = p114.Character
        if v126 ~= nil then
            v126 = v126:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)
        end
        v121:PivotTo(v126)
        if p115 then
            v121:SetAttribute("Neutral", true)
        end
        p113.flagMap[p114] = v121
        u8:setQueryIgnored(v121, true)
    end
    u8:setQueryIgnored(v119, true)
    p113.rayMap[p114] = v119
    return v119
end
function u41.addSlow(p127, p128) --[[ Line: 474 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u15
    --]]
    if p128 == u22.LocalPlayer then
        p127.slowMaid:GiveTask(u15.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = 0.8
        }))
    end
end
function u41.removeSlow(p129, p130) --[[ Line: 481 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p130 == u22.LocalPlayer then
        p129.slowMaid:DoCleaning()
    end
end
function u41.createIndicator(_, p131, p132) --[[ Line: 486 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u12
        [3] = u2
        [4] = u10
        [5] = u28
        [6] = u25
        [7] = u6
    --]]
    local function v139(p133, _, _, p134, p135) --[[ Line: 487 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u12
        --]]
        local v136 = p134:FindFirstChild("Container")
        if v136 ~= nil then
            v136 = v136:FindFirstChild("PingCreatorAvatar")
        end
        if v136 and p135 then
            local v137 = u22
            if p135 ~= nil then
                p135 = p135.UserId
            end
            v136.Image = v137:GetUserThumbnailAsync(p135, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
        end
        local v138 = p134:FindFirstChild("Container")
        if v138 ~= nil then
            v138 = v138:FindFirstChild("DistanceTracker")
        end
        if v138 then
            v138.Text = "<b>" .. u12.roundNumber(p133 / 3, 0) .. "m</b>"
        end
    end
    local v140 = u2.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
    local v147 = {
        ["creator"] = nil,
        ["uiType"] = u10.Custom,
        ["uiConfig"] = {
            ["distanceRelativeToPlayer"] = true,
            ["scaleWithAlpha"] = false,
            ["scaleOnFade"] = false,
            ["easeOutOnAppoach"] = false,
            ["color3"] = p132.color,
            ["template"] = u28(p132.icon, p132.color),
            ["transparency"] = function(p141, _, _) --[[ Name: transparency, Line 515 ]]
                for v142, v143 in p141:GetDescendants() do
                    local _ = v142 - 1
                    if v143:IsA("TextLabel") then
                        v143.TextTransparency = 0
                    end
                    if v143:IsA("UIStroke") then
                        v143.Transparency = 0
                    end
                    if v143:IsA("ImageLabel") then
                        v143.ImageTransparency = 0
                    end
                end
                return 0
            end,
            ["onEnterAnimation"] = function(p144) --[[ Name: onEnterAnimation, Line 538 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                local u145 = p144:FindFirstChild("PingIcon")
                if u145 ~= nil then
                    u145 = u145:Clone()
                end
                if not u145 then
                    return nil
                end
                u145.Parent = p144
                local u146 = u25:Create(u145, TweenInfo.new(0.15), {
                    ["ImageTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1.5, 1.5)
                })
                u146:Play()
                u146.Completed:Connect(function() --[[ Line: 553 ]]
                    --[[
                    Upvalues:
                        [1] = u146
                        [2] = u145
                    --]]
                    u146:Destroy()
                    u145:Destroy()
                end)
            end
        },
        ["attachTo"] = p131,
        ["constraintType"] = u6.Constrained,
        ["onUpdateProperties"] = v139
    }
    v140:addIndicator(v147)
end
function u41.createIndicatorOnPlayer(p148, p149, p150) --[[ Line: 565 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u5
        [3] = u32
        [4] = u22
    --]]
    local v151 = u33.FLAG_ICON
    local v152 = p149.Team
    if v152 ~= nil then
        local _ = v152.TeamColor.Color
    end
    local v153 = p149.Team
    if v153 ~= nil then
        v153 = v153.TeamColor.Color
    end
    if v153 == nil then
        v153 = Color3.fromRGB(166, 255, 107)
    end
    local v154 = p149.Team
    if v154 ~= nil then
        v154 = v154.Name
    end
    local v155
    if v154 == "Blue" then
        v155 = u5.hexColor(u32.yellow)
    else
        v155 = u5.hexColor(u32.lightBlue)
    end
    if p149.Team ~= u22.LocalPlayer.Team then
        v155 = Color3.fromRGB(255, 148, 148)
    end
    p148:createIndicator(p150, {
        ["color"] = v155,
        ["icon"] = v151
    })
end
function u41.createIndicatorOnFlag(p156, p157) --[[ Line: 600 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u33
        [3] = u22
    --]]
    local v158 = p157:GetAttribute("OriginalPosition")
    if v158 ~= 0 and (v158 == v158 and (v158 ~= "" and v158)) then
        v158 = p157:GetAttribute("Team") ~= "Neutral"
    end
    if v158 ~= 0 and (v158 == v158 and (v158 ~= "" and v158)) then
        return nil
    end
    local v159 = p157:GetAttribute("Team")
    local v160 = u14.Controllers.TeamController:getTeamById(v159)
    local v161 = u33.FLAG_ICON
    if v160 ~= nil then
        v160 = v160.color
    end
    if v160 == nil then
        v160 = Color3.fromRGB(173, 255, 209)
    end
    local v162 = u14.Controllers.TeamController:getPlayerTeam(u22.LocalPlayer)
    if v162 ~= nil then
        v162 = v162.id
    end
    if v159 == v162 then
        v160 = Color3.fromRGB(255, 115, 115)
    end
    if p157:GetAttribute("Team") == "Neutral" then
        v160 = Color3.fromRGB(227, 115, 255)
    end
    p156:createIndicator(p157, {
        ["color"] = v160,
        ["icon"] = v161
    })
end
function u41.getFlagReturnTime(_, p163) --[[ Line: 637 ]]
    local v164 = p163 + 5 - os.time()
    return math.max(0, v164)
end
function u41.getFlagPositions(u165) --[[ Line: 640 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
        [3] = u14
    --]]
    local v166 = 0
    local v167 = 1
    local v168 = nil
    if not (u165.enemyFlagOrigin and u165.teamFlagOrigin) then
        print("CATCHING!")
        local v169 = print
        local v170 = u165.enemyFlagOrigin
        v169("Enemy Origin: " .. tostring(v170))
        local v171 = print
        local v172 = u165.teamFlagOrigin
        v171("TEAM ORIGIN: " .. tostring(v172))
        local v173 = u21:GetTagged("FlagBase")
        local function v179(p174) --[[ Line: 649 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u165
            --]]
            local v175 = p174:GetAttribute("TeamName")
            local v176 = u22.LocalPlayer.Team
            if v176 ~= nil then
                v176 = v176.Name
            end
            print("Team Name: " .. tostring(v176))
            local v177
            if v175 == "" or not v175 then
                v177 = v175
            else
                local v178 = u22.LocalPlayer.Team
                if v178 ~= nil then
                    v178 = v178.Name
                end
                v177 = v175 == v178
            end
            if v177 == "" or not v177 then
                if v175 ~= "" and v175 then
                    u165.enemyFlagOrigin = p174.Position
                end
            else
                u165.teamFlagOrigin = p174.Position
            end
        end
        for v180, v181 in v173 do
            v179(v181, v180 - 1, v173)
        end
        if not (u165.enemyFlagOrigin and u165.teamFlagOrigin) then
            return {
                ["team"] = v166,
                ["enemy"] = v167,
                ["neutralFlag"] = v168
            }
        end
    end
    for v182, v183 in u165.flagMap do
        local v184 = { v182, v183 }
        local v185 = v184[1].Character
        if v185 ~= nil then
            v185 = v185.PrimaryPart
            if v185 ~= nil then
                v185 = v185.Position
            end
        end
        if v185 then
            local v186 = (u165.teamFlagOrigin - v185).Magnitude
            local v187 = v186 / (v186 + (u165.enemyFlagOrigin - v185).Magnitude)
            local v188 = v184[1].Team == u22.LocalPlayer.Team
            if v188 then
                local v189 = v184[2]:GetAttribute("Neutral")
                if v189 == 0 or v189 ~= v189 then
                    v189 = false
                elseif v189 == "" then
                    v189 = false
                end
                v188 = not v189
            end
            if v188 then
                v167 = v187
            else
                local v190 = v184[2]:GetAttribute("Neutral")
                if v190 == 0 or (v190 ~= v190 or (v190 == "" or not v190)) then
                    v166 = v187
                else
                    v168 = v187
                end
            end
        end
    end
    for v191, v192 in u165.flagLocation do
        local v193 = { v191, v192 }
        local v194 = v193[1]:GetAttribute("OriginalPosition")
        if v194 == 0 or (v194 ~= v194 or (v194 == "" or not v194)) then
            local v195 = (u165.teamFlagOrigin - v193[2]).Magnitude
            local v196 = v195 / (v195 + (u165.enemyFlagOrigin - v193[2]).Magnitude)
            local v197 = v193[1]:GetAttribute("Team")
            local v198 = u14.Controllers.TeamController:getPlayerTeam(u22.LocalPlayer)
            if v198 ~= nil then
                v198 = v198.id
            end
            if v197 == "Neutral" then
                v168 = v196
            else
                local v199
                if v197 == "" or not v197 then
                    v199 = v197
                else
                    v199 = v197 == v198
                end
                if v199 == "" or not v199 then
                    if v197 ~= "" and v197 then
                        v167 = v196
                    end
                else
                    v166 = v196
                end
            end
        elseif v193[1]:GetAttribute("Team") == "Neutral" then
            v168 = 0.5
        end
    end
    return {
        ["team"] = v166,
        ["enemy"] = v167,
        ["neutralFlag"] = v168
    }
end
u14.CreateController(u41.new())
return nil