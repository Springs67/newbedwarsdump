-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MobileButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v2 = u1.Component:extend("ShieldMobileUI");

function v2.init(p3, p4) -- Line: 10
    p3:setState({
        raised = false
    });
end;

function v2.render(u5) -- Line: 15
    -- upvalues: u1 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy)
    local createElement = u1.createElement;
    local v6 = {};
    local v7;

    if u5.state.raised then
        v7 = BedwarsImageId.SHIELD_ON_MOBILE;
    else
        v7 = BedwarsImageId.SHIELD_OFF_MOBILE;
    end;

    v6.Image = v7;
    v6.Position = BedwarsUI:getActionMobileButtonPosition();

    function v6.OnClick() -- Line: 19
        -- upvalues: u5 (copy)
        local v8 = not u5.state.raised;
        u5:setState({
            raised = v8
        });
        u5.props.OnChange(v8);
    end;

    return createElement(MobileButton, v6);
end;

return {
    ShieldMobileUI = v2
};