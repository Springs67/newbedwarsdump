local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "PurgatoryController"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "PurgatoryController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
        [4] = u3
    --]]
    u4.KnitStart(p10)
    u2("entity", function(u11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
        --]]
        local u12 = {
            ["transparency"] = 1
        }
        u11:GetAttributeChangedSignal("IsInPurgatory"):Connect(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u3
                [4] = u12
            --]]
            debug.profilebegin("purgatory-toggle")
            local v13 = u5:getEntity(u11)
            if u11:GetAttribute("IsInPurgatory") == true then
                u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u11):addModifier(u12)
                if v13 ~= nil then
                    v13:hideNametag()
                end
            else
                u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u11):removeModifier(u12)
                if v13 ~= nil then
                    v13:showNametag()
                end
            end
            debug.profileend()
        end)
    end)
end
u3.CreateController(u6.new())
return nil