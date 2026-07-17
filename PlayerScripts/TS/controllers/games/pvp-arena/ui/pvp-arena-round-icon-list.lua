-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PvPArenaConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaRoundIconContainer = RuntimeLib.import(script, script.Parent, "pvp-arena-round-icon-container").PvPArenaRoundIconContainer;

return {
    PvPArenaRoundIconList = v2.new(u1)(function(p3, p4) -- Line: 10
        -- upvalues: Theme (copy), PvPArenaConfig (copy), u1 (copy), BedwarsImageId (copy), PvPArenaRoundIconContainer (copy), Empty (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = false;
        local v6 = -2;
        local v7 = {};

        while true do
            if v5 then
                v6 = v6 + 1;
            else
                v5 = true;
            end;

            if v6 > 2 then
                local v8 = {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.9, 0.22),
                    Position = UDim2.fromScale(0.5, 0.79)
                };
                local v9 = {
                    IconLine = u1.createElement("Frame", {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 0.2),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundColor3 = Theme.backgroundSecondary
                    })
                };
                local _ = #v9;
                local v10 = {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5)
                };
                local v11 = {};
                local v12 = #v11;

                for i, v in v7 do
                    v11[v12 + i] = v;
                end;

                v9.EmptyIconArea = u1.createElement("Frame", v10, v11);

                return u1.createFragment({
                    IconArea = u1.createElement("Frame", v8, v9)
                });
            end;

            local v13;

            if v6 == 0 then
                v13 = Theme.mcYellow;
            else
                v13 = Theme.textPrimary;
            end;

            local v14;

            if v6 == 0 then
                v14 = UDim2.fromScale(1, 1);
            else
                v14 = UDim2.fromScale(0.9, 0.9);
            end;

            local v15 = math.pow(v6, 3) * -0.1 / 6 + v6 * 1.9 / 6 + 0.5;
            local v16 = math.clamp(v6, -1, 1);
            local v17 = p3.roundNumber + v16;

            if PvPArenaConfig.isIntermissionStage(p3.stageNumber) and v16 < 0 then
                v17 = v17 + 1;
            end;

            local v18 = {
                Position = UDim2.fromScale(v15, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.1, 1)
            };
            local v19 = {};
            local v20 = #v19;
            local v21;

            if v6 == 0 then
                v21 = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.3,
                    ZIndex = 2,
                    Size = UDim2.fromScale(2, 2),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.MISSION_TICKET_GLOW
                });
            else
                v21 = false;
            end;

            if v21 then
                v19[v20 + 1] = v21;
            end;

            v19[#v19 + 1] = u1.createElement(PvPArenaRoundIconContainer, {
                stageNumber = p3.stageNumber + v6,
                roundNumber = v17,
                ImageTransparency = v6 < 0 and 0.5 or 0,
                ImageColor3 = v13,
                FrameProps = {
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = v14
                }
            });
            local v22 = u1.createElement(Empty, v18, v19);
            table.insert(v7, v22);
        end;
    end)
};