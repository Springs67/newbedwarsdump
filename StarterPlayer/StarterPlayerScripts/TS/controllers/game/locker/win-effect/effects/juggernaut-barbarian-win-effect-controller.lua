local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "JuggernautBarbarianWinEffectController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
    --]]
    u11.constructor(p15, u8.JUGGERNAUT_BARBARIAN)
    p15.Name = "JuggernautBarbarianWinEffectController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p16)
end
function u12.onWin(_, p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u10
        [5] = u2
        [6] = u9
    --]]
    local v18 = u5.Assets.Effects.Explosion:Clone()
    v18.Parent = u6
    v18.CFrame = p17.Character.PrimaryPart.CFrame
    local v19 = u7:getEntity(p17)
    if not v19 then
        return nil
    end
    u10:playEffects({ v18 }, v19:getInstance(), {
        ["sizeMultiplier"] = 3
    })
    local v20 = u2
    local v21 = u9.TNT_EXPLODE_1
    local v22 = {}
    local v23 = v19:getInstance().PrimaryPart
    if v23 ~= nil then
        v23 = v23.Position
    end
    v22.position = v23
    v20:playSound(v21, v22)
end
v3.CreateController(u12.new())
return nil