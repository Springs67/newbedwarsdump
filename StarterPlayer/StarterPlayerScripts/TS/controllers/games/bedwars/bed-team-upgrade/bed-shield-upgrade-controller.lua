local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireList
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "BedShieldUpgradeController"
    end,
    ["__index"] = u16
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
    --]]
    u16.constructor(p22)
    p22.Name = "BedShieldUpgradeController"
    p22.bedShieldTimer = u3.new()
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u18
        [4] = u17
        [5] = u15
        [6] = u9
    --]]
    u16.KnitStart(u23)
    u8.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u18.BED_SHIELD_ACTIVATE,
            u18.BED_SHIELD_DEACTIVATE,
            u18.BED_SHIELD_IMPACT_1,
            u18.BED_SHIELD_IMPACT_2,
            u18.BED_SHIELD_IMPACT_3,
            u18.BED_SHIELD_IMPACT_4
        }
    })
    u17.Client:OnEvent("BedShieldActivated", function(p24) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:handleBedShieldActivated(p24)
    end)
    u17.Client:OnEvent("BedShieldImpacted", function(p25) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:handleBedShieldImpacted(p25)
    end)
    u17.Client:OnEvent("BedShieldDeactivated", function(p26, p27) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:handleBedShieldDeactivated(p26, p27)
    end)
    u15.ProjectileHit:setPriority(u9.HIGH):connect(function(p28) --[[ Line: 53 ]]
        if p28:isCancelled() then
            return nil
        end
        local v29 = p28.hitData
        if v29 ~= nil then
            v29 = v29.part
            if v29 ~= nil then
                v29 = v29:HasTag("ProjectileShield")
            end
        end
        if v29 then
            p28.projectileModel:Destroy()
        end
    end)
end
function u19.getLocalBedShieldTimer(p30) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
    --]]
    local v31 = u8.Controllers.TeamController:getPlayerTeam(u11.LocalPlayer)
    if v31 ~= nil then
        v31 = v31.id
    end
    local v32 = v31 == nil and "" or v31
    local v33 = p30.bedShieldTimer:get(v32)
    if v33 ~= nil then
        v33 = v33.expiresAt
    end
    return v33
end
function u19.handleBedShieldActivated(p34, p35) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u5
        [4] = u18
    --]]
    local v36 = p35.expireTime - u14:GetServerTimeNow()
    p34.bedShieldTimer:add(p35.teamId, v36)
    local v37 = u11.LocalPlayer.Character
    if not v37 then
        return nil
    end
    if (v37:GetPivot().Position - p35.bedPosition).Magnitude < 100 then
        u5:playSound(u18.BED_SHIELD_ACTIVATE, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = p35.bedPosition
        })
    end
end
function u19.handleBedShieldImpacted(_, p38) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u18
        [3] = u5
        [4] = u4
        [5] = u12
        [6] = u14
        [7] = u8
        [8] = u13
    --]]
    local v39 = u11.LocalPlayer.Character
    if not v39 then
        return nil
    end
    if (v39:GetPivot().Position - p38.Position).Magnitude >= 100 then
        return nil
    end
    local v40 = {
        u18.BED_SHIELD_IMPACT_1,
        u18.BED_SHIELD_IMPACT_2,
        u18.BED_SHIELD_IMPACT_3,
        u18.BED_SHIELD_IMPACT_4
    }
    u5:playSound(u4.fromList(unpack(v40)), {
        ["rollOffMaxDistance"] = 70,
        ["volumeMultiplier"] = 0.8,
        ["position"] = p38.Position
    })
    local u41 = u12.Assets.Effects.BedShieldImpact:Clone()
    u41.Parent = u14
    u41:PivotTo(p38)
    for v42, v43 in u41:GetDescendants() do
        local _ = v42 - 1
        if v43:IsA("ParticleEmitter") then
            v43:Emit()
        end
    end
    local v44 = false
    local v45 = 0
    while true do
        if v44 then
            v45 = v45 + 1
        else
            v44 = true
        end
        if v45 >= 3 then
            if not u13:IsStudio() then
                task.delay(2, function() --[[ Line: 157 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                    --]]
                    u41:Destroy()
                end)
            end
            return
        end
        local v46 = u8.Controllers.BlockDebrisController
        local v47 = p38.Position
        local v48 = Color3.fromRGB(237, 128, 56)
        local v49 = Vector3.new()
        local v50 = {
            ["burnDebris"] = true,
            ["transparency"] = 0.15,
            ["burnColors"] = { Color3.fromRGB(240, 94, 71), Color3.fromRGB(240, 120, 46) },
            ["material"] = Enum.Material.Neon
        }
        local v51 = math.random() * 0.6
        local v52 = math.random() * 0.5
        local v53 = math.random() * 0.9
        v50.size = Vector3.new(v51, v52, v53)
        v46:createDebris(v47, v48, v49, v50)
    end
end
function u19.handleBedShieldDeactivated(p54, p55, p56) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u18
    --]]
    p54.bedShieldTimer:remove(p55)
    local v57 = u11.LocalPlayer.Character
    if not v57 then
        return nil
    end
    if (v57:GetPivot().Position - p56).Magnitude < 100 then
        u5:playSound(u18.BED_SHIELD_DEACTIVATE, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = p56
        })
    end
end
v7.CreateController(u19.new())
return nil