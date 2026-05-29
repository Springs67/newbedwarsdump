local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "AbilityMobileButtonController"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14)
    p14.Name = "AbilityMobileButtonController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u4
        [4] = u7
        [5] = u5
        [6] = u2
        [7] = u8
    --]]
    u10.KnitStart(p15)
    u9.AbilityEnabled:connect(function(u16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u5
            [4] = u2
            [5] = u8
        --]]
        local v17 = u16.ability.triggerConfig
        if v17 ~= nil then
            v17 = v17.mobileButton
        end
        if not v17 then
            return nil
        end
        if not u4.isMobileControls() then
            return nil
        end
        local u18 = u7.mount(u7.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u7.createElement(u5, {
                ["Image"] = v17.icon,
                ["Position"] = v17.position,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 50 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u16
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u16.ability.abilityId)
                end
            }) }), u8.LocalPlayer:WaitForChild("PlayerGui"))
        u16.ability.maid:GiveTask(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u18
            --]]
            u7.unmount(u18)
        end)
    end)
end
v6.CreateController(u11.new())
return nil