local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "FirecrackersController"
    end,
    ["__index"] = u10
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "FirecrackersController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u12
        [4] = u13
        [5] = u9
        [6] = u11
        [7] = u4
        [8] = u3
        [9] = u7
        [10] = u8
        [11] = u14
    --]]
    u10.KnitStart(p19)
    u5.Controllers.PreloadController:preloadForItemType(u12.FIRECRACKERS, {
        ["sounds"] = {
            u13.FIRECRACKER_BANG_SHORT_1,
            u13.FIRECRACKER_BANG_SHORT_2,
            u13.FIRECRACKER_BANG_SHORT_3,
            u13.FIRECRACKER_BANG_SHORT_4,
            u13.FIRECRACKER_BANG_SHORT_5,
            u13.FIRECRACKER_BANG_SHORT_6,
            u13.FIRECRACKER_BANG_SHORT_7,
            u13.FIRECRACKER_BANG_SHORT_8,
            u13.FIRECRACKER_BANG_SHORT_9,
            u13.FIRECRACKER_BANG_SHORT_10
        }
    })
    u9.ExplosionEffect:connect(function(p20) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u3
            [4] = u13
            [5] = u7
            [6] = u8
            [7] = u14
        --]]
        if p20.explosionType == u11.FIRECRACKER then
            u4:playSound(u3.fromList(u13.FIRECRACKER_BANG_SHORT_1, u13.FIRECRACKER_BANG_SHORT_2, u13.FIRECRACKER_BANG_SHORT_3, u13.FIRECRACKER_BANG_SHORT_4, u13.FIRECRACKER_BANG_SHORT_5, u13.FIRECRACKER_BANG_SHORT_6, u13.FIRECRACKER_BANG_SHORT_7, u13.FIRECRACKER_BANG_SHORT_8, u13.FIRECRACKER_BANG_SHORT_9, u13.FIRECRACKER_BANG_SHORT_10), {
                ["rollOffMaxDistance"] = 250,
                ["position"] = p20.position
            })
            local v21 = u7.Assets.Effects.FirecrackerExplosion:Clone()
            v21.Parent = u8
            v21.CFrame = CFrame.new(p20.position)
            u14:playEffects({ v21 }, nil, {
                ["sizeMultiplier"] = 0.7,
                ["destroyAfterSec"] = 3
            })
        end
    end)
end
u5.CreateController(u15.new())
return nil