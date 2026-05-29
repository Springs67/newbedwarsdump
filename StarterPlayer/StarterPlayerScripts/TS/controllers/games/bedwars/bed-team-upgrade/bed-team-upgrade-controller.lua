local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "BedTeamUpgradeController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
    --]]
    u6.constructor(p12)
    p12.Name = "BedTeamUpgradeController"
    p12.requestPurchaseBedTeamUpgradeRemote = u8.Client:Get("RequestPurchaseBedTeamUpgrade")
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u4
        [4] = u5
        [5] = u7
    --]]
    u6.KnitStart(p13)
    u8.Client:OnEvent("BedTeamUpgradeChanged", function(p14, p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
            [3] = u7
        --]]
        local v16 = u4.Controllers.TeamController:getPlayerTeam(u5.LocalPlayer)
        if v16 ~= nil then
            v16 = v16.id
        end
        if p14 == v16 then
            u7:dispatch({
                ["type"] = "SetMyBedTeamUpgrades",
                ["myBedTeamUpgrades"] = p15
            })
        end
        u7:dispatch({
            ["type"] = "BedwarsSetBedTeamUpgrades",
            ["teamId"] = p14,
            ["bedTeamUpgrades"] = p15
        })
    end)
end
function u9.requestPurchaseBedTeamUpgrade(p17, p18) --[[ Line: 53 ]]
    return p17.requestPurchaseBedTeamUpgradeRemote:CallServer(p18)
end
v3.CreateController(u9.new())
return nil