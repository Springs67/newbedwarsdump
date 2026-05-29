local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "AutoCompleteDropdownController"
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
    p9.Name = "AutoCompleteDropdownController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p10)
end
function u6.openAutoCompleteDropdownMenu(p11, p12, p13, p14, p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    p11:closeAutoCompleteDropdownMenu()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u5.AUTO_COMPLETE_DROPDOWN, {
        ["Items"] = p12,
        ["DescribeItem"] = p13,
        ["OnSelect"] = p14,
        ["AdditionalElements"] = p15
    })
end
function u6.closeAutoCompleteDropdownMenu(_) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AUTO_COMPLETE_DROPDOWN)
end
v3.CreateController(u6.new())
return nil