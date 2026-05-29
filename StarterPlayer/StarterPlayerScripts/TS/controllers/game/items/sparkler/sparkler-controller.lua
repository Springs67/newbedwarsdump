local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SparklerController"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "SparklerController"
    p11.sparklers = {}
end
function u8.KnitStart(u12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u3
        [5] = u7
        [6] = u1
    --]]
    u4.KnitStart(u12)
    u6.HandItemRendered:connect(function(u13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u3
            [4] = u7
        --]]
        if u13.tool and (u13.itemType == u5.SPARKLER and u12.sparklers[u13.tool] == nil) then
            u12.sparklers[u13.tool] = true
            local u14 = nil
            u14 = u13.tool.Destroying:Connect(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u13
                    [3] = u14
                --]]
                u12.sparklers[u13.tool] = nil
                u14:Disconnect()
            end)
            local v15 = u12:updateBurnedParts(u13.tool)
            if not v15 or v15:FindFirstChild("Sound") then
                return nil
            end
            u3("Sound", {
                ["RollOffMinDistance"] = 40,
                ["RollOffMaxDistance"] = 80,
                ["Volume"] = 0.9,
                ["Playing"] = true,
                ["PlaybackSpeed"] = 1,
                ["Looped"] = true,
                ["SoundId"] = u7.SPARKLER_LOOP,
                ["Parent"] = v15
            }):Play()
        end
    end)
    task.spawn(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u12
        --]]
        while u1.Promise.delay(1):await() do
            for v16 in u12.sparklers do
                u12:updateBurnedParts(v16)
            end
        end
    end)
end
function u8.updateBurnedParts(_, p17) --[[ Line: 77 ]]
    local v18 = p17:FindFirstChild("Handle")
    if v18 ~= nil then
        v18 = v18:FindFirstChild("Inside")
    end
    local v19 = p17:GetAttribute("LifeTime")
    local v20 = (v19 == nil and 0 or v19) / 100 * 14
    local v21 = p17:FindFirstChild("Handle")
    if v21 ~= nil then
        v21 = v21:FindFirstChild("EffectAttachment")
    end
    if not v18 then
        return nil
    end
    local v22 = false
    local v23 = 1
    while true do
        if v22 then
            v23 = v23 + 1
        else
            v22 = true
        end
        if v23 > 14 - v20 then
            local v24 = v18:FindFirstChild("P" .. tostring(v23))
            if v24 then
                v21.WorldPosition = v24.Position
                for v25, v26 in v21:GetDescendants() do
                    local _ = v25 - 1
                    if v26:IsA("ParticleEmitter") or v26:IsA("Trail") then
                        v26.Enabled = true
                    end
                end
            end
            return v21
        end
        if v18 ~= nil then
            local v27 = v18:FindFirstChild("P" .. tostring(v23))
            if v27 ~= nil then
                v27:Destroy()
            end
        end
    end
end
v2.CreateController(u8.new())
return nil