-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AchievementsCore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievements-core").AchievementsCore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerProfileEmpty = RuntimeLib.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty;

return {
    PlayerProfileAchievements = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: Theme (copy), u1 (copy), PlayerProfileEmpty (copy), AchievementsCore (copy)
        local _ = p4.useState;
        local u5 = 0;

        local function _(p6) -- Line: 12
            -- upvalues: u5 (ref)
            if p6.achieved then
                u5 = u5 + 1;
            end;
        end;

        for _, v in p3.ProfileData.achievements do
            if v.achieved then
                u5 = u5 + 1;
            end;
        end;

        local v7 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, 0.98),
            BackgroundColor3 = Theme.backgroundPrimary,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.02)
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v7[i] = v;
            end;
        end;

        local v8 = {};
        local v9 = #v8;
        local v10;

        if u5 <= 0 then
            v10 = u1.createElement(PlayerProfileEmpty, {
                Text = "No achievements yet!",
                Size = UDim2.fromScale(1, 1)
            });
        else
            v10 = false;
        end;

        if v10 then
            v8[v9 + 1] = v10;
        end;

        local v11 = #v8;
        local v12;

        if u5 > 0 then
            v12 = u1.createElement(AchievementsCore, {
                ViewingAsLocalPlayer = false,
                ViewingOnProfile = true,
                ProfileData = p3.ProfileData
            });
        else
            v12 = false;
        end;

        if v12 then
            v8[v11 + 1] = v12;
        end;

        return u1.createElement("Frame", v7, v8);
    end)
};