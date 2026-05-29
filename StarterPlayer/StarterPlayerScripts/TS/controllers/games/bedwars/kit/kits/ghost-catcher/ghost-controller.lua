local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GhostController"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, ...)
    p16.Name = "GhostController"
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
        [3] = u10
        [4] = u9
    --]]
    u12.KnitStart(p17)
    u8.ProjectileLaunched:connect(function(p18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
        --]]
        if p18.projectileType ~= "ghost" then
            return nil
        end
        p18.projectile:FindFirstChildOfClass("AnimationController"):LoadAnimation(u10:getAnimation(u9.GHOST_SPIN)):Play(0.05)
    end)
end
function u13.validCollectableEntityTypes(_) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return { u11.GHOST }
end
function u13.pickDisplayModel(_, p19, _) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return {
        ["repStorageModel"] = u6:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Ghost"),
        ["collectionTag"] = p19
    }
end
function u13.onWillRemoveEntity(_, _, _, u20, u21) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u7
        [4] = u3
        [5] = u5
    --]]
    local u22 = u21:GetPivot()
    if u20 then
        local u23 = u21:FindFirstChildOfClass("AnimationController"):LoadAnimation(u10:getAnimation(u9.GHOST_SPIN))
        u23:Play(0.3, nil, 0.2)
        u7(1.4, u3, function(p24) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u22
                [4] = u23
            --]]
            local v25 = u20
            if v25 ~= nil then
                v25 = v25.Character
                if v25 ~= nil then
                    v25 = v25:GetPivot()
                end
            end
            if not v25 then
                return nil
            end
            u21:PivotTo(u22:Lerp(v25 * CFrame.Angles(0, 3.141592653589793, 0), p24))
            u23:AdjustSpeed(0.2 + p24)
        end):Wait()
    end
    if u20 == u5.LocalPlayer then
        u10:playAnimation(u5.LocalPlayer, u9.VACUUM_GHOST_CAPTURED, {
            ["looped"] = false
        })
    end
    return nil
end
function u13.onCreatedEntity(_, _, _, u26) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u1
    --]]
    u26:PivotTo(u26:GetPivot() + Vector3.new(0, 3, 0))
    local u27 = u26:FindFirstChildOfClass("AnimationController")
    if u27 ~= nil then
        u27:LoadAnimation(u10:getAnimation(u9.GHOST_IDLE)):Play()
        task.spawn(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u26
                [3] = u27
                [4] = u10
                [5] = u9
            --]]
            while u1.Promise.delay(math.random(15, 25)):await() and u26.Parent do
                u27:LoadAnimation(u10:getAnimation(u9.GHOST_FLIP)):Play()
            end
        end)
    end
    return nil
end
v2.CreateController(u13.new())
return nil