-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local SkullLeaderboardCore = RuntimeLib.import(script, script.Parent, "skull-leaderboard-core").SkullLeaderboardCore;
local v3 = u1.PureComponent:extend("SkullLeaderBoardAppBase");

function v3.init(p4) -- Line: 9
end;

function v3.render(p5) -- Line: 11
    -- upvalues: u1 (copy), SkullLeaderboardCore (copy)
    local v6 = {
        LightInfluence = 0.25,
        Face = Enum.NormalId.Front,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    };
    local v7 = {};
    local v8 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -30, 1, -30)
    };
    local v9 = {};
    local v10 = {};

    for i, v in p5.props do
        v10[i] = v;
    end;

    v9[#v9 + 1] = u1.createElement(SkullLeaderboardCore, v10);
    v7[#v7 + 1] = u1.createElement("Frame", v8, v9);

    return u1.createElement("SurfaceGui", v6, v7);
end;

return {
    SkullLeaderboardApp = v2.connect(function(p11, p12) -- Line: 36
        local v13 = {
            store = p11
        };

        for i, v in p12 do
            v13[i] = v;
        end;

        return v13;
    end)(v3)
};