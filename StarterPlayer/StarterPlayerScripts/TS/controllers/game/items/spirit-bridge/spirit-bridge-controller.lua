local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.ExpireList
local u7 = v4.ExpireMap
local u8 = v4.SoundManager
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.TweenService
local u18 = v14.Workspace
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ignis", "ignis-util").IgnisUtil
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = u1.import(script, script.Parent, "spirit-bridge-progress-bar").SpiritBridgeProgressApp
local u31 = u23.SPIRIT_BRIDGE_DURATION
local _ = u23.SPIRIT_BRIDGE_MOVEMENT_SPEED_MULTIPLIER
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "SpiritBridgeController"
    end,
    ["__index"] = u20
})
u32.__index = u32
function u32.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u6
        [3] = u7
        [4] = u31
    --]]
    u20.constructor(p35)
    p35.Name = "SpiritBridgeController"
    p35.recentlyTouchedBridge = u6.new(0.1)
    p35.activeBridgeWalkerMap = u7.new(u31)
    p35.recentHealAttempts = u6.new(0.1)
    p35.bridgeSegmentInfo = {}
end
function u32.KnitStart(u36) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u28
        [3] = u15
        [4] = u8
        [5] = u29
        [6] = u26
    --]]
    u20.KnitStart(u36)
    u28.Client:Get("RequestSpiritBridgeDownload"):SendToServer()
    u28.Client:OnEvent("SpiritBridgeCreate", function(p37) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u8
            [3] = u29
            [4] = u36
        --]]
        for _, v38 in p37.newBridgeInfo do
            if v38.creator == u15.LocalPlayer and v38.destinationLocation then
                u8:playSound(u29.SPIRIT_BRIDGE_PROJECTILE_LAND, {
                    ["position"] = v38.destinationLocation
                })
            end
            u36:createBridge(v38.creator, v38.bridge, v38.destinationLocation)
        end
    end)
    u28.Client:OnEvent("SpiritBridgeExit", function(p39) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local v40 = u36.activeBridgeWalkerMap:get(p39.player)
        if v40 ~= nil then
            v40 = v40.bridge.id
        end
        if v40 ~= p39.bridgeId then
            return nil
        end
        u36:cleanBridgeWalker(p39.player)
    end)
    u28.Client:Get("EntityDeathEvent"):Connect(function(p41) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u36
        --]]
        local v42 = u15:GetPlayerFromCharacter(p41.entityInstance)
        if not v42 then
            return nil
        end
        u36:cleanBridgeWalker(v42)
    end)
    u28.Client:Get("EnteredSpiritBridge"):Connect(function(p43, p44) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u36
        --]]
        local v45 = u26:getEntity(p44)
        if not v45 then
            return nil
        end
        local v46 = u36.activeBridgeWalkerMap:get(p44)
        if v46 ~= nil then
            v46 = v46.maid
        end
        if not v46 then
            return nil
        end
        local v47 = u36.activeBridgeWalkerMap:get(p44)
        if v47 ~= nil then
            v47 = v47.bridge.id
        end
        if p43 ~= v47 then
            return nil
        end
        u36:enterSpiritForm(v45:getInstance(), p44, p43, v46)
    end)
    u28.Client:OnEvent("SpiritArmorCast", function(p48) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u8
            [3] = u29
        --]]
        local v49 = u36.activeBridgeWalkerMap:get(p48.spiritPlayer)
        local v50
        if v49 == nil then
            v50 = v49
        else
            v50 = v49.bridge.id
        end
        if v50 == p48.bridgeId then
            v49.maid:DoCleaning()
            u36.activeBridgeWalkerMap:delete(p48.spiritPlayer)
        end
        local v51 = p48.spiritPlayer.Character
        if v51 ~= nil then
            v51 = v51.PrimaryPart
            if v51 ~= nil then
                v51 = v51.Position
            end
        end
        u8:playSound(u29.SPIRIT_BRIDGE_AOE_ACTIVATED, {
            ["rollOffMaxDistance"] = 70,
            ["looped"] = false,
            ["volumeMultiplier"] = 0.5,
            ["position"] = v51,
            ["parent"] = p48.spiritPlayer
        })
    end)
end
function u32.createBridge(u52, u53, u54, p55) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u23
        [4] = u26
        [5] = u1
        [6] = u25
        [7] = u28
        [8] = u16
        [9] = u18
        [10] = u13
        [11] = u24
        [12] = u8
        [13] = u29
        [14] = u27
        [15] = u3
        [16] = u31
    --]]
    local u56 = u53 == u15.LocalPlayer
    local v57 = u53.Character
    if v57 ~= nil then
        v57 = v57.PrimaryPart
        if v57 ~= nil then
            v57 = v57.CFrame.Position
        end
    end
    if v57 == nil then
        return nil
    end
    local u58 = {}
    local v59 = u10.new()
    local u60 = true
    local u61 = nil
    v59:GiveTask(function() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u61
            [3] = u58
            [4] = u60
        --]]
        for v62, v63 in u58 do
            local _ = v62 - 1
            u52:destroySpiritBridge(v63, u61)
        end
        table.clear(u58)
        u60 = false
    end)
    if u52.activeBridgeWalkerMap:get(u53) ~= nil then
        u52:cleanBridgeWalker(u53)
    end
    local v64 = u10.new()
    v59:GiveTask(v64)
    u52.activeBridgeWalkerMap:set(u53, {
        ["maid"] = v59,
        ["bridge"] = u54
    })
    u61 = u23.SPIRIT_ARMOR_DELAY
    local u65 = u60
    local v66 = u61
    local u67 = 0
    local v68 = false
    local u69 = {}
    while true do
        if v68 then
            u67 = u67 + 1
        else
            v68 = true
        end
        if u67 >= #u54.bridgeSegments or not u65 then
            if p55 then
                local v70 = u16.Assets:FindFirstChild("Projectiles")
                if v70 ~= nil then
                    v70 = v70:FindFirstChild("spirit_bridge")
                    if v70 ~= nil then
                        v70 = v70:Clone()
                    end
                end
                if v70 ~= nil then
                    local v71 = v70.PrimaryPart
                end
                if v70 and v71 then
                    v70.Parent = u18
                    v71.Anchored = true
                    v71.CanCollide = false
                    v71.CanQuery = false
                    u13(v70, 2)
                    local v72 = CFrame
                    local v73 = u24 * 2
                    local v74 = Vector3.new(0, v73, 0)
                    v70:PivotTo(v72.lookAt(p55 + v74, u58[1]:GetPivot().Position))
                    local u75 = u8:playSound(u29.SPIRIT_BRIDGE_LOOP, {
                        ["volumeMultiplier"] = 1,
                        ["rollOffMaxDistance"] = 80,
                        ["looped"] = true,
                        ["position"] = p55,
                        ["parent"] = v70
                    })
                    v59:GiveTask(function() --[[ Line: 265 ]]
                        --[[
                        Upvalues:
                            [1] = u75
                        --]]
                        local v76 = u75
                        if v76 ~= nil then
                            v76:Stop()
                        end
                        local v77 = u75
                        if v77 ~= nil then
                            v77:Destroy()
                        end
                    end)
                    v59:GiveTask(v70)
                end
            end
            task.spawn(function() --[[ Line: 279 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u65
                    [3] = u53
                    [4] = u27
                    [5] = u54
                    [6] = u69
                    [7] = u52
                    [8] = u3
                --]]
                if u56 then
                    return nil
                end
                local v78 = {}
                while true do
                    local v79 = task.wait(0.2)
                    if v79 ~= 0 and (v79 == v79 and v79) then
                        v79 = u65
                    end
                    if v79 == 0 or (v79 ~= v79 or not v79) then
                        return
                    end
                    local v80 = u53.Character
                    if v80 ~= nil then
                        v80 = v80.PrimaryPart
                        if v80 ~= nil then
                            v80 = v80:GetPivot().Position
                        end
                    end
                    if v80 then
                        local v81 = u27:getContainingBridgeSegments(v80, u54.bridgeSegments, Vector3.new(35, 20, 35))
                        for _, v82 in v81 do
                            local v83 = u69[v82]
                            local v84
                            if v83 == nil then
                                v84 = v83
                            else
                                v84 = v83.Parent
                            end
                            if v84 then
                                v78[v82] = true
                                u52:toggleBridgeSegmentVisibility(v83, false, true)
                            end
                        end
                        local v85 = {}
                        for _, v86 in v81 do
                            v85[v86] = true
                        end
                        for _, v87 in u3.values(v78) do
                            if v85[v87] == nil then
                                v78[v87] = nil
                                local v88 = u69[v87]
                                local v89
                                if v88 == nil then
                                    v89 = v88
                                else
                                    v89 = v88.Parent
                                end
                                if v89 then
                                    u52:toggleBridgeSegmentVisibility(v88, false, false)
                                end
                            end
                        end
                    end
                end
            end)
            task.delay(u31 + v66, function() --[[ Line: 339 ]]
                --[[
                Upvalues:
                    [1] = u52
                    [2] = u53
                    [3] = u54
                --]]
                local v90 = u52.activeBridgeWalkerMap:get(u53)
                if v90 ~= nil then
                    v90 = v90.bridge.id
                end
                if v90 ~= u54.id then
                    return nil
                end
                u52:cleanBridgeWalker(u53)
            end)
            return
        end
        local v91 = u54.bridgeSegments[u67 + 1]
        local v92 = u52:makePart(v91, u53 == u15.LocalPlayer)
        table.insert(u58, v92)
        u69[v91] = v92
        if u53 == u15.LocalPlayer then
            v64:GiveTask(v92.Touched:Connect(function(p93) --[[ Line: 200 ]]
                --[[
                Upvalues:
                    [1] = u65
                    [2] = u26
                    [3] = u1
                    [4] = u25
                    [5] = u15
                    [6] = u52
                    [7] = u28
                    [8] = u54
                    [9] = u67
                --]]
                if not u65 then
                    return nil
                end
                if not p93 then
                    return nil
                end
                if not p93.Parent then
                    return nil
                end
                local v94 = u26:getEntity(p93.Parent)
                if not u1.instanceof(v94, u25) then
                    return nil
                end
                if v94:getPlayer() ~= u15.LocalPlayer then
                    return nil
                end
                if not v94:isAlive() then
                    return nil
                end
                if u52.recentlyTouchedBridge:has(u15.LocalPlayer.UserId) then
                    return nil
                end
                u28.Client:Get("SpiritBridgeEnter"):SendToServer(u54.id, u67)
                u52.recentlyTouchedBridge:add(u15.LocalPlayer.UserId)
            end))
            task.wait(0.1)
        else
            task.wait(0.1)
        end
    end
end
function u32.makePart(p95, p96, p97) --[[ Line: 351 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u18
    --]]
    local v98 = u11("Part", {
        ["CastShadow"] = false,
        ["Anchored"] = true,
        ["Size"] = p96.size,
        ["CFrame"] = p96.cframe,
        ["CanCollide"] = p97,
        ["CanQuery"] = p97,
        ["TopSurface"] = Enum.SurfaceType.Smooth,
        ["Material"] = Enum.Material.Glass,
        ["Color"] = Color3.fromRGB(165, 165, 165),
        ["Transparency"] = p97 and 0.6 or 1,
        ["Parent"] = u18
    })
    p95:toggleBridgeSegmentVisibility(v98, p97, p97)
    return v98
end
function u32.toggleBridgeSegmentVisibility(u99, u100, u101, u102) --[[ Line: 368 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
    --]]
    local v103 = u99.bridgeSegmentInfo[u100]
    local v104
    if v103 == nil then
        v104 = v103
    else
        v104 = v103.enabled
    end
    if v104 == u102 then
        return nil
    end
    if not v103 then
        v103 = {
            ["setup"] = false,
            ["enabled"] = u102
        }
        u99.bridgeSegmentInfo[u100] = v103
        local u105 = nil
        u105 = u100.AncestryChanged:Connect(function() --[[ Line: 389 ]]
            --[[
            Upvalues:
                [1] = u100
                [2] = u99
                [3] = u105
            --]]
            if not u100.Parent then
                u99.bridgeSegmentInfo[u100] = nil
                u105:Disconnect()
            end
        end)
    end
    v103.enabled = u102
    if not v103.setup and u102 then
        v103.setup = true
        local v106 = u16.Assets.Misc.SpiritBridge:Clone():GetChildren()
        local function v124(p107) --[[ Line: 403 ]]
            --[[
            Upvalues:
                [1] = u101
                [2] = u100
            --]]
            if not u101 then
                if p107:IsA("ParticleEmitter") then
                    p107.Rate = p107.Rate / 15
                    local v108 = p107.Transparency.Keypoints
                    local v109 = table.create(#v108)
                    for v110, v111 in v108 do
                        local _ = v110 - 1
                        local v112 = v111.Time
                        local v113 = 1 - (1 - v111.Value) / 4
                        local v114 = v111.Envelope
                        local v115 = v114 == nil and 0 or v114
                        v109[v110] = NumberSequenceKeypoint.new(v112, v113, v115 / 4)
                    end
                    p107.Transparency = NumberSequence.new(v109)
                end
                if p107:IsA("Beam") then
                    local v116 = p107.Transparency.Keypoints
                    local v117 = table.create(#v116)
                    for v118, v119 in v116 do
                        local _ = v118 - 1
                        local v120 = v119.Time
                        local v121 = 1 - (1 - v119.Value) / 4
                        local v122 = v119.Envelope
                        local v123 = v122 == nil and 0 or v122
                        v117[v118] = NumberSequenceKeypoint.new(v120, v121, v123 / 4)
                    end
                    p107.Transparency = NumberSequence.new(v117)
                end
            end
            p107.Parent = u100
        end
        for v125, v126 in v106 do
            v124(v126, v125 - 1, v106)
        end
    end
    local v127 = { u100 }
    local v128 = #v127
    local v129 = u100:GetDescendants()
    table.move(v129, 1, #v129, v128 + 1, v127)
    local function v134(p130) --[[ Line: 458 ]]
        --[[
        Upvalues:
            [1] = u101
            [2] = u17
            [3] = u102
        --]]
        if p130:IsA("Decal") or p130:IsA("BasePart") then
            local v131 = p130:GetAttribute("InitialTransparency")
            if v131 == 0 or (v131 ~= v131 or (v131 == "" or not v131)) then
                p130:SetAttribute("InitialTransparency", p130.Transparency)
                p130.Transparency = 1
            end
            local v132 = p130:GetAttribute("InitialTransparency")
            if not u101 then
                v132 = 1 - (1 - v132) / 4
            end
            local v133 = {
                ["Transparency"] = not u102 and 1 or v132
            }
            u17:Create(p130, TweenInfo.new(1), v133):Play()
        end
        if p130:IsA("ParticleEmitter") then
            p130.Enabled = u102
        end
        if p130:IsA("Beam") then
            p130.Enabled = u102
        end
    end
    for v135, v136 in v127 do
        v134(v136, v135 - 1, v127)
    end
end
function u32.destroySpiritBridge(_, u137, u138) --[[ Line: 484 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v139 = u137:GetChildren()
    local function v141(p140) --[[ Line: 486 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u138
        --]]
        if p140:IsA("Decal") then
            u17:Create(p140, TweenInfo.new(u138), {
                ["Transparency"] = 1
            }):Play()
        end
    end
    for v142, v143 in v139 do
        v141(v143, v142 - 1, v139)
    end
    u17:Create(u137, TweenInfo.new(u138 - 1), {
        ["Transparency"] = 1
    }):Play()
    task.delay(u138, function() --[[ Line: 499 ]]
        --[[
        Upvalues:
            [1] = u137
        --]]
        if u137 then
            u137:Destroy()
        end
    end)
end
function u32.enterSpiritForm(u144, p145, u146, u147, u148) --[[ Line: 505 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
        [3] = u23
        [4] = u5
        [5] = u22
        [6] = u21
        [7] = u19
        [8] = u2
        [9] = u12
        [10] = u30
        [11] = u8
        [12] = u29
        [13] = u26
        [14] = u1
        [15] = u25
        [16] = u28
        [17] = u27
    --]]
    local v149 = p145 == u15.LocalPlayer.Character
    for _, u150 in p145:GetDescendants() do
        if u150:IsA("BasePart") and u150.Transparency < 0.5 then
            local u151 = u150:GetAttribute("SpiritTransparency")
            if u151 == nil then
                u151 = u150.Transparency
                u150:SetAttribute("SpiritTransparency", u151)
            end
            local u152 = u150.Material
            u17:Create(u150, TweenInfo.new(0.1), {
                ["Transparency"] = 0.369
            }):Play()
            u150.Material = Enum.Material.ForceField
            u148:GiveTask(function() --[[ Line: 521 ]]
                --[[
                Upvalues:
                    [1] = u150
                    [2] = u17
                    [3] = u23
                    [4] = u151
                    [5] = u152
                --]]
                if u150.Parent then
                    local v153 = {
                        ["Transparency"] = u151
                    }
                    u17:Create(u150, TweenInfo.new(u23.SPIRIT_ARMOR_DELAY), v153):Play()
                    u150.Material = u152
                end
            end)
        end
        if u150:IsA("ParticleEmitter") or u150:IsA("Trail") then
            u150.Enabled = true
            u148:GiveTask(function() --[[ Line: 533 ]]
                --[[
                Upvalues:
                    [1] = u150
                --]]
                u150.Enabled = false
            end)
        end
    end
    if v149 then
        local u154 = u5:playAnimation(u15.LocalPlayer, u22:getAssetId(u21.ROBLOX_GHOST_FLOATING))
        u148:GiveTask(function() --[[ Line: 542 ]]
            --[[
            Upvalues:
                [1] = u154
            --]]
            if not u154 then
                return nil
            end
            u154:Stop()
            u154:Destroy()
        end)
        local u155 = u15.LocalPlayer.Character
        if u155 ~= nil then
            u155 = u155:FindFirstChild("Animate")
            if u155 ~= nil then
                u155 = u155:FindFirstChild("walk")
                if u155 ~= nil then
                    u155 = u155:FindFirstChild("WalkAnim")
                end
            end
        end
        if u155 then
            local u156 = u155.AnimationId
            u155.AnimationId = u22:getAssetId(u21.ROBLOX_GHOST_WALK)
            u148:GiveTask(function() --[[ Line: 563 ]]
                --[[
                Upvalues:
                    [1] = u155
                    [2] = u156
                --]]
                u155.AnimationId = u156
            end)
        end
        local u157 = u15.LocalPlayer.Character
        if u157 ~= nil then
            u157 = u157:FindFirstChild("Animate")
            if u157 ~= nil then
                u157 = u157:FindFirstChild("run")
                if u157 ~= nil then
                    u157 = u157:FindFirstChild("RunAnim")
                end
            end
        end
        if u157 then
            local u158 = u157.AnimationId
            u155.AnimationId = u22:getAssetId(u21.ROBLOX_GHOST_RUN)
            u148:GiveTask(function() --[[ Line: 581 ]]
                --[[
                Upvalues:
                    [1] = u157
                    [2] = u158
                --]]
                u157.AnimationId = u158
            end)
        end
        u148:GiveTask(u19.PerformCombat:connect(function(p159) --[[ Line: 585 ]]
            p159:setCancelled(true)
        end))
        u148:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u30, {
            ["character"] = p145
        })))
        local u160 = u8:playSound(u29.SPIRIT_BRIDGE_LOOP, {
            ["volumeMultiplier"] = 0.9,
            ["looped"] = true,
            ["parent"] = u15.LocalPlayer.Character
        })
        u148:GiveTask(function() --[[ Line: 596 ]]
            --[[
            Upvalues:
                [1] = u160
                [2] = u8
            --]]
            if u160 then
                u8:tweenSoundVolume(u160, 0, 2)
                task.delay(2.5, function() --[[ Line: 599 ]]
                    --[[
                    Upvalues:
                        [1] = u160
                    --]]
                    u160:Stop()
                    u160:Destroy()
                end)
            end
        end)
        local u161 = u26:getEntity(u146)
        if u161 == nil then
            return nil
        end
        local u162 = u161:getHumanoid()
        if u162 ~= nil then
            u162 = u162.Touched:Connect(function(p163) --[[ Line: 611 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u1
                    [3] = u25
                    [4] = u161
                    [5] = u28
                    [6] = u144
                --]]
                if not p163 then
                    return nil
                end
                if not p163.Parent then
                    return nil
                end
                local v164 = u26:getEntity(p163.Parent)
                if not u1.instanceof(v164, u25) then
                    return nil
                end
                if not v164:isAlive() then
                    return nil
                end
                if u161:canAttack(v164) then
                    return nil
                end
                u28.Client:Get("AttemptSpiritHeal"):SendToServer({
                    ["healedPlayer"] = v164:getPlayer()
                })
                u144.recentHealAttempts:add(v164:getPlayer().UserId)
            end)
        end
        u148:GiveTask(function() --[[ Line: 635 ]]
            --[[
            Upvalues:
                [1] = u162
            --]]
            if u162 == nil then
                return nil
            end
            u162:Disconnect()
        end)
    end
    task.delay(u27.MAX_BRIDGE_LIFETIME, function() --[[ Line: 643 ]]
        --[[
        Upvalues:
            [1] = u144
            [2] = u146
            [3] = u147
            [4] = u148
        --]]
        local v165 = u144.activeBridgeWalkerMap:get(u146)
        local v166
        if v165 == nil then
            v166 = v165
        else
            v166 = v165.bridge.id
        end
        if v166 ~= u147 then
            return nil
        end
        if v165 ~= nil then
            v165.maid:DoCleaning()
        end
        if u148 ~= nil then
            u148:DoCleaning()
        end
        u144.activeBridgeWalkerMap:delete(u146)
    end)
end
function u32.cleanBridgeWalker(p167, p168) --[[ Line: 661 ]]
    local v169 = p167.activeBridgeWalkerMap:get(p168)
    if v169 == nil then
        return false
    end
    v169.maid:DoCleaning()
    p167.activeBridgeWalkerMap:delete(p168)
    return true
end
v9.CreateController(u32.new())
return nil