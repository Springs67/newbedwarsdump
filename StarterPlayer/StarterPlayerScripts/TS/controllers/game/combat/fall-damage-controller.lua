local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "FallDamageController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p16, ...)
    p16.Name = "FallDamageController"
    p16.additionalRegisteredVelocity = 0
end
function u13.KnitStart(u17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u6
        [4] = u7
        [5] = u11
        [6] = u2
        [7] = u8
        [8] = u9
    --]]
    local u18 = u12.Client:Get("GroundHit")
    u3(function(p19, u20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
            [3] = u11
            [4] = u2
            [5] = u17
            [6] = u18
            [7] = u8
            [8] = u9
        --]]
        if u6.LocalPlayer == p19 then
            local u21 = Vector3.new(0, 0, 0)
            local u22 = false
            u7:BindToRenderStep("VelocityTracking", Enum.RenderPriority.Last.Value, function(_) --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u6
                    [3] = u21
                --]]
                if u22 then
                    local v23 = u6.LocalPlayer.Character
                    if v23 ~= nil then
                        v23 = v23.PrimaryPart
                        if v23 ~= nil then
                            v23 = v23.AssemblyLinearVelocity
                        end
                    end
                    u21 = v23 or Vector3.new(0, 0, 0)
                end
            end)
            local u24 = u20:WaitForChild("Humanoid")
            u24.StateChanged:Connect(function(p25, p26) --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u22
                    [3] = u24
                    [4] = u11
                    [5] = u2
                    [6] = u21
                    [7] = u17
                    [8] = u18
                    [9] = u8
                    [10] = u9
                --]]
                if u20.PrimaryPart == nil then
                    return nil
                end
                if p26 == Enum.HumanoidStateType.Freefall then
                    u22 = true
                    return
                end
                if p25 == Enum.HumanoidStateType.Freefall and p26 == Enum.HumanoidStateType.Landed then
                    local v27 = u20.PrimaryPart
                    local v28
                    if v27 then
                        local v29 = v27.Size.Y / 2 + u24.HipHeight + 0.25 * u11
                        local v30 = v27.Position - Vector3.new(0, v29, 0)
                        local v31 = false
                        local v32 = 0
                        while true do
                            if true then
                                if v31 then
                                    v32 = v32 + 1
                                else
                                    v31 = true
                                end
                            end
                            if v32 >= 5 or u2:getStore():getBlockAt(u2:getBlockPosition(v30)) then
                                break
                            end
                            local v33 = v27.Size.Y / 2 + u24.HipHeight + 0.25 * u11 + v32 * u11
                            v30 = v27.Position - Vector3.new(0, v33, 0)
                        end
                        v28 = u2:getStore():getBlockAt(u2:getBlockPosition(v30))
                    else
                        v28 = nil
                    end
                    local v34 = u21
                    local v35 = u17.additionalRegisteredVelocity
                    local v36 = v34 + Vector3.new(0, v35, 0)
                    u17.additionalRegisteredVelocity = 0
                    u18:SendToServer(v28, v36, u8:GetServerTimeNow())
                    u9.GroundTouch:fire(v28, v36)
                end
            end)
        end
    end)
end
function u13.countCurrentVelocityTowardNextFall(_) --[[ Line: 105 ]] end
return {
    ["FallDamageController"] = v4.CreateController(u13.new())
}