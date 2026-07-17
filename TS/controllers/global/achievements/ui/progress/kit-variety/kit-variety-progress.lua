-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DropdownComponent = v1.DropdownComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v35 = v4.new(u3)(function(p6, p7) -- Line: 14
    -- upvalues: u2 (copy), BedwarsKit (copy), getBedwarsKitMeta (copy), default (copy), u3 (copy), AchievementId (copy), ColorUtil (copy), DropdownComponent (copy)
    local useEffect = p7.useEffect;
    local u8, u9 = p7.useState({});
    local u10 = {};
    local u11 = {};
    local v12 = u2.values(BedwarsKit);
    table.sort(v12, function(p13, p14) -- Line: 26
        -- upvalues: getBedwarsKitMeta (ref)
        return getBedwarsKitMeta(p13).name < getBedwarsKitMeta(p14).name;
    end);

    local function v18(p15) -- Line: 30
        -- upvalues: getBedwarsKitMeta (ref), u8 (copy), u10 (copy), u11 (copy)
        local v16 = getBedwarsKitMeta(p15);

        if v16.kitClass == nil then
            return nil;
        end;

        local v17 = u8;

        if v17 ~= nil then
            v17 = v17[p15];

            if v17 ~= nil then
                v17 = v17.wins;
            end;
        end;

        if v17 == nil then
            v17 = false;
        end;

        if v17 == 0 or (v17 ~= v17 or not v17) then
            table.insert(u11, {
                text = v16.name,
                value = p15
            });

            return;
        end;

        table.insert(u10, {
            text = v16.name,
            value = p15
        });
    end;

    local v19 = {
        text = "N/A",
        value = "na"
    };

    for i, v in v12 do
        v18(v, i - 1, v12);
    end;

    useEffect(function() -- Line: 64
        -- upvalues: default (ref), u9 (copy)
        task.spawn(function() -- Line: 65
            -- upvalues: default (ref), u9 (ref)
            default.Client:Get("RequestKitStats"):CallServerAsync():andThen(function(p20) -- Line: 66
                -- upvalues: u9 (ref)
                u9(p20);
            end);
        end);
    end, {});
    local v21 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 30)
    };
    local FrameProps = p6.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v21[i] = v;
        end;
    end;

    local v22 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }) };
    local v23 = #v22;
    local v24 = {
        LayoutOrder = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1)
    };
    local v25 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 5)
        }) };
    local v26 = #v25;
    local v27 = {
        TextScaled = true,
        Size = UDim2.fromScale(1, 1)
    };
    local v28 = p6.ProfileData.achievementProgressValues[AchievementId.KIT_VARIETY_1];
    v27.Text = "Completed (" .. tostring(v28 == nil and 0 or v28) .. ")";
    v27.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
    v27.TextColor3 = ColorUtil.WHITE;
    v27.TextTransparency = 0.3;
    v27.BackgroundTransparency = 1;
    v25[v26 + 1] = u3.createElement("TextLabel", v27, { u3.createElement("UITextSizeConstraint", {
            MaxTextSize = 24
        }) });
    local v29 = {
        Size = UDim2.fromScale(0.95, 1)
    };
    local v30 = {};
    table.move(u10, 1, #u10, #v30 + 1, v30);
    v29.Items = v30;
    v29.DefaultItem = u10[1] or v19;

    function v29.OnItemSelected() -- Line: 131
    end;

    v29.LayoutOrder = 4;
    v25[v26 + 2] = u3.createElement(DropdownComponent, v29);
    v22[v23 + 1] = u3.createElement("Frame", v24, v25);
    local v31 = {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1)
    };
    local v32 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 5)
        }), u3.createElement("TextLabel", {
            TextScaled = true,
            Text = "Incomplete",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
            TextColor3 = ColorUtil.WHITE
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 24
            }) }) };
    local v33 = {
        Size = UDim2.fromScale(0.95, 1)
    };
    local v34 = {};
    table.move(u11, 1, #u11, #v34 + 1, v34);
    v33.Items = v34;
    v33.DefaultItem = u11[1] or v19;

    function v33.OnItemSelected() -- Line: 169
    end;

    v33.LayoutOrder = 4;
    v32[#v32 + 1] = u3.createElement(DropdownComponent, v33);
    v22[v23 + 2] = u3.createElement("Frame", v31, v32);

    return u3.createElement("Frame", v21, v22);
end);

return {
    KitVarietyProgress = v5.connect(function(p36, p37) -- Line: 176
        local v38 = {};

        for i, v in p37 do
            v38[i] = v;
        end;

        v38.store = p36;

        return v38;
    end)(v35)
};