local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "ChatBubbleController"
    end,
    ["__index"] = u3
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
        [1] = u3
    --]]
    u3.constructor(p8)
    p8.Name = "ChatBubbleController"
    p8.chat = game:GetService("Chat")
end
function u5.KnitStart(u9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.KnitStart(u9)
    u4.Client:Get("SendChatMesage"):Connect(function(p10) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.chat:Chat(p10.part, p10.message)
    end)
end
v2.CreateController(u5.new())
return nil