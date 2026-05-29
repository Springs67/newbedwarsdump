local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "YetiAbilityController"
    end,
    ["__index"] = u4
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
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "YetiAbilityController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u7
        [6] = u3
    --]]
    u4.KnitStart(p12)
    u6.Client:OnEvent("YetiAbility", function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u7
            [4] = u3
        --]]
        if p13.senderEntityInstance then
            local v14 = u5:getEntity(p13.senderEntityInstance)
            local v15 = u2
            local v16 = u7.YETI_ROAR
            local v17 = {}
            if v14 ~= nil then
                v14 = v14:isLocalPlayer()
            end
            local v18
            if v14 then
                v18 = nil
            else
                v18 = p13.position
            end
            v17.position = v18
            v15:playSound(v16, v17)
        end
        u3.Controllers.FreezeBlocksController:freezeBlocks(p13.position, p13.frozenBlocks)
    end)
end
u3.CreateController(u8.new())
return nil