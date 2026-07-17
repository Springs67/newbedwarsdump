-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v10 = v3.new(u2)(function(u5, p6) -- Line: 9
    -- upvalues: u2 (copy), Button (copy), Empty (copy)
    local _ = p6.useState;
    local v7 = {
        Size = UDim2.new(1, 0, 0, 24)
    };
    local v8 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 6)
        }), u2.createElement(Button, {
            Text = "<b>Players In Server</b>",
            Size = UDim2.fromScale(0.25, 1),
            BackgroundColor3 = Color3.fromRGB(32, 33, 62),
            BackgroundTransparency = u5.subTab == 0 and 0 or 0.3,

            OnClick = function() -- Line: 25, Name: OnClick
                -- upvalues: u5 (copy)
                u5.setSubTab(0);
            end
        }) };
    local v9 = {
        Size = UDim2.fromScale(0.25, 1),
        BackgroundColor3 = Color3.fromRGB(32, 33, 62),
        BackgroundTransparency = u5.subTab == 1 and 0 or 0.3
    };
    local OutgoingInvites = u5.OutgoingInvites;

    if OutgoingInvites ~= nil then
        OutgoingInvites = 0;

        for _ in OutgoingInvites do
            OutgoingInvites = OutgoingInvites + 1;
        end;
    end;

    v9.Text = "<b>Outgoing Invites (" .. tostring(OutgoingInvites) .. ")</b>";

    function v9.OnClick() -- Line: 47
        -- upvalues: u5 (copy)
        u5.setSubTab(1);
    end;

    v8[#v8 + 1] = u2.createElement(Button, v9);

    return u2.createElement(Empty, v7, v8);
end);

return {
    ClanProfileInviteTabs = v4.connect(function(p11, p12) -- Line: 54
        local v13 = {};

        for i, v in p12 do
            v13[i] = v;
        end;

        local myClan = p11.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.invites;

            if myClan ~= nil then
                myClan = myClan.outgoing;
            end;
        end;

        v13.OutgoingInvites = myClan;

        return v13;
    end)(v10)
};