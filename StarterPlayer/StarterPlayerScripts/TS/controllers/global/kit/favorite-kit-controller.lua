local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FavoriteKitController"
    end,
    ["__index"] = u3
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
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "FavoriteKitController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p10)
    p10:updateStore()
end
function u6.updateStore(_) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v11 = u5.Client:Get("GetFavoriteKits"):CallServer()
    if not v11 then
        return nil
    end
    local v12 = {
        ["type"] = "BedwarsSetSome",
        ["data"] = {
            ["favoriteKits"] = v11
        }
    }
    u4:dispatch(v12)
end
v2.CreateController(u6.new())
return nil