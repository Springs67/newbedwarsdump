-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanCreateTab = RuntimeLib.import(script, script.Parent, "create", "clan-create-tab").ClanCreateTab;
local ClanMenuInvites = RuntimeLib.import(script, script.Parent, "invites", "clan-menu-invites").ClanMenuInvites;
local ClanMenuSearchTab = RuntimeLib.import(script, script.Parent, "search", "clan-menu-search-tab").ClanMenuSearchTab;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.SEARCH = "search";
v5.search = "SEARCH";
u6.INVITES = "invites";
v5.invites = "INVITES";
u6.CREATE = "create";
v5.create = "CREATE";
local u7 = {
    {
        text = "Search",
        layoutOrder = 1,
        value = u6.SEARCH
    },
    {
        text = "Invites",
        layoutOrder = 2,
        value = u6.INVITES
    },
    {
        text = "Create",
        layoutOrder = 3,
        value = u6.CREATE
    }
};

local function v28(u8, p9) -- Line: 43
    -- upvalues: u6 (ref), u2 (copy), u7 (copy), Theme (copy), u3 (copy), ScaleComponent (copy), Flamework (copy), SoundManager (copy), GameSound (copy), ClanMenuSearchTab (copy), ClanMenuInvites (copy), ClanCreateTab (copy), Empty (copy), WidgetComponent (copy)
    local _ = p9.useEffect;
    local v10, u11 = p9.useState(u8.StartingTab or u6.SEARCH);

    local function _(p12) -- Line: 48
        -- upvalues: u6 (ref), u8 (copy)
        return p12.value == u6.SEARCH or u8.store.Clans.myClanId == nil;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in u2.values(u7) do
        local _ = i - 1;

        if (v.value == u6.SEARCH or u8.store.Clans.myClanId == nil) == true then
            v13 = v13 + 1;
            v14[v13] = v;
        end;
    end;

    local v15 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Theme.widgetSize
    };
    local v16 = { u3.createElement(ScaleComponent, {
            MaximumSize = Theme.widgetScaleComponentMaxSize,
            ScreenPadding = Theme.widgetScaleComponentScreenPadding
        }) };
    local v18 = {
        ClipsDescendents = true,
        Title = "Clan Menu",
        AppId = u8.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 86, Name: OnClose
            -- upvalues: Flamework (ref), u8 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u8.AppId);
        end,

        Navbar = {
            Value = v10,
            Tabs = v14,
            UIListLayout = {
                Padding = UDim.new(0.09, 0)
            },

            OnChange = function(p17) -- Line: 95, Name: OnChange
                -- upvalues: u11 (copy), SoundManager (ref), GameSound (ref)
                u11(p17.value);
                SoundManager:playSound(GameSound.UI_CLICK);
            end
        }
    };
    local v19 = {};
    local _ = #v19;
    local v20 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v21 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.03, 0),
            PaddingBottom = UDim.new(0.04, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }) };
    local v22 = #v21;
    local v23;

    if v10 == u6.SEARCH then
        v23 = u3.createElement(ClanMenuSearchTab);
    else
        v23 = false;
    end;

    if v23 then
        v21[v22 + 1] = v23;
    end;

    local v24 = #v21;
    local v25;

    if v10 == u6.INVITES and u8.store.Clans.myClanId == nil then
        v25 = u3.createElement(ClanMenuInvites, {
            AppId = "ClanMenuInvites"
        });
    else
        v25 = false;
    end;

    if v25 then
        v21[v24 + 1] = v25;
    end;

    local v26 = #v21;
    local v27;

    if v10 == u6.CREATE and u8.store.Clans.myClanId == nil then
        v27 = u3.createElement(ClanCreateTab, {
            store = u8.store
        });
    else
        v27 = false;
    end;

    if v27 then
        v21[v26 + 1] = v27;
    end;

    v19.Content = u3.createElement(Empty, v20, v21);
    v16[#v16 + 1] = u3.createElement(WidgetComponent, v18, v19);

    return u3.createElement("Frame", v15, v16);
end;

return {
    ClanMenuTab = u6,
    ClanMenu = v4.new(u3)(v28)
};