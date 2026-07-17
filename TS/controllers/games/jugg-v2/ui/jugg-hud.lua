-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v17 = v4.new(u3)(function(p6, p7) -- Line: 13
    -- upvalues: u3 (copy), Empty (copy), ColorUtil (copy), PlayerRender (copy)
    local v8 = {};
    local _ = #v8;
    local killLeaders = p6.killLeaders;

    local function v11(p9, p10) -- Line: 21
        -- upvalues: u3 (ref), Empty (ref), ColorUtil (ref), PlayerRender (ref)
        return u3.createFragment({
            KillLeaderCard = u3.createElement(Empty, {
                Size = UDim2.fromScale(0.33, 1),
                LayoutOrder = p10
            }, {
                u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                GradientOverlay = u3.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 50,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u3.createElement("UIGradient", {
                        Rotation = -90,
                        Color = ColorSequence.new(ColorUtil.BLACK),
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(1, 1) })
                    }),
                    Kills = u3.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        TextXAlignment = "Right",
                        BackgroundTransparency = 1,
                        ZIndex = 52,
                        Position = UDim2.fromScale(0.95, 0.95),
                        AnchorPoint = Vector2.new(1, 1),
                        Size = UDim2.fromScale(1, 0.4),
                        Text = "<b>" .. tostring(p9.kills) .. "</b>",
                        TextColor3 = ColorUtil.WHITE,
                        Font = Enum.Font.Roboto
                    })
                }),
                PlayerRender = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(54, 150, 255)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement(
                        "UIListLayout",
                        {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder"
                        }
                    ), u3.createElement(PlayerRender, {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        PlayerUserId = p9.player.userId
                    }) })
            })
        });
    end;

    local v12 = table.create(#killLeaders);
    local v13 = {
        DisplayOrder = 20,
        ResetOnSpawn = false
    };

    for i, v in killLeaders do
        v12[i] = v11(v, i - 1, killLeaders);
    end;

    local v14 = {
        Size = UDim2.fromScale(0.5, 0.1),
        Position = UDim2.fromScale(0.5, 0.05),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v15 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 4)
        }) };
    local v16 = #v15;

    for i, v in v12 do
        v15[v16 + i] = v;
    end;

    v8.JuggHudContainer = u3.createElement(Empty, v14, v15);

    return u3.createFragment({
        JuggHudGUI = u3.createElement("ScreenGui", v13, v8)
    });
end);

return {
    JuggHud = v5.connect(function(p18, p19) -- Line: 111
        -- upvalues: u2 (copy), Players (copy), OfflinePlayerUtil (copy)
        local v20 = u2.entries(p18.Bedwars.kills);
        table.sort(v20, function(p21, p22) -- Line: 113
            local _ = p21[1];
            local _ = p22[1];

            return p22[2] < p21[2];
        end);
        local v23 = false;
        local v24 = 0;
        local v25 = {};

        while true do
            if v23 then
                v24 = v24 + 1;
            else
                v23 = true;
            end;

            if v24 >= 3 then
                local v26 = {};

                for i, v in p19 do
                    v26[i] = v;
                end;

                v26.killLeaders = v25;

                return v26;
            end;

            if v20[v24 + 1] then
                local v27 = v20[v24 + 1];
                local v28 = v27[1];
                local v29 = v27[2];

                if v28 ~= nil and type(v28) ~= "string" then
                    local v30 = Players:GetPlayerByUserId(v28);

                    if v30 then
                        local v31 = {
                            player = OfflinePlayerUtil.getOfflinePlayer(v30),
                            kills = v29
                        };
                        table.insert(v25, v31);
                    end;
                end;
            end;
        end;
    end)(v17)
};