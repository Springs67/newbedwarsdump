-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local AutoSizedText = v1.AutoSizedText;
local DarkBackground = v1.DarkBackground;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local TabsComponent = v1.TabsComponent;
local TooltipContainer = v1.TooltipContainer;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local ItemToolTip = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local items = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v6 = u2.entries(items);

local function _(p7, p8) -- Line: 25
    local _ = p8[1];
    local v9 = p8[2];

    if v9.removeFromCustoms then
        return p7;
    end;

    table.insert(p7, v9.displayName);

    return p7;
end;

local u10 = {};

for i = 1, #v6 do
    local v11 = v6[i];
    local _ = i - 1;
    local _ = v11[1];
    local v12 = v11[2];

    if not v12.removeFromCustoms then
        table.insert(u10, v12.displayName);
    end;
end;

local v13 = {};
local u14 = setmetatable({}, {
    __index = v13
});
u14.ALL = "All";
v13.All = "ALL";
u14.BLOCKS = "Blocks";
v13.Blocks = "BLOCKS";
u14.COMBAT = "Combat";
v13.Combat = "COMBAT";
u14.CONSUMABLES = "Consumables";
v13.Consumables = "CONSUMABLES";
u14.TOOLS = "Tools";
v13.Tools = "TOOLS";
u14.GADGETS = "Gadgets";
v13.Gadgets = "GADGETS";

local function v90(u15, p16) -- Line: 63
    -- upvalues: u14 (ref), u2 (copy), items (copy), u3 (copy), DarkBackground (copy), ScaleComponent (copy), Flamework (copy), TabsComponent (copy), u10 (copy), AutoCompleteSearchbar (copy), KnitClient (copy), Theme (copy), ItemToolTip (copy), AutoCanvasScrollingFrame (copy), WidgetComponent (copy), BedwarsImageId (copy), BedwarsAppIds (copy), TooltipContainer (copy), AutoSizedText (copy), SlideIn (copy)
    local useState = p16.useState;
    local useEffect = p16.useEffect;
    local u17, u18 = useState(u14.ALL);
    local _, u19 = useState({});
    local v20, u21 = useState({});
    local v22, u23 = useState("");
    useEffect(function() -- Line: 70
        -- upvalues: u17 (copy), u14 (ref), u2 (ref), items (ref), u23 (copy), u19 (copy), u21 (copy)
        local v24 = {};

        if u17 == u14.BLOCKS then
            local function _(p25) -- Line: 74
                local _ = p25[1];
                local v26 = p25[2];
                local v27;

                if v26.block == nil then
                    v27 = false;
                else
                    v27 = not v26.removeFromCustoms;
                end;

                return v27;
            end;

            local v28 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];
                local v29 = v[2];
                local v30;

                if v29.block == nil then
                    v30 = false;
                else
                    v30 = not v29.removeFromCustoms;
                end;

                if v30 == true then
                    v28 = v28 + 1;
                    v24[v28] = v;
                end;
            end;
        elseif u17 == u14.COMBAT then
            local function _(p31) -- Line: 92
                local _ = p31[1];
                local v32 = p31[2];
                local v33;

                if (v32.sword or v32.projectileSource) == nil then
                    v33 = false;
                else
                    v33 = not v32.removeFromCustoms;
                end;

                return v33;
            end;

            local v34 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];
                local v35 = v[2];
                local v36;

                if (v35.sword or v35.projectileSource) == nil then
                    v36 = false;
                else
                    v36 = not v35.removeFromCustoms;
                end;

                if v36 == true then
                    v34 = v34 + 1;
                    v24[v34] = v;
                end;
            end;
        elseif u17 == u14.CONSUMABLES then
            local function _(p37) -- Line: 110
                local _ = p37[1];
                local v38 = p37[2];
                local v39;

                if v38.consumable == nil then
                    v39 = false;
                else
                    v39 = not v38.removeFromCustoms;
                end;

                return v39;
            end;

            local v40 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];
                local v41 = v[2];
                local v42;

                if v41.consumable == nil then
                    v42 = false;
                else
                    v42 = not v41.removeFromCustoms;
                end;

                if v42 == true then
                    v40 = v40 + 1;
                    v24[v40] = v;
                end;
            end;
        elseif u17 == u14.TOOLS then
            local function _(p43) -- Line: 128
                local _ = p43[1];
                local v44 = p43[2];
                local v45;

                if v44.breakBlock == nil then
                    v45 = false;
                else
                    v45 = not v44.removeFromCustoms;
                end;

                return v45;
            end;

            local v46 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];
                local v47 = v[2];
                local v48;

                if v47.breakBlock == nil then
                    v48 = false;
                else
                    v48 = not v47.removeFromCustoms;
                end;

                if v48 == true then
                    v46 = v46 + 1;
                    v24[v46] = v;
                end;
            end;
        elseif u17 == u14.GADGETS then
            local function _(p49) -- Line: 146
                local _ = p49[1];
                local v50 = p49[2];
                local v51;

                if v50.gadget == true then
                    v51 = not v50.removeFromCustoms;
                else
                    v51 = false;
                end;

                return v51;
            end;

            local v52 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];
                local v53 = v[2];
                local v54;

                if v53.gadget == true then
                    v54 = not v53.removeFromCustoms;
                else
                    v54 = false;
                end;

                if v54 == true then
                    v52 = v52 + 1;
                    v24[v52] = v;
                end;
            end;
        elseif u17 == u14.ALL then
            local function _(p55) -- Line: 164
                local _ = p55[1];

                return not p55[2].removeFromCustoms;
            end;

            local v56 = 0;
            v24 = {};

            for i, v in u2.entries(items) do
                local _ = i - 1;
                local _ = v[1];

                if not v[2].removeFromCustoms == true then
                    v56 = v56 + 1;
                    v24[v56] = v;
                end;
            end;
        end;

        table.sort(v24, function(p57, p58) -- Line: 182
            return p57[2].displayName < p58[2].displayName;
        end);
        u23("");
        u19(v24);
        u21(v24);
    end, { u17 });

    local function v64(p59, u60) -- Line: 190
        -- upvalues: u18 (copy), u14 (ref), u2 (ref), items (ref), u21 (copy), u23 (copy)
        u18(u14.ALL);

        local function _(p61) -- Line: 193
            -- upvalues: u60 (copy)
            local _ = p61[1];

            return table.find(u60, p61[2].displayName) ~= nil;
        end;

        local v62 = 0;
        local v63 = {};

        for i, v in u2.entries(items) do
            local _ = i - 1;
            local _ = v[1];

            if table.find(u60, v[2].displayName) ~= nil == true then
                v62 = v62 + 1;
                v63[v62] = v;
            end;
        end;

        u21(v63);
        u23(p59);
    end;

    local v65 = { u3.createElement(DarkBackground, {
            AppId = u15.AppId
        }) };
    local v66 = {};
    local v67 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(640, 440)
    };
    local v68 = { u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(704, 484.00000000000006),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v69 = {
        ClipsDescendents = false,
        Title = "Creative Inventory",
        AppId = u15.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 244, Name: OnClose
            -- upvalues: Flamework (ref), u15 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.AppId);
        end
    };
    local v70 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }) };
    local v71 = #v70;
    local v72 = u2.values(u14);

    local function _(p73) -- Line: 260
        return {
            value = p73,
            text = p73
        };
    end;

    local v74 = table.create(#v72);
    local v75 = {
        Value = u17
    };
    local v76 = {
        ResetOnSpawn = false
    };

    for i, v in v72 do
        local _ = i - 1;
        v74[i] = {
            value = v,
            text = v
        };
    end;

    v75.Tabs = v74;

    function v75.OnChange(p77) -- Line: 273
        -- upvalues: u18 (copy)
        u18(p77.value);
    end;

    v75.FrameProps = {
        LayoutOrder = 1
    };
    v70[v71 + 1] = u3.createElement(TabsComponent, v75);
    local v78 = {
        Size = UDim2.new(1, 0, 0, 30)
    };

    local function _(p79) -- Line: 283
        return {
            key = p79
        };
    end;

    local v80 = table.create(#u10);

    for i, v in u10 do
        local _ = i - 1;
        v80[i] = {
            key = v
        };
    end;

    v78.Items = v80;
    v78.InputText = v22;
    v78.OnTextChange = v64;
    v78.PlaceHolderText = "Search All Items";
    v78.LayoutOrder = 2;
    v70[v71 + 2] = u3.createElement(AutoCompleteSearchbar, v78);

    local function v84(p81) -- Line: 300
        -- upvalues: u3 (ref), KnitClient (ref), Theme (ref), ItemToolTip (ref)
        local u82 = p81[1];
        local v83 = p81[2];

        return u3.createFragment({
            ItemFrame = u3.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,

                [u3.Event.Activated] = function() -- Line: 307
                    -- upvalues: KnitClient (ref), u82 (copy)
                    KnitClient.Controllers.GamemodeController:requestCreativeItem(u82);
                end
            }, { u3.createElement("UIStroke", {
                    Thickness = 2,
                    Transparency = 0.3,
                    Color = Theme.textPrimary
                }), u3.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.75, 0.75),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = v83.image
                }), u3.createElement(ItemToolTip, {
                    showTechnicalName = true,
                    item = u82
                }) })
        });
    end;

    local v85 = table.create(#v20);

    for i, v in v20 do
        v85[i] = v84(v, i - 1, v20);
    end;

    local v86 = {
        AdditionalSpace = 10,
        ScrollingFrameProps = {
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 1, -60)
        }
    };
    local v87 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4)
        }), u3.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 10,
            HorizontalAlignment = "Center",
            CellSize = UDim2.new(0, 48, 0, 48),
            CellPadding = UDim2.new(0, 8, 0, 8)
        }) };
    local v88 = #v87;

    for i, v in v85 do
        v87[v88 + i] = v;
    end;

    v70.CreativeInventory = u3.createElement(AutoCanvasScrollingFrame, v86, v87);
    v68[#v68 + 1] = u3.createElement(WidgetComponent, v69, v70);
    v68.OpenPlayerInventoryBtn = u3.createElement("ImageButton", {
        Size = UDim2.fromScale(0.1, 0.1),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 1, 6),
        Image = BedwarsImageId.ELLIPSIS,
        ScaleType = "Fit",
        BackgroundColor3 = Color3.fromHex("6b6fbf"),
        BorderSizePixel = 0,
        Active = true,

        [u3.Event.Activated] = function() -- Line: 371
            -- upvalues: KnitClient (ref), Flamework (ref), BedwarsAppIds (ref)
            KnitClient.Controllers.GamemodeController:toggleCreativeInventory();
            local v89 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

            if v89:isAppOpen(BedwarsAppIds.INVENTORY) then
                v89:closeApp(BedwarsAppIds.INVENTORY);

                return;
            end;

            v89:openApp(BedwarsAppIds.INVENTORY, {});
        end
    }, { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                Text = "Open Player Inventory",
                TextSize = 16,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) }) });
    v66[#v66 + 1] = u3.createElement("Frame", v67, v68);
    v65[#v65 + 1] = u3.createElement(SlideIn, {}, v66);

    return u3.createFragment({
        CreativeInventory = u3.createElement("ScreenGui", v76, v65)
    });
end;

local v91 = v4.new(u3)(v90);

return {
    CreativeInventory = v5.connect(function(p92, p93) -- Line: 403
        local v94 = {};

        for i, v in p93 do
            v94[i] = v;
        end;

        return v94;
    end)(v91)
};