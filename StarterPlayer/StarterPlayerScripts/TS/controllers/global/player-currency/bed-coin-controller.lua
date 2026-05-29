local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "BedCoinController"
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
        [2] = u4
    --]]
    u5.constructor(p11)
    p11.Name = "BedCoinController"
    p11.bedCoins = nil
    p11.bedCoinsUpdateSignal = u4.new()
end
function u8.KnitStart(u12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u3
        [4] = u6
    --]]
    u5.KnitStart(u12)
    u7.Client:Get("BedCoinsUpdate"):Connect(function(p13, p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u12
        --]]
        if u3.LocalPlayer == p13 then
            local v15 = {
                ["type"] = "BedwarsSetSome",
                ["data"] = {
                    ["bedCoins"] = p14
                }
            }
            u6:dispatch(v15)
            u12.bedCoinsUpdateSignal:Fire(p14)
            u12.bedCoins = p14
        end
    end)
end
function u8.getBedCoins(p16) --[[ Line: 44 ]]
    return p16.bedCoins
end
function u8.waitForBedCoins(p17) --[[ Line: 47 ]]
    local v18 = p17.bedCoins
    if v18 == 0 or (v18 ~= v18 or not v18) then
        return p17.bedCoinsUpdateSignal:Wait()
    else
        return p17.bedCoins
    end
end
v2.CreateController(u8.new())
return nil