local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.HttpService
local u10 = v8.Players
local u11 = v8.UserInputService
local u12 = v1.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-handler").ProjectileHandler
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "BlunderbussController"
    end,
    ["__index"] = u13
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    u13.constructor(p19)
    p19.Name = "BlunderbussController"
    p19.maid = u7.new()
end
function u16.KnitStart(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p20)
end
function u16.isRelevantItem(_, p21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p21.itemType == u15.BLUNDERBUSS
end
function u16.onEnable(u22, _, _) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u2
    --]]
    if u11.TouchEnabled then
        u22.maid:GiveTask(u11.TouchTapInWorld:Connect(function(_, p23) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if not p23 then
                u22:fire()
            end
        end))
    end
    local v25 = {
        ["action"] = "Attack",
        ["actionId"] = "shoot-blunderbuss:" .. u9:GenerateGUID(false),
        ["boundFunction"] = function(_, p24, _) --[[ Name: boundFunction, Line 56 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if p24 == Enum.UserInputState.Begin then
                u22:fire()
            end
        end
    }
    local v26 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v25)
    u22.maid:GiveTask(v26)
end
function u16.onDisable(p27) --[[ Line: 64 ]]
    p27.maid:DoCleaning()
end
function u16.fire(u28) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u15
        [4] = u10
        [5] = u3
        [6] = u12
        [7] = u6
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown("blunderbuss-shot") then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown("blunderbuss-shot") < 0.2 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback("blunderbuss-shot", "callback", function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:fire()
            end)
        end
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown("blunderbuss-shot", u14(u15.BLUNDERBUSS).projectileSource.fireDelaySec)
    local v29 = u10.LocalPlayer:GetMouse().UnitRay
    local v30 = u3:raycast(v29.Origin, v29.Direction * 600)
    local v31 = v29.Origin + v29.Direction * 100
    if v30 then
        v31 = v30.Position
    end
    local v32 = u12.new(1, 1, "blunderbuss_bullet", nil, v31, Vector3.new(0, 2, 0))
    local v33 = u28:getHandItem()
    if not v33 then
        return nil
    end
    local v34 = u14(v33.itemType)
    if v34.projectileSource then
        u6.Controllers.ProjectileController:launchProjectile(v33.tool.Name, nil, v32, v33.tool, v34.projectileSource, nil, u15.BLUNDERBUSS_BULLET)
    end
end
v5.CreateController(u16.new())
return nil