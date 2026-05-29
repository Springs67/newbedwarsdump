local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "VoidWorldAssetController"
    end,
    ["__index"] = u3
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p10)
    p10.Name = "VoidWorldAssetController"
end
function u7.KnitStart(u11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u6
    --]]
    u3.KnitStart(u11)
    local u12 = nil
    u12 = u2.Controllers.WorldController:watchLocalWorld(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
            [3] = u11
        --]]
        if p13 ~= nil then
            p13 = p13.Name
        end
        if p13 == u6.VOID_WORLD then
            u12:Destroy()
            u11:preloadVoidAssets()
        end
    end)
end
function u7.preloadVoidAssets(_) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u4
    --]]
    u2.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u5.VOID_CRAB_BASIC_ATTACK,
            u5.VOID_CRAB_BEAM_ATTACK,
            u5.VOID_CRAB_DAMAGED,
            u5.VOID_CRAB_DEATH,
            u5.VOID_CRAB_FOOTSTEPS,
            u5.VOID_CRAB_LUNGE_ATTACK
        },
        ["animations"] = {
            u4.VOID_CRAB_BEAM_ATTACK,
            u4.VOID_CRAB_LEFT_ATTACK,
            u4.VOID_CRAB_RIGHT_ATTACK,
            u4.VOID_CRAB_WALKING,
            u4.VOID_CRAB_ATTACKED,
            u4.VOID_CRAB_MIDDLE_ATTACK
        }
    })
end
u2.CreateController(u7.new())
return nil