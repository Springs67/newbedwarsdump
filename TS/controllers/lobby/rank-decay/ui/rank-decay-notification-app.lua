-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local RankDecayNotification = RuntimeLib.import(script, script.Parent, "rank-decay-notification").RankDecayNotification;
local v9 = v2.new(u1)(function(u4, p5) -- Line: 9
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), u1 (copy), RankDecayNotification (copy)
    local useCallback = p5.useCallback;
    local useEffect = p5.useEffect;
    local u6 = p5.useValue(false);
    local u7 = useCallback(function() -- Line: 14
        -- upvalues: u6 (copy), u4 (copy), Flamework (ref), BedwarsAppIds (ref)
        if u6.value then
            return nil;
        end;

        u6.value = true;
        local onClose = u4.onClose;

        if onClose ~= nil then
            onClose();
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.RANK_DECAY_NOTIFICATION_APP);
    end, { u4.onClose });
    useEffect(function() -- Line: 25
        -- upvalues: u4 (copy), u7 (copy)
        local durationSeconds = u4.durationSeconds;

        if durationSeconds == nil then
            return nil;
        end;

        local u8 = task.delay(durationSeconds, function() -- Line: 30
            -- upvalues: u7 (ref)
            u7();
        end);

        return function() -- Line: 33
            -- upvalues: u8 (copy)
            task.cancel(u8);
        end;
    end, { u4.durationSeconds, u7 });

    return u1.createElement(RankDecayNotification, {
        title = u4.title,
        body = u4.body,
        accentColor = u4.accentColor,
        rankDivision = u4.rankDivision,
        onClose = u7
    });
end);

return {
    RankDecayNotificationApp = v3.connect(function(p10, p11) -- Line: 46
        local v12 = {};

        for i, v in p11 do
            v12[i] = v;
        end;

        v12.store = p10;

        return v12;
    end)(v9)
};