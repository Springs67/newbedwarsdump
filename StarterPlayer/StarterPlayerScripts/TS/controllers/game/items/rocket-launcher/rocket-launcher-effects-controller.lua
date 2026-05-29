local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "RocketLauncherEffectsController"
    end,
    ["__index"] = u9
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
function u16.constructor(p19, ...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p19, ...)
    p19.Name = "RocketLauncherEffectsController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u7
        [4] = u8
        [5] = u5
        [6] = u2
        [7] = u11
        [8] = u10
        [9] = u12
        [10] = u13
        [11] = u15
    --]]
    u9.KnitStart(p20)
    u14.Client:WaitFor("RocketLauncherMissileExplode"):andThen(function(p21) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u5
        --]]
        return p21:Connect(function(u22) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u8
                [3] = u5
            --]]
            task.spawn(function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u8
                    [3] = u22
                    [4] = u5
                --]]
                local v23 = u7.Assets.Effects.RocketLauncherExplode:Clone()
                v23.Parent = u8
                v23:PivotTo(CFrame.new(u22.position))
                u5.Controllers.FancyExplosionController:createExplosion({
                    ["radius"] = 15,
                    ["randomSizeOffset"] = 10,
                    ["randomPositionOffset"] = 1,
                    ["rotationSpeed"] = 15,
                    ["inDuration"] = 0.3,
                    ["outDuration"] = 0.3,
                    ["position"] = u22.position,
                    ["model"] = v23
                }):await()
                v23:Destroy()
            end)
            local v24 = false
            local v25 = 0
            while true do
                if v24 then
                    v25 = v25 + 1
                else
                    v24 = true
                end
                if v25 >= math.random() * 2 + 2 then
                    return
                end
                task.spawn(function() --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u8
                        [3] = u22
                    --]]
                    local v26 = u7.Assets.Effects.RocketLauncherDebris:Clone()
                    v26.Parent = u8
                    v26.Position = u22.position
                    local v27 = math.random() * 3.141592653589793 * 2
                    local v28 = math.cos(v27) * 40
                    local v29 = math.sin(v27) * 40
                    v26:ApplyImpulse(Vector3.new(v28, 70, v29) * v26.Mass)
                    task.wait(1)
                    v26:Destroy()
                end)
            end
        end)
    end)
    u2({ u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT), u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) }, function(p30, u31) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u12
            [4] = u13
            [5] = u7
            [6] = u15
        --]]
        local u32 = p30.Character
        if not u32 then
            return nil
        end
        local v33 = u31.Animation
        if v33 ~= nil then
            v33 = v33.AnimationId
        end
        if v33 == u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT) then
            local v34 = u12.getInventory(p30).hand
            if v34 ~= nil then
                v34 = v34.tool
            end
            if v34 and v34.Name == u13.ROCKET_LAUNCHER then
                v34.Handle.Missile.Transparency = 1
                for v35, v36 in v34:GetDescendants() do
                    local _ = v35 - 1
                    if v36:IsA("ParticleEmitter") then
                        v36:Emit(5)
                    end
                end
            end
        end
        if v33 == u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) then
            local u37 = u12.getInventory(p30).hand
            if u37 ~= nil then
                u37 = u37.tool
            end
            if u37 and u37.Name == u13.ROCKET_LAUNCHER then
                u31:GetMarkerReachedSignal("grab_missile"):Connect(function() --[[ Line: 128 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u31
                        [3] = u37
                        [4] = u32
                        [5] = u15
                    --]]
                    local u38 = u7:WaitForChild("Items"):WaitForChild("rocket_launcher_missile"):Clone()
                    u31:GetMarkerReachedSignal("insert_missile"):Connect(function() --[[ Line: 130 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                            [2] = u37
                        --]]
                        u38:Destroy()
                        if u37.Parent and u37:FindFirstChild("Handle") then
                            u37.Handle.Missile.Transparency = 0
                        end
                    end)
                    local v39 = u32:FindFirstChildWhichIsA("Humanoid")
                    if v39 ~= nil then
                        v39:AddAccessory(u38)
                    end
                    u15:weldCharacterAccessories(u32)
                end)
            end
        end
    end)
end
v4.CreateController(u16.new())
return nil