-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ScriptLeaderboardRow = RuntimeLib.import(script, script.Parent, "script-leaderboard-row").ScriptLeaderboardRow;
local v2 = u1.Component:extend("ScriptLeaderboardContainer");

function v2.init(p3) -- Line: 8
end;

function v2.render(p4) -- Line: 10
    -- upvalues: u1 (copy), ScriptLeaderboardRow (copy)
    local v5 = #p4.props.leaderboard ~= 0;

    if v5 then
        local leaderboard = p4.props.leaderboard;

        local function _(p6, p7) -- Line: 14
            -- upvalues: u1 (ref), ScriptLeaderboardRow (ref)
            return u1.createElement(ScriptLeaderboardRow, {
                data = p6
            });
        end;

        local v8 = table.create(#leaderboard);

        for i, v in leaderboard do
            local _ = i - 1;
            v8[i] = u1.createElement(ScriptLeaderboardRow, {
                data = v
            });
        end;

        local v9 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.84, 0.012),
            Size = UDim2.fromScale(0.15, 0.3)
        };
        local v10 = {};
        local v11 = #v10;

        for i, v in v8 do
            v10[v11 + i] = v;
        end;

        v5 = u1.createFragment({
            ScriptLeaderboardContainer = u1.createElement("Frame", v9, v10)
        });
    end;

    local v12 = {
        ResetOnSpawn = false
    };
    local v13 = {};
    local v14 = #v13;

    if v5 then
        v13[v14 + 1] = v5;
    end;

    return u1.createFragment({
        ScriptLeaderboardGUI = u1.createElement("ScreenGui", v12, v13)
    });
end;

function v2.didMount(p15) -- Line: 52
end;

return {
    ScriptLeaderboardContainer = v2
};