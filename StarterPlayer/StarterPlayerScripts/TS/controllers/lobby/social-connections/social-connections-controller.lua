local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ImageId
local u4 = v2.preloadImages
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.PolicyService
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SocialConnectionsController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    u11.constructor(p18)
    p18.Name = "SocialConnectionsController"
    p18.remotes = u13.Client:GetNamespace("SocialConnections")
    p18.policyDiscordAllowed = false
    p18.completed = false
end
function u15.KnitStart(u19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u1
        [3] = u10
        [4] = u9
        [5] = u4
        [6] = u3
    --]]
    u11.KnitStart(u19)
    u1.Promise.defer(function() --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u10
            [3] = u9
        --]]
        u19.policyDiscordAllowed = table.find(u10:GetPolicyInfoForPlayerAsync(u9.LocalPlayer).AllowedExternalLinkReferences, "Discord") ~= nil
    end)
    u19.remotes:WaitFor("GetSocialConnections"):andThen(function(p20) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:updateSocialConnectionsReducer((p20:CallServer()))
    end)
    u19.remotes:WaitFor("SocialConnectionsUpdate"):andThen(function(p21) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        p21:Connect(function(p22) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19:updateSocialConnectionsReducer(p22)
        end)
    end)
    u4({ u3.CHECK_CIRCLE_SOLID, u3.UNLOCK_SOLID })
end
u15.getJoinedGroupStatus = u1.async(function(u23) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v24 = u23.remotes:WaitFor("VerifyJoinedGroup")
    return u1.await(v24:andThen(function(p25) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v26 = p25:CallServer()
        u23:updateJoinedGroupStore(v26)
        return v26
    end))
end)
function u15.updateSocialConnectionsReducer(_, p27) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12:dispatch({
        ["type"] = "SocialConnectionsSetAll",
        ["supportTasks"] = p27.supportTasks,
        ["connections"] = p27.connections
    })
end
function u15.updateJoinedGroupStore(p28, p29) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u14
    --]]
    if u12:getState().SocialConnections.supportTasks.joinedGroup ~= p29 then
        return nil
    end
    if p29 == true then
        u5:playSound(u14.INFO_NOTIFICATION)
    end
    local v30 = {
        ["type"] = "SetSomeSupportTasks",
        ["supportTasks"] = {
            ["joinedGroup"] = p29
        }
    }
    u12:dispatch(v30)
    if p28:isSocialConnectionsCompleted() then
        p28:giveCompletedReward()
    end
end
function u15.updateDiscordStore(p31, p32) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v33 = u12
    local v34 = {
        ["type"] = "SetSomeConnections"
    }
    local v35 = {
        ["discord"] = {
            ["verificationCode"] = p32.verificationCode,
            ["validated"] = p32.validated,
            ["legacyDiscordVerification"] = p32.legacyDiscordVerification
        }
    }
    v34.connections = v35
    v33:dispatch(v34)
    if p31:isSocialConnectionsCompleted() then
        p31:giveCompletedReward()
    end
end
function u15.isSocialConnectionsCompleted(_, p36) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
    --]]
    local v37, v38
    if p36 then
        v37 = p36.supportTasks
        v38 = p36.connections
    else
        local v39 = u12:getState().SocialConnections
        v37 = v39.supportTasks
        v38 = v39.connections
    end
    local v40 = true
    for v41, v42 in u7.values(v37) do
        local _ = v41 - 1
        if v42 ~= true then
            v40 = false
            break
        end
    end
    local v43 = true
    for v44, v45 in u7.values(v38) do
        local _ = v44 - 1
        if v45.validated ~= true then
            v43 = false
            break
        end
    end
    return v40 and v43
end
function u15.giveCompletedReward(p46) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u14
    --]]
    u5:playSound(u14.BEDWARS_UPGRADE_SUCCESS)
    p46.completed = true
end
v6.CreateController(u15.new())
return nil