local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "VengefulPoisonBuffController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "VengefulPoisonBuffController"
end
function u10.KnitStart(u14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
    --]]
    u6.KnitStart(u14)
    u8.Client:Get("SnakePoisonNova"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:playFartEffect(p15.position)
    end)
end
function u10.playFartEffect(_, p16) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u5
        [4] = u7
        [5] = u9
    --]]
    local u17 = u3.new()
    local v18 = u4("Part", {
        ["Size"] = Vector3.new(4, 4, 4),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p16,
        ["Parent"] = u5
    })
    u17:GiveTask(v18)
    local v19 = u4("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u7.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        ["Lifetime"] = NumberRange.new(5, 10),
        ["SpreadAngle"] = Vector2.new(180, 180),
        ["Speed"] = NumberRange.new(1, 2),
        ["Parent"] = v18
    })
    local v20 = u4("Attachment", {
        ["Position"] = Vector3.new(0, -1, 0),
        ["Orientation"] = Vector3.new(90, 0, 0),
        ["Parent"] = v18
    })
    local v21 = u4("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u7.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        ["Lifetime"] = NumberRange.new(3, 6),
        ["SpreadAngle"] = Vector2.new(10, 180),
        ["Speed"] = NumberRange.new(3, 7),
        ["Parent"] = v20
    })
    local v22 = u9.isLobbyServer() and 20 or 100
    v19:Emit(v22)
    v21:Emit(v22)
    task.delay(2, function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:DoCleaning()
    end)
end
v2.CreateController(u10.new())
return nil