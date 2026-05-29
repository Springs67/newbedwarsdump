local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u7 = v1.import(script, script.Parent, "rank-decay-notification").RankDecayNotification
local v17 = v4.new(u3)(function(u8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u3
        [4] = u7
    --]]
    local v10 = p9.useCallback
    local v11 = p9.useEffect
    local u12 = p9.useValue(false)
    local u14 = v10(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u8
            [3] = u2
            [4] = u6
        --]]
        if u12.value then
            return nil
        end
        u12.value = true
        local v13 = u8.onClose
        if v13 ~= nil then
            v13()
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.RANK_DECAY_NOTIFICATION_APP)
    end, { u8.onClose })
    v11(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
        --]]
        local v15 = u8.durationSeconds
        if v15 == nil then
            return nil
        end
        local u16 = task.delay(v15, function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14()
        end)
        return function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            task.cancel(u16)
        end
    end, { u8.durationSeconds, u14 })
    return u3.createElement(u7, {
        ["title"] = u8.title,
        ["body"] = u8.body,
        ["accentColor"] = u8.accentColor,
        ["rankDivision"] = u8.rankDivision,
        ["onClose"] = u14
    })
end)
return {
    ["RankDecayNotificationApp"] = v5.connect(function(p18, p19) --[[ Line: 46 ]]
        local v20 = {}
        for v21, v22 in p19 do
            v20[v21] = v22
        end
        v20.store = p18
        return v20
    end)(v17)
}