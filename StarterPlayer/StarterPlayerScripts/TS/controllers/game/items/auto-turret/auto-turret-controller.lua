local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "AutoTurretController"
    end,
    ["__index"] = u11
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p20)
    p20.Name = "AutoTurretController"
    p20.turret = nil
    p20.lastShotTime = 0
    p20.turrets = {}
    p20.turretSet = {}
end
function u17.KnitStart(u21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u12
        [4] = u8
        [5] = u15
    --]]
    u11.KnitStart(u21)
    u7:GetInstanceAddedSignal(u12.AUTO_TURRET):Connect(function(u22) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u21
            [3] = u15
        --]]
        if u22:GetAttribute("PlacedByUserId") == u8.LocalPlayer.UserId then
            local v23 = u21.turrets
            table.insert(v23, u22)
            u21.turretSet[u22] = true
            local u24 = nil
            task.spawn(function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u22
                    [3] = u22
                    [4] = u24
                    [5] = u15
                    [6] = u8
                --]]
                while true do
                    local v25 = task.wait(1)
                    if v25 == 0 or (v25 ~= v25 or (not v25 or (u21.turretSet[u22] == nil or not u22))) then
                        break
                    end
                    if u24 == nil or not u21:validateTarget(u22, u24) then
                        u24 = u21:findTarget(u22)
                    end
                    if u24 then
                        local v26 = u24
                        if v26 ~= nil then
                            v26 = v26:getInstance().PrimaryPart
                            if v26 ~= nil then
                                v26 = v26.Position
                            end
                        end
                        local v27 = u22:WaitForChild("Rotate", 3)
                        if v27 and v26 then
                            v27.CFrame = CFrame.lookAt(v27.Position, v26)
                            local v28 = {
                                ["turret"] = u22,
                                ["targetPosition"] = v26
                            }
                            u15.Client:Get("AutoTurretFired"):SendToServer(v28)
                        end
                        u21:fire(u8.LocalPlayer, u22, u24)
                    end
                end
            end)
        end
    end)
    u7:GetInstanceRemovedSignal(u12.AUTO_TURRET):Connect(function(p29) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.turretSet[p29] = nil
    end)
    u15.Client:Get("angleChanged"):Connect(function(p30) --[[ Line: 92 ]]
        if not (p30.targetPosition and p30.turret) then
            return nil
        end
        local v31 = p30.turret:WaitForChild("Rotate", 3)
        if v31 then
            v31.CFrame = CFrame.lookAt(v31.Position, p30.targetPosition)
        end
    end)
end
function u17.fire(_, _, p32, p33) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u14
        [4] = u10
        [5] = u5
    --]]
    if not p32:IsDescendantOf(u9) then
        return nil
    end
    local v34 = u13(u14.AUTO_TURRET).block
    if v34 ~= nil then
        v34 = v34.projectileSource
    end
    if not (v34 and p33) then
        return nil
    end
    local v35 = u10.new(1, 1, "autoTurretBullet", nil, p33:getInstance():GetPrimaryPartCFrame().Position, Vector3.new(0, 0, 0))
    u5.Controllers.ProjectileController:launchProjectile(u14.AUTO_TURRET, nil, v35, p32, v34)
end
function u17.findTarget(p36, p37) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
    --]]
    local v38 = u16.getEntitiesWithinRadius(p37.Position, 50)
    if #v38 == 0 then
        return nil
    end
    local v39 = nil
    for _, v40 in v38 do
        if not u8:GetPlayerFromCharacter(v40:getInstance()) then
            if p36:validateTarget(p37, v40) then
                return v40
            end
            v39 = v40
        end
    end
    return v39
end
function u17.validateTarget(p41, p42, p43) --[[ Line: 134 ]]
    if p41:canSee(p42, p43) then
        local v44 = not p43
        if not v44 then
            if p43 == nil then
                v44 = p43
            else
                v44 = p43:isDead()
            end
        end
        if v44 then
            return false
        else
            return (p43:getInstance():GetPrimaryPartCFrame().Position - p42.Position).Magnitude <= 50
        end
    else
        return false
    end
end
function u17.canSee(_, p45, p46) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if not p46 then
        return false
    end
    local v47 = p45.Position - Vector3.new(0, 1.5, 0)
    local v48 = p46:getInstance()
    local v49 = v48:FindFirstChildWhichIsA("Humanoid")
    local v50
    if v48.PrimaryPart and v49 then
        local v51 = v48.PrimaryPart.Position
        local v52 = -1 * (v49.HipHeight + v48.PrimaryPart.Size.Y / 2)
        v50 = v51 + Vector3.new(0, v52, 0)
    else
        v50 = nil
    end
    if not (v47 and v50) then
        return false
    end
    local v53 = v47 + Vector3.new(0, 4, 0)
    local v54 = v50 + Vector3.new(0, 4, 0)
    local v55 = { p45, p46:getInstance() }
    local v56 = RaycastParams.new()
    v56.FilterDescendantsInstances = v55
    v56.FilterType = Enum.RaycastFilterType.Blacklist
    local v57 = u2:raycast(v47, v50 - v47, v56) ~= nil
    if not v57 then
        local v58 = RaycastParams.new()
        v58.FilterDescendantsInstances = v55
        v58.FilterType = Enum.RaycastFilterType.Blacklist
        v57 = u2:raycast(v50, v47 - v50, v58) ~= nil
    end
    local v59 = not v57
    if not v59 then
        local v60 = RaycastParams.new()
        v60.FilterDescendantsInstances = v55
        v60.FilterType = Enum.RaycastFilterType.Blacklist
        local v61 = u2:raycast(v53, v54 - v53, v60) ~= nil
        if not v61 then
            local v62 = RaycastParams.new()
            v62.FilterDescendantsInstances = v55
            v62.FilterType = Enum.RaycastFilterType.Blacklist
            v61 = u2:raycast(v54, v53 - v54, v62) ~= nil
        end
        v59 = not v61
        if not v59 then
            local v63 = (v47 + v53) / 2
            local v64 = (v50 + v54) / 2
            local v65 = RaycastParams.new()
            v65.FilterDescendantsInstances = v55
            v65.FilterType = Enum.RaycastFilterType.Blacklist
            local v66 = u2:raycast(v63, v64 - v63, v65) ~= nil
            if not v66 then
                local v67 = RaycastParams.new()
                v67.FilterDescendantsInstances = v55
                v67.FilterType = Enum.RaycastFilterType.Blacklist
                v66 = u2:raycast(v64, v63 - v64, v67) ~= nil
            end
            v59 = not v66
        end
    end
    return v59
end
v4.CreateController(u17.new())
return nil