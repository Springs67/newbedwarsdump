local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PoisonController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15)
    p15.Name = "PoisonController"
    p15.effectMap = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u11
        [4] = u7
        [5] = u4
        [6] = u10
        [7] = u6
        [8] = u3
    --]]
    u9.KnitStart(u16)
    u8.StatusEffectAdded:connect(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u16
            [4] = u4
            [5] = u10
            [6] = u6
            [7] = u3
        --]]
        if p17.statusEffect ~= u11.POISON then
            return nil
        end
        local v18 = u7:GetPlayerFromCharacter(p17.entityInstance)
        if not v18 or u16.effectMap[v18] ~= nil then
            return nil
        end
        local v19 = p17.entityInstance.HumanoidRootPart:WaitForChild("RootAttachment", 3)
        if not v19 then
            return nil
        end
        local v20 = u4("ParticleEmitter", {
            ["Enabled"] = true,
            ["LockedToPart"] = true,
            ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
            ["Texture"] = u10.SMOKE,
            ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.5), NumberSequenceKeypoint.new(1, 3, 1) }),
            ["Lifetime"] = NumberRange.new(5, 10),
            ["SpreadAngle"] = Vector2.new(180, 180),
            ["Speed"] = NumberRange.new(1, 2),
            ["Parent"] = v19
        })
        v20:SetAttribute("FirstPersonVisible", false)
        u6:AddTag(v20, "FirstPersonHidden")
        local v21 = u3.new()
        v21:GiveTask(v20)
        u16.effectMap[v18] = v21
    end)
    u8.StatusEffectRemoved:connect(function(p22) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u16
        --]]
        if p22.statusEffect ~= u11.POISON then
            return nil
        end
        local v23 = u7:GetPlayerFromCharacter(p22.entityInstance)
        if v23 then
            local v24 = u16.effectMap[v23]
            if v24 then
                v24:DoCleaning()
            end
            u16.effectMap[v23] = nil
        end
    end)
end
v2.CreateController(u12.new())
return nil