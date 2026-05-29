local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "SpearImpactController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11, ...)
    p11.Name = "SpearImpactController"
    p11.random = Random.new()
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u2
        [5] = u7
        [6] = u3
    --]]
    u5.KnitStart(p12)
    u6.Client:OnEvent("SpearImpactEffect", function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u7
            [4] = u3
        --]]
        u4.new()
        u2:playSound(u7.SPEAR_HIT, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = p13.position
        })
        u3.Controllers.LightningController:createExplosion({
            ["explosionType"] = "spearExplosion",
            ["position"] = p13.position
        })
    end)
end
u3.CreateController(u8.new())
return nil