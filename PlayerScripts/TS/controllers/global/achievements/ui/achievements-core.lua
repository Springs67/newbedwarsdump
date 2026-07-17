-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AchievementsList = RuntimeLib.import(script, script.Parent, "achievements-list").AchievementsList;
local AchievementsSidebar = RuntimeLib.import(script, script.Parent, "sidebar", "achievements-sidebar").AchievementsSidebar;
local v20 = v3.new(u2)(function(u5, p6) -- Line: 17
    -- upvalues: DeviceUtil (copy), AchievementId (copy), default (copy), Players (copy), ClientStore (copy), u2 (copy), SoundManager (copy), GameSound (copy), AchievementsList (copy), AchievementsSidebar (copy), Empty (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7;

    if DeviceUtil.isHoarceKat() then
        v7 = AchievementId.MULTIKILLCHAIN_1;
    else
        v7 = nil;
    end;

    local u8, u9 = useState(v7);
    local u10;

    if u5.ViewingAsLocalPlayer then
        u10 = u5.store.Lobby.profileData;
    else
        u10 = u5.ProfileData or u5.store.Lobby.currentlyViewingProfileData;
    end;

    useEffect(function() -- Line: 22
        -- upvalues: u10 (ref), u5 (copy), default (ref), Players (ref), ClientStore (ref)
        if not u10 and u5.ViewingAsLocalPlayer then
            task.spawn(function() -- Line: 24
                -- upvalues: default (ref), Players (ref), ClientStore (ref), u10 (ref)
                default.Client:Get("RequestProfileData"):CallServerAsync(Players.LocalPlayer):andThen(function(p11) -- Line: 25
                    -- upvalues: ClientStore (ref), u10 (ref)
                    if p11 then
                        ClientStore:dispatch({
                            type = "LobbySetProfileData",
                            profileData = p11
                        });
                        u10 = p11;
                    end;
                end);
            end);
        end;
    end);
    local v12 = {
        Size = UDim2.fromScale(1, 1)
    };
    local FrameProps = u5.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v12[i] = v;
        end;
    end;

    local v13 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v14 = #v13;
    local v15 = {};
    local v16 = {};
    local v17;

    if u5.ViewingOnProfile then
        v17 = UDim2.fromScale(1, 1);
    else
        v17 = UDim2.fromScale(0.7, 1) - UDim2.fromOffset(10, 0);
    end;

    v16.Size = v17;
    v15.FrameProps = v16;
    v15.ProfileData = u10;

    function v15.OnSelect(p18) -- Line: 70
        -- upvalues: u8 (copy), u9 (copy), SoundManager (ref), GameSound (ref)
        if p18 == u8 then
            u9(nil);
        else
            u9(p18);
        end;

        SoundManager:playSound(GameSound.UI_CLICK_2);
    end;

    v15.Selected = u8;
    v15.ViewingOnProfile = u5.ViewingOnProfile;
    v13[v14 + 1] = u2.createElement(AchievementsList, v15);
    local v19 = u10 and not u5.ViewingOnProfile and u2.createElement(AchievementsSidebar, {
        FrameProps = {
            Size = UDim2.fromScale(0.3, 1)
        },
        ProfileData = u10,
        SelectedAch = u8
    });

    if v19 then
        v13[v14 + 2] = v19;
    end;

    return u2.createElement(Empty, v12, v13);
end);

return {
    AchievementsCore = v4.connect(function(p21, p22) -- Line: 94
        local v23 = {};

        for i, v in p22 do
            v23[i] = v;
        end;

        v23.store = p21;

        return v23;
    end)(v20)
};