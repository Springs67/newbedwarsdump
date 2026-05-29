local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "afk-place-hud").AfkPlaceHud
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "AfkPlaceUiController"
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
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p11)
    p11.Name = "AfkPlaceUiController"
    p11.remotes = u6.Client:GetNamespace("AfkPlace")
    p11.battlePassRemotes = u6.Client:GetNamespace("BattlePass")
end
function u8.KnitStart(u12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.KnitStart(u12)
    u12.remotes:WaitFor("GetAfkTimes"):andThen(function(p13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
        --]]
        local u14 = p13:CallServer()
        if u5.isActiveBattlePass() then
            u12.battlePassRemotes:WaitFor("GetBattlePass"):andThen(function(p15) --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u14
                --]]
                local v16 = p15:CallServer()
                u12:mountAfkHud(u14[1], u14[2], u14[3], v16)
            end)
        else
            u12:mountAfkHud(u14[1], u14[2], u14[3])
        end
    end)
end
function u8.mountAfkHud(_, p17, p18, p19, p20) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "AfkPlaceBackground",
        ["app"] = u7
    }, {
        ["DailyAfkTime"] = p17,
        ["MountStartTime"] = os.time(),
        ["AfkCoinStart"] = p18,
        ["BedCoinStart"] = p19,
        ["BattlePassDto"] = p20
    })
end
function u8.unmountAfkHud(_) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("AfkPlaceBackground")
end
v3.CreateController(u8.new())
return nil