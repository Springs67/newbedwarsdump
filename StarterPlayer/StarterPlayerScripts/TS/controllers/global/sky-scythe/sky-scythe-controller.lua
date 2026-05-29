local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.RunService
local u6 = v3.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "SkyScytheController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17)
    p17.Name = "SkyScytheController"
    p17.readyTime = -1
    p17.cooldown = 1
end
function u14.isRelevantItem(_, p18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p18.itemType == u11.SKY_SCYTHE
end
function u14.onEnable(_, _, _) --[[ Line: 38 ]] end
function u14.onDisable(_) --[[ Line: 40 ]] end
function u14.KnitStart(u19) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u11
        [4] = u13
        [5] = u10
        [6] = u7
        [7] = u6
        [8] = u12
    --]]
    u8.KnitStart(u19)
    u2.Controllers.PreloadController:preloadForItemType(u11.SKY_SCYTHE, {
        ["sounds"] = { u13.SKY_SCYTHE_1, u13.SKY_SCYTHE_2, u13.SKY_SCYTHE_3 }
    })
    local v20 = u10(u11.SKY_SCYTHE).sword
    if v20 ~= nil then
        v20 = v20.attackSpeed
    end
    u19.cooldown = v20 == nil and 1 or v20
    u7.SwordSwing:connect(function(p21) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u19
            [3] = u6
            [4] = u12
        --]]
        if p21.swordType == u11.SKY_SCYTHE and u19.readyTime < u6:GetServerTimeNow() then
            u19.readyTime = u6:GetServerTimeNow() + u19.cooldown
            u12.Client:Get("SkyScytheSpin"):SendToServer()
        end
    end)
    u12.Client:Get("SkyScytheSpinEffect"):Connect(function(p22) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:spinEffect(p22.player)
    end)
end
function u14.spinEffect(_, u23) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u6
        [4] = u5
    --]]
    local v24 = u9:getEntity(u23)
    local u25 = u4.Assets.Effects.SkyScytheEffect:Clone()
    local u26 = u23.Character
    if u26 ~= nil then
        u26 = u26.PrimaryPart
        if u26 ~= nil then
            u26 = u26.Position
        end
    end
    if not (u26 and v24) then
        return nil
    end
    u25.Position = u26
    u25.Parent = u6
    local v27 = u25:FindFirstChild("Ground")
    if v27 ~= nil then
        for v28, v29 in v27:GetChildren() do
            local _ = v28 - 1
            if v29:IsA("ParticleEmitter") then
                v29:Emit(3)
            end
        end
    end
    local u31 = u5.Heartbeat:Connect(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u26
            [3] = u25
        --]]
        local v30 = u23.Character
        if v30 ~= nil then
            v30 = v30.PrimaryPart
            if v30 ~= nil then
                v30 = v30.Position
            end
        end
        u26 = v30
        if u26 then
            u25.Position = u26
        end
    end)
    local u32 = v24:getHandItemInstanceFromCharacter()
    if u32 ~= nil then
        u32 = u32:FindFirstChild("Handle")
        if u32 ~= nil then
            u32 = u32:FindFirstChild("trail")
            if u32 ~= nil then
                u32 = u32:FindFirstChild("t0")
            end
        end
    end
    if u32 then
        u32.Enabled = true
    end
    task.delay(0.5, function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u25
            [3] = u32
        --]]
        u31:Disconnect()
        u25:Destroy()
        if u32 then
            u32.Enabled = false
        end
    end)
end
u2.CreateController(u14.new())
return nil