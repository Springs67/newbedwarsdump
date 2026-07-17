-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BeastKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit;
local v3 = u2.Component:extend("BeastBloodlustBar");

function v3.init(p4, p5) -- Line: 12
    p4.state = {
        bloodlust = p4:getBloodlust()
    };
end;

function v3.getBloodlust(p6) -- Line: 17
    -- upvalues: Players (copy)
    local v7 = Players.LocalPlayer:GetAttribute("BeastBloodlust");

    return type(v7) ~= "number" and 0 or v7;
end;

function v3.didMount(u8) -- Line: 21
    -- upvalues: Players (copy)
    u8.bloodlustSignal = Players.LocalPlayer:GetAttributeChangedSignal("BeastBloodlust"):Connect(function() -- Line: 22
        -- upvalues: u8 (copy)
        u8:setState({
            bloodlust = u8:getBloodlust()
        });
    end);
end;

function v3.willUnmount(p9) -- Line: 28
    local bloodlustSignal = p9.bloodlustSignal;

    if bloodlustSignal ~= nil then
        bloodlustSignal:Disconnect();
    end;
end;

function v3.render(p10) -- Line: 34
    -- upvalues: BeastKit (copy), u2 (copy), ProgressBar (copy), Empty (copy)
    local v11 = math.clamp(p10.state.bloodlust / BeastKit.BloodlustRequired, 0.001, 1);
    local v12 = {
        Size = p10.props.Size,
        Position = p10.props.Position,
        AnchorPoint = p10.props.AnchorPoint
    };
    local v13 = {};
    local v14 = {
        Hide = false,
        Progress = v11,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local ProgressBarConfig = p10.props.ProgressBarConfig;

    if ProgressBarConfig then
        for i, v in ProgressBarConfig do
            v14[i] = v;
        end;
    end;

    local v15 = {};
    local v16 = #v15;
    local v17 = p10.props[u2.Children];

    if v17 then
        for i, v in v17 do
            if type(i) == "number" then
                v15[v16 + i] = v;
            else
                v15[i] = v;
            end;
        end;
    end;

    v13[#v13 + 1] = u2.createElement(ProgressBar, v14, v15);

    return u2.createElement(Empty, v12, v13);
end;

return {
    BeastBloodlustBar = v3
};