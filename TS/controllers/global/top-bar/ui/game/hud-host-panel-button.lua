-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local TopBarButton = v1.TopBarButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role");
local CustomMatchRole = v5.CustomMatchRole;
local CustomMatchRoleAttribute = v5.CustomMatchRoleAttribute;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v15 = v3.new(u2)(function(u6, p7) -- Line: 18
    -- upvalues: DeviceUtil (copy), KnitClient (copy), Players (copy), CustomMatchRoleAttribute (copy), CustomMatchRole (copy), u2 (copy), TopBarButton (copy), Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy)
    local useEffect = p7.useEffect;
    local v8, u9 = p7.useState(false);
    useEffect(function() -- Line: 22
        -- upvalues: DeviceUtil (ref), KnitClient (ref), u9 (copy), Players (ref), CustomMatchRoleAttribute (ref), CustomMatchRole (ref)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u10 = KnitClient.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist", "director", "tester" });

        if u10 then
            u9(true);

            return nil;
        end;

        local u12 = Players.LocalPlayer:GetAttributeChangedSignal(CustomMatchRoleAttribute):Connect(function() -- Line: 34
            -- upvalues: Players (ref), CustomMatchRoleAttribute (ref), u9 (ref), u10 (copy), CustomMatchRole (ref)
            local v11 = Players.LocalPlayer:GetAttribute(CustomMatchRoleAttribute);
            u9(u10 or (v11 == CustomMatchRole.COHOST and true or v11 == CustomMatchRole.HOST));
        end);

        return function() -- Line: 38
            -- upvalues: u12 (ref)
            u12:Disconnect();
        end;
    end, {});
    useEffect(function() -- Line: 42
        -- upvalues: u6 (copy), Players (ref), u9 (copy)
        local LocalPlayerId = u6.LocalPlayerId;

        if LocalPlayerId == nil then
            LocalPlayerId = Players.LocalPlayer.UserId;
        end;

        if LocalPlayerId == u6.CustomHostUserId then
            u9(true);
        end;
    end, { u6.CustomHostUserId });
    local v13 = {};
    local v14 = #v13;

    if v8 then
        v8 = u2.createElement(TopBarButton, {
            Text = "HOST PANEL",
            LayoutOrder = u6.LayoutOrder,

            OnClick = function() -- Line: 58, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CUSTOM_MATCH_HOST_PANEL, {});
                SoundManager:playSound(GameSound.UI_OPEN_2);
            end
        });
    end;

    if v8 then
        v13[v14 + 1] = v8;
    end;

    return u2.createFragment(v13);
end);

return {
    HudHostPanelButton = v4.connect(function(p16, p17) -- Line: 69
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        local customMatch = p16.Game.customMatch;

        if customMatch ~= nil then
            customMatch = customMatch.hostUserId;
        end;

        v18.CustomHostUserId = customMatch;

        return v18;
    end)(v15)
};