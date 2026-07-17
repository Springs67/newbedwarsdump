-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TournamentOutgoingInvite = RuntimeLib.import(script, script.Parent, "tournament-outbound-invite").TournamentOutgoingInvite;

return {
    TournamentOutgoingInvites = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TournamentOutgoingInvite (copy), Theme (copy)
        local v5 = {};
        local LayoutOrder = p3.LayoutOrder;
        v5.LayoutOrder = LayoutOrder == nil and 2 or LayoutOrder;
        v5.Size = UDim2.fromScale(1, 0.95);
        v5.BackgroundTransparency = 1;
        local v6;

        if #p3.OutboundInvites == 0 then
            v6 = u1.createElement("TextLabel", {
                Text = "<b>No outbound invites.</b>",
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
            }, { u1.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        else
            local OutboundInvites = p3.OutboundInvites;

            local function _(p7, p8) -- Line: 19
                -- upvalues: u1 (ref), TournamentOutgoingInvite (ref)
                return u1.createElement(TournamentOutgoingInvite, {
                    InvitedPlayer = p7,
                    LayoutOrder = p8
                });
            end;

            v6 = table.create(#OutboundInvites);

            for i, v in OutboundInvites do
                v6[i] = u1.createElement(TournamentOutgoingInvite, {
                    InvitedPlayer = v,
                    LayoutOrder = i - 1
                });
            end;
        end;

        local v9 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v10 = #v9;

        if v6.elements == nil and (v6.props == nil or v6.component == nil) then
            for i, v in v6 do
                v9[v10 + i] = v;
            end;
        else
            v9[v10 + 1] = v6;
        end;

        return u1.createElement("Frame", v5, v9);
    end)
};