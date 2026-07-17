-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AutoCanvasScrollingFrame = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfileInviteOutgoingInvite = RuntimeLib.import(script, script.Parent, "clan-profile-invite-outgoing-invite").ClanProfileInviteOutgoingInvite;
local v13 = v3.new(u2)(function(p5, p6) -- Line: 10
    -- upvalues: u1 (copy), u2 (copy), ClanProfileInviteOutgoingInvite (copy), Theme (copy), AutoCanvasScrollingFrame (copy)
    local _ = p6.useState;
    local v7;

    if p5.OutgoingInvites and next(p5.OutgoingInvites) ~= nil then
        local v8 = u1.values(p5.OutgoingInvites);

        local function _(p9) -- Line: 15
            -- upvalues: u2 (ref), ClanProfileInviteOutgoingInvite (ref)
            return u2.createElement(ClanProfileInviteOutgoingInvite, {
                ClanInvite = p9,
                LayoutOrder = -p9.time
            });
        end;

        v7 = table.create(#v8);

        for i, v in v8 do
            local _ = i - 1;
            v7[i] = u2.createElement(ClanProfileInviteOutgoingInvite, {
                ClanInvite = v,
                LayoutOrder = -v.time
            });
        end;
    else
        v7 = u2.createElement("TextLabel", {
            Text = "<b>No players in your current server to invite.</b>",
            TextXAlignment = "Center",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            TextTransparency = 0,
            BorderSizePixel = 0,
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.8),
            TextColor3 = Theme.textPrimary
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 24
            }) });
    end;

    local v10 = {
        AdditionalSpace = 20,
        ScrollingFrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 1, 0)
        }
    };
    local v11 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 10)
        }) };
    local v12 = #v11;

    if v7.elements == nil and (v7.props == nil or v7.component == nil) then
        for i, v in v7 do
            v11[v12 + i] = v;
        end;
    else
        v11[v12 + 1] = v7;
    end;

    return u2.createElement(AutoCanvasScrollingFrame, v10, v11);
end);

return {
    ClanProfileInviteOutgoingInvites = v4.connect(function(p14, p15) -- Line: 73
        local v16 = {};

        for i, v in p15 do
            v16[i] = v;
        end;

        local myClan = p14.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.invites;

            if myClan ~= nil then
                myClan = myClan.outgoing;
            end;
        end;

        v16.OutgoingInvites = myClan;

        return v16;
    end)(v13)
};