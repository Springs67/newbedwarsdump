local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u7 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "CheersEmoteController"
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
    p11.Name = "CheersEmoteController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
        [4] = u7
        [5] = u3
        [6] = u6
    --]]
    u4.KnitStart(p12)
    local v13 = u2.Controllers.EmoteHandlerController
    local v14 = u5.CHEERS_BOTTLE
    local u15 = u7
    local u16 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
            return "Anonymous"
        end,
        ["__index"] = u15
    })
    u16.__index = u16
    function u16.new(...) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v17 = u16
        local v18 = setmetatable({}, v17)
        return v18:constructor(...) or v18
    end
    function u16.constructor(p19, ...) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15.constructor(p19, ...)
    end
    function u16.onEnable(u20, u21, u22, _, u23) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
        --]]
        local u24 = u3.Assets.Misc.SparklingAppleJuice:Clone()
        u24.Parent = u22
        u20:setupInstance(u24)
        u6:weldCharacterAccessories(u22)
        u23:GiveTask(task.delay(1, function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u20
                [3] = u21
                [4] = u22
            --]]
            u23:GiveTask(u20:playSound("rbxassetid://10722059", u21, {
                ["position"] = u22:GetPivot().Position
            }))
        end))
        u23:GiveTask(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:Destroy()
        end)
    end
    function u16.onDisable(_, _, _, _) --[[ Line: 63 ]] end
    v13:registerHandler(v14, u16)
end
u2.CreateController(u8.new())
return nil