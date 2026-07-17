-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local v8 = v3.new(u2)(function(p5, p6) -- Line: 11
    -- upvalues: u2 (copy), Empty (copy), DeviceUtil (copy), tabListLayout (copy)
    local _ = p6.useState;
    local v7 = p5.Team.name .. " Team";

    return u2.createFragment({
        ["HonorTeamHeaderGUI_" .. p5.Team.id] = u2.createElement(Empty, {
            LayoutOrder = -1,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 26 or 30)
        }, { u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.6 or 0.3, 1),
                BackgroundColor3 = p5.Team.color,
                BackgroundTransparency = tabListLayout.bgTransparency.cardHeader,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.1, 0),
                    PaddingBottom = UDim.new(0.1, 0),
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }),
                TeamName = u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextXAlignment = "Center",
                    TextSize = 32,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = v7,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = p5.Team.color
                })
            }) })
    });
end);

return {
    HonorTeamHeaderGUI = v4.connect(function(u9, p10) -- Line: 52
        -- upvalues: getQueueMeta (copy)
        local v11 = {};
        local v12 = #v11;

        for i, v in p10.Team.members do
            v12 = v12 + 1;
            v11[v12] = { i, v };
        end;

        local function _(p13, p14) -- Line: 60
            -- upvalues: u9 (copy)
            local _ = p14[1];

            if u9.Bedwars.finalDeaths[p14[2].userId] then
                return p13;
            end;

            return p13 + 1;
        end;

        local v15 = 0;

        for i = 1, #v11 do
            local v16 = v11[i];
            local _ = i - 1;
            local _ = v16[1];

            if not u9.Bedwars.finalDeaths[v16[2].userId] then
                v15 = v15 + 1;
            end;
        end;

        local queueType = u9.Game.queueType;

        if queueType and not getQueueMeta(queueType).disableTablistStats then
            local function _(p17, p18) -- Line: 84
                -- upvalues: u9 (copy)
                local _ = p18[1];
                local v19 = u9.Bedwars.kills[p18[2].userId];

                if v19 ~= 0 and (v19 == v19 and v19) then
                    p17 = p17 + v19;
                end;

                return p17;
            end;

            local v20 = 0;

            for i = 1, #v11 do
                local v21 = v11[i];
                local _ = i - 1;
                local _ = v21[1];
                local v22 = u9.Bedwars.kills[v21[2].userId];

                if v22 ~= 0 and (v22 == v22 and v22) then
                    v20 = v20 + v22;
                end;
            end;
        end;

        local v23 = {};

        for i, v in p10 do
            v23[i] = v;
        end;

        v23.NumActiveMembers = v15;

        return v23;
    end)(v8)
};