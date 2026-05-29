local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.RunService
local u7 = v4.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BatteryController"
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
        [2] = u8
        [3] = u3
    --]]
    u10.constructor(p14, u8.BATTERY)
    p14.Name = "BatteryController"
    p14.maid = u3.new()
end
function u11.onKitLocalActivated(_, p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u7
        [4] = u2
        [5] = u9
    --]]
    p15:GiveTask(u6.Heartbeat:Connect(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u2
            [4] = u9
        --]]
        local v16 = u5.LocalPlayer.Character
        if v16 ~= nil then
            v16 = v16.PrimaryPart
        end
        if not v16 then
            return nil
        end
        local v17 = OverlapParams.new()
        v17.MaxParts = 0
        for _, v18 in u7:GetPartBoundsInRadius(u5.LocalPlayer.Character:GetPivot().Position, 6, v17) do
            if v18:IsA("BasePart") then
                local v19 = u2.Controllers.BatteryEffectsController:getBatteryIdFromPart(v18)
                if v19 ~= 0 and (v19 == v19 and v19) then
                    local v20 = u2.Controllers.BatteryEffectsController:getBatteryInfo(v19)
                    if v20 and (v20.activateTime < u7:GetServerTimeNow() and v20.consumeTime + 0.5 < u7:GetServerTimeNow()) then
                        v20.consumeTime = u7:GetServerTimeNow()
                        u9.Client:Get("ConsumeBattery"):SendToServer({
                            ["batteryId"] = v19
                        })
                        return
                    end
                end
            end
        end
    end))
end
function u11.onKitLocalDeactivated(_) --[[ Line: 62 ]] end
function u11.onKitReplicationActivated(_, _) --[[ Line: 64 ]] end
function u11.onKitReplicationDeactivated(_) --[[ Line: 66 ]] end
function u11.onInnateAbilityEnabled(_, _, _) --[[ Line: 68 ]] end
function u11.onAbilityUsed(_, _, _) --[[ Line: 70 ]] end
u2.CreateController(u11.new())
return nil