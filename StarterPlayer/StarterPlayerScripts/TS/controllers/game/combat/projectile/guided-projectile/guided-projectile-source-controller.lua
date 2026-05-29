local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta
local v15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "GuidedProjectileSourceController"
    end,
    ["__index"] = u11
})
v15.__index = v15
function v15.constructor(p16, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
    --]]
    u11.constructor(p16, ...)
    p16.maid = u8.new()
end
function v15.KnitStart(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p17)
end
function v15.onEnable(u18, u19, u20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u4
        [7] = u9
        [8] = u5
        [9] = u12
        [10] = u10
    --]]
    u18.maid:DoCleaning()
    if u14[u13(u19.itemType).guidedProjectileSource.guidedProjectile].persistent == true then
        local v21 = u6.Controllers.GuidedProjectileController:getCurrentGuidedProjectile()
        if v21 ~= nil then
            v21 = v21.enabled
        end
        if v21 == false then
            u6.Controllers.GuidedProjectileController:enableGuidedProjectile()
        else
            u7.Debug("Launching guided projectile")
            u18:launchProjectile(u19.itemType, u20)
        end
        u18.maid:GiveTask(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            local v22 = u6.Controllers.GuidedProjectileController:getCurrentGuidedProjectile()
            if v22 then
                v22.forces.antiGravity.Force = Vector3.new(0, 0, 0)
            end
            u6.Controllers.GuidedProjectileController:disableGuidedProjectile(0.5)
        end)
        return nil
    end
    local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "launch-guided-projectile",
        ["boundFunction"] = function(_, p23, _) --[[ Name: boundFunction, Line 63 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
            --]]
            if p23 == Enum.UserInputState.Begin then
                u18:launchProjectile(u19.itemType, u20)
            end
        end
    })
    u18.maid:GiveTask(v24)
    if u4.isMobileControls() then
        u18:setupYield(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u12
                [4] = u18
                [5] = u19
                [6] = u20
                [7] = u10
            --]]
            local u25 = u9.mount(u9.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u9.createElement(u5, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u12:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 78 ]]
                        --[[
                        Upvalues:
                            [1] = u18
                            [2] = u19
                            [3] = u20
                        --]]
                        u18:launchProjectile(u19.itemType, u20)
                    end
                }) }), u10.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u25
                --]]
                u9.unmount(u25)
            end
        end)
    end
end
function v15.onDisable(p26) --[[ Line: 89 ]]
    p26.maid:DoCleaning()
end
function v15.launchProjectile(p27, p28, p29) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p27:onLaunch(p29)
    u6.Controllers.GuidedProjectileController:launch(p28)
end
return {
    ["GuidedProjectileSourceController"] = v15
}