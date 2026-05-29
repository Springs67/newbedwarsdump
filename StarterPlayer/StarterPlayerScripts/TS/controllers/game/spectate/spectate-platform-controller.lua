local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "SpectatePlatformController"
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
    p8.Name = "SpectatePlatformController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p9)
end
function u5.getSpectatorPlatform(_) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3:FindFirstChild("SpectatorPlatform")
end
function u5.getCreditsFolder(p10) --[[ Line: 30 ]]
    local v11 = p10:getSpectatorPlatform()
    if v11 then
        return v11.Credits
    else
        return nil
    end
end
v2.CreateController(u5.new())
return nil