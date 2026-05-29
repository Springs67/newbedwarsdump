local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "RankDecayNotificationController"
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
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11, ...)
    p11.Name = "RankDecayNotificationController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u6
    --]]
    u4.KnitStart(u12)
    u7.Client:Get("RankDecayWarning"):Connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        local v14 = u6[p13.rankDivision].name
        local v15
        if p13.daysUntilDecay == 1 then
            v15 = "1 day"
        else
            local v16 = p13.daysUntilDecay
            v15 = tostring(v16) .. " days"
        end
        u12:showNotification("Rank decay warning", "You will start decaying in " .. v15 .. ". Play a ranked match to keep " .. v14 .. ".", Color3.fromRGB(255, 196, 79), p13.rankDivision)
    end)
    u7.Client:Get("RankDecayApplied"):Connect(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        local v18 = u6[p17.newDivision].name
        local v19 = u6[p17.oldDivision].name
        local v20 = u12
        local v21 = p17.decayAmount
        local v22 = tostring(v21)
        local v23 = p17.newRankPoints % 100
        local v24 = tostring(v23)
        local v25 = p17.oldRankPoints % 100
        v20:showNotification("Rank decay applied", "-" .. v22 .. " RP. New rank: " .. v18 .. " " .. v24 .. "RP from " .. v19 .. " " .. tostring(v25) .. "RP.", Color3.fromRGB(255, 84, 84), p17.newDivision)
    end)
end
function u8.showNotification(_, p26, p27, p28, p29, p30) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u7
    --]]
    local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    if v31:isAppOpen(u5.RANK_DECAY_NOTIFICATION_APP) then
        v31:closeApp(u5.RANK_DECAY_NOTIFICATION_APP)
    end
    local v32 = {
        ["title"] = p26,
        ["body"] = p27,
        ["accentColor"] = p28,
        ["durationSeconds"] = p30,
        ["rankDivision"] = p29,
        ["onClose"] = function() --[[ Name: onClose, Line 51 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            return u7.Client:Get("RankDecayNotificationClosed"):SendToServer()
        end
    }
    v31:openApp(u5.RANK_DECAY_NOTIFICATION_APP, v32)
end
v3.CreateController(u8.new())
return nil