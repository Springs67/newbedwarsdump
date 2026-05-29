local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "ReaperScytheController"
    end,
    ["__index"] = u7
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
        [1] = u7
        [2] = u10
    --]]
    u7.constructor(p14)
    p14.Name = "GrimReaperScytheController"
    p14.reaperScytheRemote = u10.Client:Get("ReaperScytheSwing")
    p14.playEffectsRemoteEvent = u10.Client:Get("PlayReaperScytheEffects")
end
function u11.KnitStart(u15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u9
        [4] = u8
        [5] = u6
        [6] = u3
        [7] = u5
    --]]
    u7.KnitStart(u15)
    u2.Controllers.PreloadController:preloadForItemType(u9.REAPER_SCYTHE, {
        ["animations"] = {
            u8.SCYTHE_SLASH_1,
            u8.SCYTHE_SLASH_2,
            u8.SCYTHE_SLASH_1_FP,
            u8.SCYTHE_SLASH_2_FP,
            u8.SCYTHE_HOLD
        }
    })
    u6.SwordSwing:connect(function(p16) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
        --]]
        if p16:isCancelled() or p16.swordType ~= u9.REAPER_SCYTHE then
            return nil
        end
        u15.reaperScytheRemote:CallServerAsync()
    end)
    u15.playEffectsRemoteEvent:Connect(function(p17) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u15
        --]]
        local u18 = u3.new()
        local v19 = p17.playerIds
        local function v24(p20) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u15
                [3] = u18
            --]]
            local v21 = u5:GetPlayerByUserId(p20)
            if v21 ~= nil then
                v21 = v21.Character
            end
            if v21 then
                for v22, v23 in u15:makeParticleEmitter(v21.UpperTorso) do
                    local _ = v22 - 1
                    u18:GiveTask(v23)
                end
            end
        end
        for v25, v26 in v19 do
            v24(v26, v25 - 1, v19)
        end
        task.delay(3, function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            return u18:DoCleaning()
        end)
    end)
end
function u11.makeParticleEmitter(_, u27) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v28 = { ColorSequence.new(Color3.fromRGB(107, 223, 255)), ColorSequence.new(Color3.fromRGB(112, 237, 138)) }
    local function v31(p29, p30) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u27
        --]]
        return u4("ParticleEmitter", {
            ["Brightness"] = 2,
            ["LightEmission"] = 1,
            ["Texture"] = "rbxassetid://9153146729",
            ["Rate"] = 8,
            ["Drag"] = 4,
            ["TimeScale"] = 0.6,
            ["Name"] = "ReaperSpec-" .. tostring(p30),
            ["Color"] = p29,
            ["Size"] = NumberSequence.new(2.6, 0),
            ["Lifetime"] = NumberRange.new(0.7, 1),
            ["Speed"] = NumberRange.new(2),
            ["SpreadAngle"] = Vector2.new(360, 360),
            ["Shape"] = Enum.ParticleEmitterShape.Box,
            ["ShapeInOut"] = Enum.ParticleEmitterShapeInOut.Outward,
            ["ShapeStyle"] = Enum.ParticleEmitterShapeStyle.Volume,
            ["Parent"] = u27
        })
    end
    local v32 = table.create(#v28)
    for v33, v34 in v28 do
        v32[v33] = v31(v34, v33 - 1, v28)
    end
    return v32
end
u2.CreateController(u11.new())
return nil