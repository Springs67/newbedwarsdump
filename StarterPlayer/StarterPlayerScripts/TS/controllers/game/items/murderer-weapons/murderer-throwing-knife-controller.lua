local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "MurdererThrowingKnifeController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p17)
    p17.Name = "MurdererThrowingKnifeController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u13
        [4] = u12
        [5] = u7
        [6] = u8
    --]]
    u10.KnitStart(p18)
    u9.BeginProjectileTargeting:connect(function(p19) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
            [3] = u7
            [4] = u8
        --]]
        if p19.handItem.itemType == u13.MURDERER_THROWING_KNIFE then
            local v20 = u12:getEntity(u7.LocalPlayer)
            if v20 ~= nil then
                v20 = v20:getInstance()
            end
            local v21 = u7.LocalPlayer:GetAttribute("MurdererReadyTime")
            if (v21 == nil and 0 or v21) > u8:GetServerTimeNow() then
                p19:setCancelled(true)
            end
        end
    end)
end
function u14.isRelevantItem(_, p22) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return p22.itemType == u13.MURDERER_THROWING_KNIFE
end
function u14.onEnable(p23, _, _) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u11
        [4] = u3
    --]]
    p23:setupYield(function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u11
            [4] = u3
        --]]
        local u24 = u5.new()
        task.wait(0.2)
        local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
        local v26 = u11.MURDERER_KILL
        local v27 = {
            ["title"] = {
                ["text"] = "KILL COOLDOWN",
                ["color"] = u3.WHITE
            }
        }
        u24:GiveTask(v25:createCooldownBar(v26, v27))
        return function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:DoCleaning()
        end
    end)
end
function u14.onDisable(_) --[[ Line: 71 ]] end
v4.CreateController(u14.new())
return nil