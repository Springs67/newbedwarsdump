local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TwirlbladeController"
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
    --]]
    u7.constructor(p14)
    p14.Name = "TwirlbladeController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u6
        [4] = u2
        [5] = u10
        [6] = u5
        [7] = u8
    --]]
    u7.KnitStart(p15)
    u9.Client:OnEvent("TwirlbladeSpin", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u10
            [4] = u5
            [5] = u8
        --]]
        if p16.executingPlayer == u6.LocalPlayer then
            u2:playSound(u10.TWIRLBLADE_SPIN, {})
            u5.Controllers.ViewmodelController:playAnimation(u8.FP_TWIRLBLADE_ATTACK_SPIN)
        else
            u2:playSound(u10.TWIRLBLADE_SPIN, {
                ["position"] = p16.position
            })
        end
    end)
end
v4.CreateController(u11.new())
return nil