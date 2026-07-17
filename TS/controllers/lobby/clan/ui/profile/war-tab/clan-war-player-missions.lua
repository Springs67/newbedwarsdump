-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanWarPlayerMissionDescription = RuntimeLib.import(script, script.Parent, "clan-war-player-mission-description").ClanWarPlayerMissionDescription;

return {
    ClanWarPlayerMissions = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: Theme (copy), u2 (copy), ClanWarPlayerMissionDescription (copy), ColorUtil (copy), AutoCanvasScrollingFrame (copy)
        local v6 = {
            BorderSizePixel = 0,
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.8),
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v7 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12)
            }) };
        local clanWarMissionsData = p4.store.Lobby.clanWarMissionsData;

        local function v10(p8, p9) -- Line: 24
            -- upvalues: u2 (ref), ClanWarPlayerMissionDescription (ref)
            return u2.createFragment({
                ["mission" .. tostring(p9)] = u2.createElement(ClanWarPlayerMissionDescription, {
                    mission = p8,
                    missionIndex = p9
                })
            });
        end;

        local v11 = table.create(#clanWarMissionsData);

        for i, v in clanWarMissionsData do
            v11[i] = v10(v, i - 1, clanWarMissionsData);
        end;

        local v12 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5)
            }) };
        local v13 = #v12;

        for i, v in v11 do
            v12[v13 + i] = v;
        end;

        local v14 = #v12;
        local v15;

        if #p4.store.Lobby.clanWarMissionsData == 0 then
            v15 = u2.createElement("TextLabel", {
                Text = "<b>No missions (you might be too new to the clan). Check back next week.</b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(1, 0.25),
                TextColor3 = ColorUtil.WHITE,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            });
        else
            v15 = false;
        end;

        if v15 then
            v12[v14 + 1] = v15;
        end;

        v7[#v7 + 1] = u2.createElement(AutoCanvasScrollingFrame, {}, v12);

        return u2.createFragment({
            Missions = u2.createElement("Frame", v6, v7)
        });
    end)
};