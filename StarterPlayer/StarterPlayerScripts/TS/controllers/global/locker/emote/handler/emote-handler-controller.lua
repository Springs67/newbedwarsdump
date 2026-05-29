local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "EmoteHandlerController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p8)
    p8.Name = "EmoteHandlerController"
    p8.handlers = {}
end
function u5.KnitStart(u9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    u4.KnitStart(u9)
    u2(function(p10, p11, p12) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:hookEmoteHandlers(p10.UserId, p11, p12)
    end)
end
function u5.registerHandler(p13, p14, p15) --[[ Line: 31 ]]
    local v16 = p15.new()
    p13.handlers[p14] = v16
end
function u5.hookEmoteHandlers(u17, u18, u19, p20) --[[ Line: 40 ]]
    local function u25(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u19
        --]]
        if p21 then
            local v22 = u17.handlers[p21]
            if v22 ~= nil then
                v22:enable(u18, u19, p21)
                return
            end
        else
            for v23, v24 in u17.handlers do
                v24:disable(u18, u19, v23)
            end
        end
    end
    u25(u19:GetAttribute("PlayingEmote"))
    u19:GetAttributeChangedSignal("PlayingEmote"):Connect(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u19
        --]]
        u25(u19:GetAttribute("PlayingEmote"))
    end)
    p20:GiveTask(function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u19
        --]]
        for v26, v27 in u17.handlers do
            v27:disable(u18, u19, v26)
        end
    end)
end
v3.CreateController(u5.new())
return nil