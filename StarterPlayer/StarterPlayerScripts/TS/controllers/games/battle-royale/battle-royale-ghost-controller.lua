local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireList
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "BattleRotaleGhostController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u19
        [3] = u12
        [4] = u3
    --]]
    u14.constructor(p25, { u19.BATTLE_ROYALE })
    p25.Name = "BattleRotaleGhostController"
    p25.camera = u12.CurrentCamera
    p25.isGhost = false
    p25.ghostMap = {}
    p25.cooldownList = u3.new(1)
end
function u22.KnitStart(u26) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
        [3] = u9
        [4] = u7
        [5] = u13
        [6] = u1
        [7] = u17
        [8] = u6
        [9] = u4
        [10] = u18
        [11] = u16
        [12] = u15
    --]]
    u14.KnitStart(u26)
    u20.Client:Get("BeconeGhost"):Connect(function(p27) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26.isGhost = true
        u26:becomesGhost(p27.ghostModel)
        u26:showOtherGhost()
    end)
    u20.Client:Get("ReviveEffect"):Connect(function(p28) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u26
            [3] = u7
        --]]
        if p28.player == u9.LocalPlayer then
            u26.isGhost = false
            u26:disableFirstPersonController()
            u7.Controllers.RoyaleBedController:enableAllPrompts()
            u26:hideOtherGhost()
        end
        u26:reviveEffect(p28.position)
    end)
    u13.ProjectileHit:connect(function(p29) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u17
        --]]
        if p29:isCancelled() then
            return nil
        end
        if u1.instanceof(p29.hitEntity, u17) then
            local v30 = p29.hitEntity:getPlayer().Character
            if v30 ~= nil then
                v30 = v30:GetAttribute("GhostForm")
            end
            if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
                p29:setCancelled(true)
                return nil
            end
        end
    end)
    u6("ghost-player", function(u31) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u26
            [3] = u4
            [4] = u18
            [5] = u16
            [6] = u15
        --]]
        local u32 = u9:GetPlayerByUserId(u31:GetAttribute("PlayerID"))
        if u32 then
            u26.ghostMap[u32] = u31
        end
        for v33, v34 in u31:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("BasePart") then
                u4:setQueryIgnored(u31, true)
            end
        end
        local v35 = u31:WaitForChild("Head", 2)
        if v35 ~= nil then
            local v36 = v35:WaitForChild("Nametag", 2)
            if v36 ~= nil then
                local v37 = v36:WaitForChild("EntityStateInfo")
                if v37 ~= nil then
                    v37:Destroy()
                end
            end
        end
        task.delay(1, function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u32
                [3] = u9
                [4] = u26
                [5] = u18
                [6] = u16
                [7] = u15
            --]]
            for v38, v39 in u31:GetDescendants() do
                local _ = v38 - 1
                if v39:IsA("MeshPart") then
                    v39:SetAttribute("OriginalTrans", v39.Transparency)
                end
            end
            if u32 and (u32.Team ~= u9.LocalPlayer.Team and not u26.isGhost) then
                local v40 = u18:getEntity(u32)
                if v40 then
                    v40:hideNametag()
                end
                for v41, v42 in u31:GetDescendants() do
                    local _ = v41 - 1
                    if v42:IsA("MeshPart") or v42:IsA("Part") then
                        v42.Transparency = 1
                    end
                end
            end
            if u32 == u9.LocalPlayer then
                u26:enableFirstPersonController(u31)
            end
            u16:playAnimation(u31, u15.GHOST_IDLE)
        end)
    end)
end
function u22.becomesGhost(_, p43) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v44 = u12.CurrentCamera
    if v44 and p43.PrimaryPart then
        v44.CameraSubject = p43.PrimaryPart
    end
end
function u22.enableFirstPersonController(u45, u46) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    local v47 = 0
    local u48 = {}
    for v49, v50 in u46:GetDescendants() do
        local _ = v49 - 1
        if v50:IsA("MeshPart") == true then
            v47 = v47 + 1
            u48[v47] = v50
        end
    end
    for v51, v52 in u46:GetDescendants() do
        local _ = v51 - 1
        if v52:IsA("MeshPart") then
            v52:SetAttribute("OriginalTransparency", v52.Transparency)
        end
    end
    u45.FirstPersonController = u11.Heartbeat:Connect(function() --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
            [3] = u48
            [4] = u12
        --]]
        local v53 = u45.camera
        if v53 ~= nil then
            v53 = (v53.Focus.Position - u45.camera.CFrame.Position).Magnitude
        end
        if v53 == 0 or (v53 ~= v53 or (not v53 or (not u46 or (not u48 or u46.Parent ~= u12)))) then
            u45:disableFirstPersonController()
            return nil
        elseif v53 < 0.6 then
            print(62)
            for v54, v55 in u48 do
                local _ = v54 - 1
                if v55:IsA("MeshPart") then
                    v55.Transparency = 1
                end
            end
            u46:SetAttribute("FirstPerson", true)
            local v56 = CFrame.new(u46.PrimaryPart.Position)
            local v57 = u45.camera.CFrame.Rotation
            u46.PrimaryPart.CFrame = v56 * v57
        else
            u46:SetAttribute("FirstPerson", false)
            for v58, v59 in u48 do
                local _ = v58 - 1
                if v59:IsA("MeshPart") or v59:IsA("Decal") then
                    v59.Transparency = v59:GetAttribute("OriginalTransparency")
                end
            end
        end
    end)
end
function u22.disableFirstPersonController(p60) --[[ Line: 206 ]]
    local v61 = p60.FirstPersonController
    if v61 ~= nil then
        v61:Disconnect()
    end
end
function u22.hideOtherGhost(p62) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u18
    --]]
    local v63 = p62.ghostMap
    local function v69(p64, p65) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u18
        --]]
        if p65.Team == u9.LocalPlayer.Team then
            return nil
        end
        local v66 = u18:getEntity(p65)
        if v66 then
            v66:hideNametag()
        end
        for v67, v68 in p64:GetDescendants() do
            local _ = v67 - 1
            if v68:IsA("MeshPart") or v68:IsA("Part") then
                v68.Transparency = 1
            end
        end
    end
    for v70, v71 in v63 do
        v69(v71, v70, v63)
    end
end
function u22.showOtherGhost(p72) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v73 = p72.ghostMap
    local function v78(p74, p75) --[[ Line: 238 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        for v76, v77 in p74:GetDescendants() do
            local _ = v76 - 1
            if p75.Team ~= u9.LocalPlayer.Team then
                if v77:IsA("MeshPart") then
                    v77.Transparency = v77:GetAttribute("OriginalTrans")
                end
            end
        end
    end
    for v79, v80 in v73 do
        v78(v80, v79, v73)
    end
end
function u22.reviveEffect(p81, p82) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u5
        [4] = u21
    --]]
    if p81.cooldownList:has(p82) then
        return nil
    end
    p81.cooldownList:add(p82)
    local u83 = u10.Assets.Effects.BedReviveEffect:Clone()
    u83:PivotTo(CFrame.new(p82))
    u83.Parent = u12
    for v84, v85 in u83:GetDescendants() do
        local _ = v84 - 1
        if v85:IsA("ParticleEmitter") then
            v85:Emit(1)
        end
    end
    u5:playSound(u21.LANI_ASCEND, {
        ["rollOffMaxDistance"] = 60,
        ["position"] = p82
    })
    task.delay(1, function() --[[ Line: 279 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        u83:Destroy()
    end)
end
function u22.isLocalGhost(p86) --[[ Line: 283 ]]
    return p86.isGhost
end
u7.CreateController(u22.new())
return nil