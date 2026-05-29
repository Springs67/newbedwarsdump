local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v5.RunService
local u9 = v5.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "BaseRegenController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p16)
    p16.Name = "BaseRegenController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u12
        [4] = u7
        [5] = u2
        [6] = u9
        [7] = u6
        [8] = u4
        [9] = u8
    --]]
    u11.KnitStart(p17)
    u10.StatusEffectAdded:connect(function(u18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u2
            [4] = u9
            [5] = u6
            [6] = u4
            [7] = u8
        --]]
        if u18.statusEffect ~= u12.BASE_REGEN then
            return nil
        end
        local u19 = u7.Assets.Effects.Enchant.RapidRegen:Clone()
        u19.Anchored = true
        u19.CanCollide = false
        u19.CanQuery = false
        u2:setQueryIgnored(u19, true)
        u19.Parent = u9
        u6:AddTag(u19, u18.entityInstance.Name .. ":base-regen")
        local u20 = u4.new()
        u19.AncestryChanged:Connect(function(_, p21) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if p21 == nil then
                u20:DoCleaning()
            end
        end);
        (function(p22) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u6
            --]]
            for v23, v24 in u19:GetChildren() do
                local _ = v23 - 1
                if v24:IsA("ParticleEmitter") then
                    v24.Enabled = p22
                    v24:SetAttribute("FirstPersonVisible", false)
                    u6:AddTag(v24, "FirstPersonHidden")
                end
            end
        end)(true)
        u20:GiveTask(u8.Heartbeat:Connect(function(_) --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
            --]]
            if u18.entityInstance.PrimaryPart == nil then
                return nil
            end
            u19.CFrame = u18.entityInstance.PrimaryPart.CFrame
        end))
    end)
    u10.StatusEffectRemoved:connect(function(p25) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u6
        --]]
        if p25.statusEffect ~= u12.BASE_REGEN then
            return nil
        end
        for v26, v27 in u6:GetTagged(p25.entityInstance.Name .. ":base-regen") do
            local _ = v26 - 1
            v27:Destroy()
        end
    end)
end
v3.CreateController(u13.new())
return nil