local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil
local u10 = v1.import(script, script.Parent, "ui", "reward-notification").RewardNotification
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "RewardNotificationController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "RewardNotificationController"
    p14.rewardsDisplayed = {}
end
function u11.KnitStart(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u5
        [4] = u7
        [5] = u9
        [6] = u2
        [7] = u10
        [8] = u3
    --]]
    u6.KnitStart(p15)
    u8.Client:Get("RewardNotification"):Connect(function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u9
            [4] = u2
            [5] = u10
            [6] = u3
        --]]
        if u5:IsStudio() then
            return nil
        end
        local v17 = u7
        local v18 = p16.rewards
        local v19 = table.create(#v18)
        local v20 = {
            ["type"] = "LobbyAddRewardsToDisplay"
        }
        for v21, v22 in v18 do
            local _ = v21 - 1
            local v23 = {}
            for v24, v25 in v22 do
                v23[v24] = v25
            end
            v23.id = u9.generateId(5)
            v19[v21] = v23
        end
        v20.rewards = v19
        v17:dispatch(v20)
        if p16.rewards == nil or #p16.rewards == 0 then
            return nil
        end
        if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("RewardNotification") then
            local v26 = {
                ["appId"] = "RewardNotification",
                ["app"] = u10
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v26, {}, u3.OVERLAY)
        end
    end)
end
function u11.getRewardsDisplayed(p27) --[[ Line: 70 ]]
    return p27.rewardsDisplayed
end
function u11.addRewardDisplayed(p28, p29) --[[ Line: 73 ]]
    local v30 = p28.rewardsDisplayed
    if table.find(v30, p29) == nil then
        local v31 = p28.rewardsDisplayed
        table.insert(v31, p29)
    end
end
v4.CreateController(u11.new())
return nil