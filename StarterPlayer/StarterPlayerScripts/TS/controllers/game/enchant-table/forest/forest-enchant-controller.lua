local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u20 = v3.registerConstants(script, {
    ["offset"] = 0.58
})
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "ForestEnchantController"
    end,
    ["__index"] = u14
})
u21.__index = u21
function u21.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u19
    --]]
    u14.constructor(p24)
    p24.Name = "ForestEnchantController"
    p24.hasEnchant = false
    p24.effectTypes = {
        [u19.ENCHANT_FOREST] = true
    }
end
function u21.KnitStart(u25) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u18
        [4] = u16
        [5] = u17
        [6] = u9
        [7] = u5
        [8] = u10
        [9] = u12
        [10] = u20
        [11] = u7
        [12] = u11
        [13] = u13
        [14] = u1
    --]]
    u14.KnitStart(u25)
    u6.Controllers.PreloadController:runPreload({
        ["sounds"] = { u18.FOREST_ENCHANT_ACTIVATE },
        ["loadOnGameTypes"] = { u16.BEDWARS, u16.PVP_ARENA }
    })
    u17.Client:Get("ForestEnchantActivated"):Connect(function(u26) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u18
            [4] = u10
            [5] = u12
            [6] = u20
            [7] = u7
            [8] = u11
        --]]
        local v27 = u26.attacker == u9.LocalPlayer.Character
        if v27 or u26.victim.PrimaryPart then
            local v28 = u5
            local v29 = u18.FOREST_ENCHANT_ACTIVATE
            local v30 = {}
            local v31
            if v27 then
                v31 = nil
            else
                v31 = u26.victim:GetPrimaryPartCFrame().Position
            end
            v30.position = v31
            v28:playSound(v29, v30)
        end
        local u32 = u10.Assets.Effects.ForestEnchant:Clone()
        u32.Parent = u12
        for v33, v34 in u32:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("Beam") then
                v34:SetTextureOffset(u20.offset)
            end
        end
        local u35 = u7.new()
        u35:GiveTask(u32)
        u35:GiveTask(u11.Heartbeat:Connect(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u35
                [3] = u32
            --]]
            if not (u26.attacker.PrimaryPart and u26.victim.PrimaryPart) then
                u35:DoCleaning()
                return nil
            end
            u32.Position = u26.attacker.PrimaryPart.Position
            for _, v36 in u32:GetChildren() do
                if v36:IsA("Attachment") then
                    local v37 = u26.victim:GetPrimaryPartCFrame().Position
                    if v36.Name == "destination" then
                        v37 = u26.attacker:GetPrimaryPartCFrame().Position
                    end
                    v36.WorldPosition = v37
                end
            end
        end))
        task.delay(1.2, function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35:DoCleaning()
        end)
    end)
    u13.StatusEffectAdded:connect(function(p38) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u9
            [3] = u1
        --]]
        if u25.effectTypes[p38.statusEffect] == nil then
            return nil
        end
        if u9:GetPlayerFromCharacter(p38.entityInstance) == u9.LocalPlayer then
            u25.hasEnchant = true
            u1.Promise.defer(function() --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u25
                    [3] = u9
                --]]
                while u1.Promise.delay(0.5):await() and u25.hasEnchant do
                    for _, v39 in u9:GetPlayers() do
                        if u25:checkCooldown(v39) then
                            u25:mountEffect(v39)
                        end
                    end
                end
            end)
        end
    end)
    u13.StatusEffectRemoved:connect(function(p40) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u9
        --]]
        if u25.effectTypes[p40.statusEffect] == nil then
            return nil
        end
        if p40.entityInstance ~= u9.LocalPlayer.Character then
            return nil
        end
        u25.hasEnchant = false
        u25:unmountAllEffects()
    end)
end
function u21.checkCooldown(_, p41) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u12
    --]]
    local v42 = u9.LocalPlayer
    local v43 = u15:getLocalPlayerEntity()
    local v44 = u15:getEntity(p41)
    if not (v43 and (v44 and v43:canAttack(v44))) then
        return false
    end
    local v45 = v42.UserId
    local v46 = math.abs(v45)
    local v47 = p41:GetAttribute("ForestCooldown" .. tostring(v46))
    if v47 ~= 0 and (v47 == v47 and v47) then
        v47 = u12:GetServerTimeNow() < v47
    end
    return (v47 == 0 or (v47 ~= v47 or not v47)) and true or false
end
function u21.mountEffect(_, u48) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u11
        [4] = u9
    --]]
    local v49 = u48:GetAttribute("EffectMounted")
    if v49 == 0 or (v49 ~= v49 or (v49 == "" or not v49)) then
        v49 = not u48.Character
    end
    if v49 ~= 0 and (v49 == v49 and (v49 ~= "" and v49)) then
        return nil
    end
    u48:SetAttribute("EffectMounted", true)
    local u50 = u10.Assets.Effects.Seed:Clone()
    u50.Parent = u48.Character
    u4:setQueryIgnored(u50, true)
    local u51 = 0
    local u52 = nil
    u52 = u11.Heartbeat:Connect(function(p53) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u50
            [3] = u48
            [4] = u52
        --]]
        u51 = u51 + p53
        local v54 = u50
        if v54 then
            v54 = u48
            if v54 ~= nil then
                v54 = v54.Character
                if v54 ~= nil then
                    v54 = v54.PrimaryPart
                end
            end
        end
        if v54 then
            local v55 = u48.Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0)
            u50.CFrame = CFrame.new(v55) * CFrame.Angles(0, u51 * 3.141592653589793 / 2, 0)
        else
            u50:Destroy()
            u48:SetAttribute("EffectMounted", false)
            u52:Disconnect()
        end
    end)
    local v56 = u9.LocalPlayer.UserId
    local v57 = math.abs(v56)
    u48:GetAttributeChangedSignal("ForestCooldown" .. tostring(v57)):Connect(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u48
            [3] = u52
        --]]
        u50:Destroy()
        u48:SetAttribute("EffectMounted", false)
        u52:Disconnect()
    end)
end
function u21.unmountAllEffects(_) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    for _, v58 in u9:GetPlayers() do
        local v59 = v58.Character
        if v59 ~= nil then
            v59 = v59:FindFirstChild("Seed")
        end
        if v59 then
            v59:Destroy()
            v58:SetAttribute("EffectMounted", false)
        end
    end
end
u6.CreateController(u21.new())
return nil