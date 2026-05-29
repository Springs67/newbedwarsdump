local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SettingsController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, ...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.constructor(p13, ...)
    p13.Name = "SettingsController"
    p13.getSettingsEvent = u4.new()
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u7
    --]]
    u6.KnitStart(u14)
    u8.Client:WaitFor("GetSettings"):andThen(function(p15) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
        --]]
        local v16 = p15:CallServer()
        if v16 then
            u7:dispatch({
                ["type"] = "SettingsUpdateAll",
                ["settings"] = v16
            })
            u14.settings = v16
            u14.getSettingsEvent:Fire(v16)
        end
    end)
end
function u10.getSetting(p17, p18) --[[ Line: 46 ]]
    local v19 = p17.settings
    if v19 ~= nil then
        v19 = v19[p18]
    end
    return v19
end
function u10.getSettings(p20) --[[ Line: 53 ]]
    return p20.settings
end
function u10.waitForSettings(p21) --[[ Line: 56 ]]
    if p21.settings then
        return p21.settings
    else
        return p21.getSettingsEvent:Wait()
    end
end
function u10.waitForSettingsAsync(u22) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.Promise.new(function(p23) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if u22.settings then
            p23(u22.settings)
        else
            p23((u22.getSettingsEvent:Wait()))
        end
    end)
end
function u10.setSetting(p24, p25, p26) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u8
    --]]
    local u27 = p24:waitForSettings()
    u27[p25] = p26
    local v28 = {
        ["type"] = "SettingsUpdateSome",
        ["settings"] = {
            [p25] = p26
        }
    }
    u7:dispatch(v28)
    u5.SettingChanged:fire(p25, p26)
    p24:onSettingChange(p25, p26)
    u8.Client:WaitFor("SetSettings"):andThen(function(p29) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        p29:SendToServer(u27)
    end)
end
function u10.onSettingChange(_, p30, p31) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
    --]]
    if p30 == u9.FRIEND_NOTIFICATIONS then
        u2.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setShowNotifications(p31)
    end
end
v3.CreateController(u10.new())
return nil