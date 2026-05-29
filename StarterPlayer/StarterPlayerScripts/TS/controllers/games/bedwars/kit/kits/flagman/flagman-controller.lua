local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.RunService
local u13 = v8.TweenService
local u14 = v8.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u24 = {
    [v20.DAMAGE_BANNER] = Color3.fromRGB(255, 113, 78),
    [v20.HEAL_BANNER] = Color3.fromRGB(112, 189, 92),
    [v20.DEFENSE_BANNER] = Color3.fromRGB(80, 137, 188)
}
local u25 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local u26 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local u27 = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut)
local u28 = u11.Assets.Effects.BannerPoint
local u29 = u11.Assets.Effects.BannerConnection
local u30 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "FlagManController"
    end,
    ["__index"] = u15
})
u30.__index = u30
function u30.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v31 = u30
    local v32 = setmetatable({}, v31)
    return v32:constructor(...) or v32
end
function u30.constructor(p33) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
    --]]
    u15.constructor(p33)
    p33.Name = "FlagManController"
    p33.flagViewMap = {}
    p33.beamMap = {}
    p33.playerBeamMap = {}
    p33.beamTickRate = 1
    p33.tickAccumulator = 0
    p33.audioIsLooping = false
    p33.audioLoopMaid = u6.new()
end
function u30.KnitStart(u34) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u10
    --]]
    u34:startBeamTicker()
    u4("flag-kit", function(p35) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:hideFlagForAnimation(p35)
        if not u34:isClientPrediction(p35) then
            local v36 = u34:animateFlag(p35)
            local v37 = u34:createRadius(p35)
            local v38 = u34:createPointLight(p35)
            u34:playFlagDropSound(p35)
            u34:playFlagShockwave(p35)
            local v39 = {
                ["radius"] = v37,
                ["flagClone"] = v36,
                ["pointLight"] = v38
            }
            if not u34:isFriendlyFlag(p35) then
                v39.teamIndicator = u34:createTeamIndicator(p35)
            end
            u34.flagViewMap[p35] = v39
        end
    end)
    u9:GetInstanceRemovedSignal("flag-kit"):Connect(function(u40) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u10
        --]]
        if not u34:isClientPrediction(u40) then
            local v41 = u34.flagViewMap[u40]
            local v42
            if v41 == nil then
                v42 = v41
            else
                v42 = v41.radius
            end
            if v42 then
                v41.radius:Destroy()
            end
            local v43
            if v41 == nil then
                v43 = v41
            else
                v43 = v41.teamIndicator
            end
            if v43 then
                v41.teamIndicator:Destroy()
            end
            local v44
            if v41 == nil then
                v44 = v41
            else
                v44 = v41.flagClone
            end
            if v44 then
                v41.flagClone:Destroy()
            end
            local v45
            if v41 == nil then
                v45 = v41
            else
                v45 = v41.pointLight
            end
            if v45 then
                v41.pointLight:Destroy()
            end
            local v46 = u10:GetPlayers()
            local function v52(p47) --[[ Line: 130 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u40
                --]]
                local v48 = u34.playerBeamMap[p47]
                local v49 = v48 and v48[u40]
                if v49 then
                    for v50, v51 in v49 do
                        local _ = v50 - 1
                        v51.Parent = nil
                        v51:Destroy()
                    end
                    if u34:isLocalPlayer(p47) and u34.audioIsLooping then
                        u34.audioLoopMaid:DoCleaning()
                        u34.audioIsLooping = false
                    end
                end
            end
            for v53, v54 in v46 do
                v52(v54, v53 - 1, v46)
            end
            u34.flagViewMap[u40] = nil
        end
    end)
end
function u30.createRadius(_, p55) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u14
        [3] = u17
        [4] = u7
        [5] = u13
        [6] = u25
        [7] = u16
        [8] = u26
    --]]
    local v56 = u24[p55.Name]
    local v57 = {
        ["Name"] = "RadiusCircle",
        ["Size"] = Vector3.new(0.2, 0, 0),
        ["Parent"] = u14
    }
    local v58 = CFrame.new(p55.Position)
    local v59 = u17 / 2
    v57.CFrame = v58 - Vector3.new(0, v59, 0)
    v57.Orientation = Vector3.new(0, 0, 90)
    v57.Shape = Enum.PartType.Cylinder
    v57.Color = v56
    v57.Transparency = 0
    v57.CastShadow = false
    v57.Material = Enum.Material.ForceField
    v57.Reflectance = 0
    v57.Anchored = true
    v57.CanCollide = false
    v57.CanTouch = false
    v57.CanQuery = false
    local u60 = u7("Part", v57)
    local v61 = u13
    local v62 = u25
    local v63 = {}
    local v64 = u16.CONQUEROR_FLAG_RADIUS
    local v65 = u16.CONQUEROR_FLAG_RADIUS
    v63.Size = Vector3.new(0.2, v64, v65)
    local v66 = v61:Create(u60, v62, v63)
    v66:Play()
    local u67 = nil
    u67 = v66.Completed:Connect(function() --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u60
            [3] = u26
            [4] = u16
            [5] = u67
        --]]
        local v68 = u13
        local v69 = u60
        local v70 = u26
        local v71 = {}
        local v72 = u16.CONQUEROR_FLAG_RADIUS
        local v73 = u16.CONQUEROR_FLAG_RADIUS
        v71.Size = Vector3.new(0.5, v72, v73)
        local v74 = u60.Position.X
        local v75 = u60.Position.Y + 0.25 + 0.1
        local v76 = u60.Position.Z
        v71.Position = Vector3.new(v74, v75, v76)
        v68:Create(v69, v70, v71):Play()
        u67:Disconnect()
    end)
    return u60
end
function u30.createTeamIndicator(_, p77) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u14
        [3] = u19
    --]]
    local v78 = u7
    local v79 = {
        ["AlwaysOnTop"] = true,
        ["MaxDistance"] = 100,
        ["StudsOffset"] = Vector3.new(0, 7, 0),
        ["Parent"] = u14,
        ["Adornee"] = p77,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Children"] = { u7("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u19.SKULL_VECTOR_ICON,
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScaleType"] = Enum.ScaleType.Fit
            }) }
    }
    return v78("BillboardGui", v79)
end
function u30.animateFlag(_, p80) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u17
        [4] = u27
        [5] = u14
    --]]
    local v81 = p80:Clone()
    u9:RemoveTag(v81, "flag-kit")
    local v82 = v81:WaitForChild("Banner", 3)
    v82.Transparency = 0
    v82.Position = p80.Position + Vector3.new(0, 40, 0)
    local v83 = u13
    local v84 = {}
    local v85 = p80.CFrame.Position
    local v86 = u17 / 2
    local v87 = Vector3.new(0, v86, 0)
    v84.CFrame = CFrame.new(v85 + v87)
    v83:Create(v82, u27, v84):Play()
    for v88, v89 in v82:GetChildren() do
        local _ = v88 - 1
        v89.Transparency = 0
    end
    v82.Parent = u14
    return v82
end
function u30.createPointLight(_, p90) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u24
        [3] = u14
        [4] = u22
    --]]
    local v91 = u28:Clone()
    v91.CFrame = CFrame.new(p90.Position)
    v91.Anchored = true
    v91.CanCollide = false
    local v92 = u24[p90.Name]
    v91.Point.Cubes.Color = ColorSequence.new(v92)
    v91.Point.Gradient.Color = ColorSequence.new(v92)
    v91.Point.PointLight.Color = v92
    v91.Point.Shine.Color = ColorSequence.new(v92)
    v91.Parent = u14
    u22:playEffects({ v91 }, nil)
    return v91
end
function u30.playFlagDropSound(_, p93) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u21
    --]]
    u3:playSound(u21.FLAG_DROP, {
        ["position"] = p93.Position
    })
end
function u30.playBuffLoop(p94) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u21
    --]]
    local v95 = u3:playSound(u21.FLAG_BUFF, {
        ["position"] = nil,
        ["looped"] = true
    })
    p94.audioLoopMaid:GiveTask(v95)
end
function u30.playFlagShockwave(_, p96) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u22
    --]]
    local v97 = u11.Assets.Effects.FlagShockwave:Clone()
    v97.Parent = u14
    v97.CFrame = CFrame.new(p96.Position)
    u22:playEffects({ v97 }, nil, {
        ["destroyAfterSec"] = 3
    })
end
function u30.hideFlagForAnimation(_, p98) --[[ Line: 274 ]]
    local v99 = p98:WaitForChild("Banner", 3)
    if v99 then
        v99.Transparency = 1
        for v100, v101 in v99:GetChildren() do
            local _ = v100 - 1
            v101.Transparency = 1
        end
    end
end
function u30.startBeamTicker(u102) --[[ Line: 288 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.Heartbeat:Connect(function(p103) --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u102
        --]]
        local v104 = u102
        v104.tickAccumulator = v104.tickAccumulator + p103
        if u102.tickAccumulator >= u102.beamTickRate then
            for v105, _ in u102.flagViewMap do
                u102:createBeams(v105, (u102:getBeamEligibleEntities(v105)))
            end
            u102.tickAccumulator = 0
        end
    end)
end
function u30.createBeams(u106, u107, u108) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u29
    --]]
    local u109 = u106.beamMap[u107]
    local u110 = u106.flagViewMap[u107]
    local function v122(p111) --[[ Line: 312 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u24
            [3] = u107
            [4] = u29
            [5] = u110
            [6] = u106
        --]]
        local v112 = u109
        if v112 ~= nil then
            v112 = table.find(v112, p111) ~= nil
        end
        local v113 = u24[u107.Name]
        if not v112 then
            local v114 = u29.Beam1:Clone()
            local v115 = u29.Beam2:Clone()
            local v116 = p111.Character
            if v116 ~= nil then
                v116 = v116:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment")
            end
            local v117 = u110
            if v117 ~= nil then
                v117 = v117.pointLight
            end
            local v118 = v117 and u110.pointLight:WaitForChild("Point", 3)
            if v118 then
                v114.Color = ColorSequence.new(v113)
                v114.Attachment0 = v118
                v114.Attachment1 = v116
                v114.Parent = v116
                v115.Color = ColorSequence.new(v113)
                v115.Attachment0 = v118
                v115.Attachment1 = v116
                v115.Parent = v116
                if u106:isLocalPlayer(p111) and not u106.audioIsLooping then
                    u106.audioIsLooping = true
                    u106:playBuffLoop()
                end
                local v119 = u106.playerBeamMap[p111]
                if not v119 then
                    local v120 = {
                        [u107] = { v114, v115 }
                    }
                    u106.playerBeamMap[p111] = v120
                    return
                end
                local v121 = v119[u107]
                if v121 then
                    table.insert(v121, v114)
                    table.insert(v121, v115)
                    return
                end
                v119[u107] = { v114, v115 }
            end
        end
    end
    for v123, v124 in u108 do
        v122(v124, v123 - 1, u108)
    end
    if u109 ~= nil then
        local function v131(p125) --[[ Line: 384 ]]
            --[[
            Upvalues:
                [1] = u108
                [2] = u106
                [3] = u107
            --]]
            local v126 = u108
            if table.find(v126, p125) == nil then
                local v127 = u106.playerBeamMap[p125]
                local v128 = v127 and v127[u107]
                if v128 then
                    for v129, v130 in v128 do
                        local _ = v129 - 1
                        v130.Parent = nil
                        v130:Destroy()
                    end
                    if u106:isLocalPlayer(p125) and u106.audioIsLooping then
                        u106.audioLoopMaid:DoCleaning()
                        u106.audioIsLooping = false
                    end
                end
            end
        end
        for v132, v133 in u109 do
            v131(v133, v132 - 1, u109)
        end
    end
    u106.beamMap[u107] = u108
end
function u30.getBeamEligibleEntities(u134, u135) --[[ Line: 420 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u16
        [3] = u1
        [4] = u18
    --]]
    local v136 = u134.flagViewMap[u135]
    if not v136 then
        return {}
    end
    local v137 = 0
    local v138 = {}
    local u139 = {}
    for v140, v141 in u23.getEntitiesWithinRadius(v136.radius.Position, u16.CONQUEROR_FLAG_RADIUS / 2) do
        local _ = v140 - 1
        if u1.instanceof(v141, u18) == true then
            v137 = v137 + 1
            v138[v137] = v141
        end
    end
    local v142 = table.create(#v138)
    for v143, v144 in v138 do
        local _ = v143 - 1
        v142[v143] = {
            ["entity"] = v144,
            ["distance"] = (v144:getInstance():GetPivot().Position - u135.Position).Magnitude
        }
    end
    table.sort(v142, function(p145, p146) --[[ Line: 458 ]]
        return p145.distance < p146.distance
    end)
    local u147 = 0
    local function v151(p148) --[[ Line: 464 ]]
        --[[
        Upvalues:
            [1] = u147
            [2] = u16
            [3] = u1
            [4] = u18
            [5] = u134
            [6] = u135
            [7] = u139
        --]]
        if u147 < u16.CONQUEROR_FLAG_MAX_PLAYERS_BUFFED and (u1.instanceof(p148.entity, u18) and u134:wasPlacedByTeammate(p148.entity:getPlayer(), u135)) then
            local v149 = u139
            local v150 = p148.entity:getPlayer()
            table.insert(v149, v150)
            u147 = u147 + 1
        end
    end
    for v152, v153 in v142 do
        v151(v153, v152 - 1, v142)
    end
    return u139
end
function u30.wasPlacedByTeammate(_, p154, p155) --[[ Line: 479 ]]
    local v156 = p155:GetAttribute("FlagTeam")
    local v157 = p154.Team
    if v157 ~= nil then
        v157 = v157.Name
    end
    return v156 == v157
end
function u30.isFriendlyFlag(_, p158) --[[ Line: 487 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v159 = p158:GetAttribute("FlagTeam")
    local v160 = u10.LocalPlayer.Team
    if v160 ~= nil then
        v160 = v160.Name
    end
    return v160 == v159
end
function u30.isClientPrediction(_, p161) --[[ Line: 495 ]]
    return p161:GetAttribute("ClientPlaced")
end
function u30.isLocalPlayer(_, p162) --[[ Line: 498 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p162.Character == u10.LocalPlayer.Character
end
v5.CreateController(u30.new())
return nil