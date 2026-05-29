local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "scythe-util").ScytheUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "HalloweenWhisperController"
    end,
    ["__index"] = u13
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
        [1] = u13
        [2] = u17
        [3] = u9
    --]]
    u13.constructor(p25, { u17.HALLOWEEN_2025_EVENT_PVE })
    p25.Name = "HalloweenWhisperController"
    p25.readyTime = -1
    p25.projecileModelTemplate = u9:WaitForChild("Assets"):WaitForChild("Projectiles"):FindFirstChild("owl_projectile")
    p25.inited = false
end
function u22.KnitStart(p26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p26)
end
function u22.onGameInit(u27) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u19
        [4] = u8
        [5] = u20
        [6] = u16
        [7] = u21
    --]]
    u12.SwordSwing:connect(function(p28) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u10
            [3] = u19
            [4] = u8
            [5] = u20
            [6] = u16
        --]]
        if u27.readyTime > u10:GetServerTimeNow() then
            return nil
        end
        if p28:isCancelled() then
            return nil
        end
        local v29 = u19.getInventory(u8.LocalPlayer).hand
        if v29 ~= nil then
            v29 = v29.itemType
        end
        if v29 ~= u20.WHISPER_FEATHER then
            return nil
        end
        if not u16:getLocalPlayerEntity() then
            return nil
        end
        local v30 = u8.LocalPlayer:GetAttribute("IsCasting")
        if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
            return nil
        end
        u27.readyTime = u10:GetServerTimeNow() + 0.4
        u27:playLocalAnimation()
        local v31 = u8.LocalPlayer.Character
        if v31 ~= nil then
            v31 = v31.PrimaryPart
        end
        local v32 = p28.targetEntity
        if v32 ~= nil then
            v32 = v32:getInstance().PrimaryPart
            if v32 ~= nil then
                v32 = v32.Position
            end
        end
    end)
    u21.Client:Get("SpecialWeaponHit"):Connect(function(p33) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u27
        --]]
        if p33.item ~= u20.WHISPER_FEATHER then
            return nil
        end
        u27:featherEffect(p33.attacker, p33.target)
    end)
end
function u22.playLocalAnimation(_) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u18
        [3] = u4
        [4] = u14
        [5] = u3
        [6] = u15
    --]]
    local v34 = u8.LocalPlayer:GetAttribute("AttackCount")
    local _ = (v34 == nil and 0 or v34) % #u18:getScytheAttackSequence()
    local v35 = u4.fromList(u14.DART_THROW_1, u14.DART_THROW_2)
    local v36 = u3:playAnimation(u8.LocalPlayer, u15:getAssetId(v35))
    local v37
    if v36 == nil then
        v37 = v36
    else
        v37 = v36.Length
    end
    if v37 ~= 0 and (v37 == v37 and (v37 and v36 ~= nil)) then
        v36:AdjustSpeed(v37 / 0.35)
    end
end
function u22.featherEffect(p38, p39, p40) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u11
        [4] = u6
    --]]
    if not p38.projecileModelTemplate then
        p38.projecileModelTemplate = u9:WaitForChild("Assets"):WaitForChild("Projectiles"):FindFirstChild("owl_projectile")
    end
    local u41 = p38.projecileModelTemplate
    if u41 ~= nil then
        u41 = u41:Clone()
    end
    if not u41 then
        return nil
    end
    local v42 = p39.Character
    if v42 ~= nil then
        v42 = v42.PrimaryPart
        if v42 ~= nil then
            v42 = v42.Position
        end
    end
    if not v42 then
        return nil
    end
    local v43 = p39.Character
    if v43 ~= nil then
        v43 = v43.PrimaryPart
        if v43 ~= nil then
            v43 = v43.CFrame.LookVector.Unit
        end
    end
    if not v43 then
        return nil
    end
    if p40 ~= nil then
        p40 = p40.PrimaryPart
        if p40 ~= nil then
            p40 = p40.Position
        end
    end
    if p40 == nil then
        p40 = v42 + v43 * 15
    end
    local v44 = v43 * 2
    u41:PivotTo(CFrame.new(v42 + v44, p40))
    u41.Parent = u10
    local v45 = v43 * 20
    local v46 = CFrame.new(p40, p40 + v45)
    u11(0.1, u6, function(p47) --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41:PivotTo(p47)
    end, u41.PrimaryPart.CFrame, v46)
    task.delay(0.1, function() --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41:Destroy()
    end)
end
v5.CreateController(u22.new())
return nil