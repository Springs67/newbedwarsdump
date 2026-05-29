local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Promise
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "UgcController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "UgcController"
    p11.cachedOwnedUgcData = false
end
function u8.KnitStart(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
    --]]
    u5.KnitStart(u12)
    u7.Client:Get("SendOwnedUGC"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        u6:dispatch({
            ["type"] = "LobbySetOwnedUGC",
            ["ugc"] = p13
        })
        u12.cachedOwnedUgcData = true
    end)
end
function u8.hasRequestedOwnedUgcData(p14) --[[ Line: 38 ]]
    return p14.cachedOwnedUgcData
end
function u8.getOwnedUGC(p15, p16) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    if p15.cachedOwnedUgcData and not p16 then
        return u4.new(function(p17) --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            return p17(u6:getState().Lobby.ownedUGC)
        end)
    else
        return p15:requestOwnedUgcData()
    end
end
function u8.requestOwnedUgcData(u18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v19 = u7.Client:Get("GetOwnedUGCRequest"):CallServerAsync()
    v19:andThen(function(p20) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u18
        --]]
        u6:dispatch({
            ["type"] = "LobbySetOwnedUGC",
            ["ugc"] = p20
        })
        u18.cachedOwnedUgcData = true
    end)
    return v19
end
v3.CreateController(u8.new())
return nil