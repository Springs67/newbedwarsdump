-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MurderGameRole = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole;
local MurderGameConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MurdererEliminationHighlight = RuntimeLib.import(script, script.Parent, "murderer-elimination-highlight").MurdererEliminationHighlight;
local MurdererPlayerBox = RuntimeLib.import(script, script.Parent, "murderer-player-box").MurdererPlayerBox;

return {
    MurdererMatchEndScreen = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: u2 (copy), MurdererPlayerBox (copy), MurderGameRole (copy), Empty (copy), MurderGameConstants (copy), ColorUtil (copy), MurdererEliminationHighlight (copy), BedwarsImageId (copy), Theme (copy)
        local _ = p5.useState;
        local v6 = {};
        local v7 = {
            Size = UDim2.fromScale(0.5, 0.45),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v8 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local _ = #v8;
        local civilian = u4.Roles.civilian;

        local function v15(u9) -- Line: 36
            -- upvalues: u4 (copy), u2 (ref), MurdererPlayerBox (ref), MurderGameRole (ref)
            local function _(p10) -- Line: 38
                -- upvalues: u9 (copy)
                return p10.victim.offlinePlayer.userId == u9.userId;
            end;

            local v11 = nil;

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.victim.offlinePlayer.userId == u9.userId == true then
                    v11 = v;
                    break;
                end;
            end;

            local function _(p12) -- Line: 52
                -- upvalues: u9 (copy)
                return p12.killer.offlinePlayer.userId == u9.userId;
            end;

            local v13 = 0;
            local v14 = {};

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.killer.offlinePlayer.userId == u9.userId == true then
                    v13 = v13 + 1;
                    v14[v13] = v;
                end;
            end;

            return u2.createElement(MurdererPlayerBox, {
                UserId = u9.userId,
                Role = MurderGameRole.CIVILIAN,
                IsDead = v11 ~= nil,
                NumElims = #v14
            });
        end;

        local v16 = table.create(#civilian);
        local v17 = {
            ResetOnSpawn = false,
            DisplayOrder = 11
        };

        for i, v in civilian do
            v16[i] = v15(v, i - 1, civilian);
        end;

        local v18 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.45)
        };
        local v19 = { u2.createElement("UIGridLayout", {
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 6,
                CellSize = UDim2.fromScale(0.1, 0.47),
                CellPadding = UDim2.fromScale(0.01, 0.035)
            }) };
        local v20 = #v19;

        for i, v in v16 do
            v19[v20 + i] = v;
        end;

        local v21 = #v19;
        local sheriff = u4.Roles.sheriff;

        local function v28(u22) -- Line: 99
            -- upvalues: u4 (copy), u2 (ref), MurdererPlayerBox (ref), MurderGameRole (ref)
            local function _(p23) -- Line: 101
                -- upvalues: u22 (copy)
                return p23.victim.offlinePlayer.userId == u22.userId;
            end;

            local v24 = nil;

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.victim.offlinePlayer.userId == u22.userId == true then
                    v24 = v;
                    break;
                end;
            end;

            local function _(p25) -- Line: 115
                -- upvalues: u22 (copy)
                return p25.killer.offlinePlayer.userId == u22.userId;
            end;

            local v26 = 0;
            local v27 = {};

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.killer.offlinePlayer.userId == u22.userId == true then
                    v26 = v26 + 1;
                    v27[v26] = v;
                end;
            end;

            return u2.createElement(MurdererPlayerBox, {
                UserId = u22.userId,
                Role = MurderGameRole.SHERIFF,
                IsDead = v24 ~= nil,
                NumElims = #v27
            });
        end;

        local v29 = table.create(#sheriff);

        for i, v in sheriff do
            v29[i] = v28(v, i - 1, sheriff);
        end;

        for i, v in v29 do
            v19[v21 + i] = v;
        end;

        local v30 = #v19;
        local murderer = u4.Roles.murderer;

        local function v37(u31) -- Line: 147
            -- upvalues: u4 (copy), u2 (ref), MurdererPlayerBox (ref), MurderGameRole (ref)
            local function _(p32) -- Line: 149
                -- upvalues: u31 (copy)
                return p32.victim.offlinePlayer.userId == u31.userId;
            end;

            local v33 = nil;

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.victim.offlinePlayer.userId == u31.userId == true then
                    v33 = v;
                    break;
                end;
            end;

            local function _(p34) -- Line: 163
                -- upvalues: u31 (copy)
                return p34.killer.offlinePlayer.userId == u31.userId;
            end;

            local v35 = 0;
            local v36 = {};

            for i, v in u4.Eliminations do
                local _ = i - 1;

                if v.killer.offlinePlayer.userId == u31.userId == true then
                    v35 = v35 + 1;
                    v36[v35] = v;
                end;
            end;

            return u2.createElement(MurdererPlayerBox, {
                UserId = u31.userId,
                Role = MurderGameRole.MURDERER,
                IsDead = v33 ~= nil,
                NumElims = #v36
            });
        end;

        local v38 = table.create(#murderer);

        for i, v in murderer do
            v38[i] = v37(v, i - 1, murderer);
        end;

        for i, v in v38 do
            v19[v30 + i] = v;
        end;

        v8.PlayersContainer = u2.createElement(Empty, v18, v19);
        local Eliminations = u4.Eliminations;

        local function v40(p39) -- Line: 195
            -- upvalues: MurderGameRole (ref), u2 (ref), MurderGameConstants (ref), ColorUtil (ref), MurdererEliminationHighlight (ref), BedwarsImageId (ref), Theme (ref)
            if p39.victim.role == MurderGameRole.CIVILIAN then
                return nil;
            end;

            return u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }, {
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 3.5
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.025, 0)
                }),
                u2.createElement("UIGradient", {
                    Rotation = 0,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, MurderGameConstants:getRoleColor(p39.killer.role)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(51, 51, 51)), ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 51, 51)) })
                }),
                u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.WHITE
                }),
                u2.createElement(MurdererEliminationHighlight, {
                    UserId = p39.killer.offlinePlayer.userId,
                    DisplayName = p39.killer.offlinePlayer.displayName,
                    Role = p39.killer.role,
                    FrameProps = {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.375, 1)
                    }
                }),
                KillIcon = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.2, 0.8)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.1, 0)
                    }),
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.5),
                        Image = BedwarsImageId.KILL_ABILITY_ICON
                    }),
                    u2.createElement("TextLabel", {
                        Text = "KILLED",
                        TextScaled = true,
                        Font = "GothamBlack",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.25),
                        TextColor3 = Theme.mcRed
                    })
                }),
                u2.createElement(MurdererEliminationHighlight, {
                    IsVictim = true,
                    UserId = p39.victim.offlinePlayer.userId,
                    DisplayName = p39.victim.offlinePlayer.displayName,
                    Role = p39.victim.role,
                    FrameProps = {
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(0.375, 1)
                    }
                })
            });
        end;

        local v41 = 0;
        local v42 = {};

        for i, v in Eliminations do
            local v43 = v40(v, i - 1, Eliminations);

            if v43 ~= nil then
                v41 = v41 + 1;
                v42[v41] = v43;
            end;
        end;

        local v44 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v45 = { u2.createElement("UIGridLayout", {
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 2,
                CellSize = UDim2.fromScale(0.45, 0.4),
                CellPadding = UDim2.fromScale(0.01, 0.05)
            }) };
        local v46 = #v45;

        for i, v in v42 do
            v45[v46 + i] = v;
        end;

        v8.EliminationsContainer = u2.createElement(Empty, v44, v45);
        v6[#v6 + 1] = u2.createElement(Empty, v7, v8);

        return u2.createFragment({
            MurderEndGameScreen = u2.createElement("ScreenGui", v17, v6)
        });
    end)
};