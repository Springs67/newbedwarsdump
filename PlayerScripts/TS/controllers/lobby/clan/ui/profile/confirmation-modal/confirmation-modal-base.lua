-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ConfirmationModal = RuntimeLib.import(script, script.Parent, "confirmation-modal").ConfirmationModal;
local v4 = u2.PureComponent:extend("ConfirmationModalBase");

function v4.init(p5) -- Line: 12
end;

function v4.render(p6) -- Line: 14
    -- upvalues: u2 (copy), DarkBackground (copy), ConfirmationModal (copy), SlideIn (copy)
    local v7 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.2,
            AppId = p6.props.AppId
        }) };
    local v8 = {};
    local v9 = {};
    local v10 = {
        DisplayOrder = 1600,
        ResetOnSpawn = false
    };

    for i, v in p6.props do
        v9[i] = v;
    end;

    v8[#v8 + 1] = u2.createElement(ConfirmationModal, v9);
    v7[#v7 + 1] = u2.createElement(SlideIn, {}, v8);

    return u2.createElement("ScreenGui", v10, v7);
end;

return {
    ConfirmationModalApp = v3.connect(function(p11, p12) -- Line: 37
        local v13 = {
            store = p11
        };

        for i, v in p12 do
            v13[i] = v;
        end;

        return v13;
    end)(v4)
};