-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TabsComponent = v1.TabsComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanWarActiveWarInfo = RuntimeLib.import(script, script.Parent, "clan-war-active-war-info").ClanWarActiveWarInfo;
local ClanWarPlayerMissions = RuntimeLib.import(script, script.Parent, "clan-war-player-missions").ClanWarPlayerMissions;
local ClanWarLeaderboard = RuntimeLib.import(script, script.Parent, "leaderboard", "clan-war-leaderboard").ClanWarLeaderboard;
local v6 = {};
local u7 = setmetatable({}, {
    __index = v6
});
u7.WAR = "war";
v6.war = "WAR";
u7.LEADERBOARD = "leaderboard";
v6.leaderboard = "LEADERBOARD";
u7.MISSIONS = "missions";
v6.missions = "MISSIONS";

local function v40(p8, p9) -- Line: 32
    -- upvalues: u7 (ref), u3 (copy), ClanWarUtils (copy), DeviceUtil (copy), default (copy), u4 (copy), ColorUtil (copy), Theme (copy), u2 (copy), TabsComponent (copy), ClanWarActiveWarInfo (copy), ClanWarLeaderboard (copy), ClanWarPlayerMissions (copy), Empty (copy), ClanProfilePageLayout (copy)
    local useState = p9.useState;
    local useEffect = p9.useEffect;
    local v10, u11 = useState(u7.WAR);
    local v12, u13 = useState(nil);
    local u14 = u3.new();
    local u15 = ClanWarUtils.getActiveClanWarId();
    local v16 = ClanWarUtils.areClanWarsDisabled();
    local myClanId = p8.store.Clans.myClanId;
    useEffect(function() -- Line: 42
        -- upvalues: u15 (copy), DeviceUtil (ref), default (ref), u13 (copy), u14 (copy), myClanId (copy)
        if u15 == "" or not u15 then
            return nil;
        end;

        if not DeviceUtil.isHoarceKat() then
            default.Client:Get("RequestClanWarInfo"):CallServerAsync():andThen(function(p17) -- Line: 48
                -- upvalues: u13 (ref)
                if p17 then
                    u13(p17);
                end;
            end);
        end;

        if not DeviceUtil.isHoarceKat() then
            u14:GiveTask(default.Client:Get("SendClanWarInfo"):Connect(function(p18) -- Line: 56
                -- upvalues: u13 (ref)
                u13(p18.clanWarInfo);
            end));
        end;

        u14:GiveTask(function() -- Line: 61
            -- upvalues: DeviceUtil (ref), myClanId (ref), default (ref)
            local v19 = not DeviceUtil.isHoarceKat() and myClanId;

            if v19 ~= "" and v19 then
                default.Client:Get("UnsubscribeClanWarInfo"):CallServerAsync(myClanId);
            end;
        end);

        return function() -- Line: 67
            -- upvalues: u14 (ref)
            u14:DoCleaning();
        end;
    end, {});
    local v20 = {
        PaddingBottom = true
    };
    local v21 = {};
    local v22 = #v21;
    local v23;

    if v16 then
        v23 = u4.createElement("TextLabel", {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            SizeConstraint = "RelativeYY",
            Size = UDim2.fromScale(1, 0.25),
            Text = "<b>CLAN WARS CURRENTLY <font color=\"" .. ColorUtil.richTextColor(Theme.mcRed) .. "\">DISABLED</font></b>",
            TextColor3 = ColorUtil.WHITE,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        });
    else
        v23 = v16;
    end;

    if v23 then
        v21[v22 + 1] = v23;
    end;

    local v24 = #v21;
    local v25 = not v16;

    if v25 then
        local v26 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v27 = { u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v28 = #v27;
        local v29 = u2.values(u7);

        local function _(p30, p31) -- Line: 112
            return {
                value = p30,
                text = string.upper(p30),
                layoutOrder = p31
            };
        end;

        local v32 = table.create(#v29);
        local v33 = {
            Value = v10
        };

        for i, v in v29 do
            v32[i] = {
                value = v,
                text = string.upper(v),
                layoutOrder = i - 1
            };
        end;

        v33.Tabs = v32;

        function v33.OnChange(p34) -- Line: 126
            -- upvalues: u11 (copy)
            u11(p34.value);
        end;

        v33.FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.08)
        };
        v33.UIListLayout = {
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        };
        v27[v28 + 1] = u4.createElement(TabsComponent, v33);
        local v35;

        if v10 == u7.WAR then
            v35 = u4.createElement(ClanWarActiveWarInfo, {
                store = p8.store,
                ActiveClanWar = v12
            });
        else
            v35 = u4.createFragment();
        end;

        v27[v28 + 2] = v35;
        local v36 = #v27;
        local v37;

        if v10 == u7.LEADERBOARD then
            v37 = u4.createElement(ClanWarLeaderboard);
        else
            v37 = false;
        end;

        if v37 then
            v27[v36 + 1] = v37;
        end;

        local v38 = #v27;
        local v39;

        if v10 == u7.MISSIONS then
            v39 = u4.createElement(ClanWarPlayerMissions, {
                store = p8.store
            });
        else
            v39 = false;
        end;

        if v39 then
            v27[v38 + 1] = v39;
        end;

        v25 = u4.createElement(Empty, v26, v27);
    end;

    if v25 then
        v21[v24 + 1] = v25;
    end;

    return u4.createElement(ClanProfilePageLayout, v20, v21);
end;

return {
    ClanWarTab = v5.new(u4)(v40)
};