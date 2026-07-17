-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanMenuInviteCard = RuntimeLib.import(script, script.Parent, "clan-menu-invite-card").ClanMenuInviteCard;
local v16 = v4.new(u3)(function(p6, p7) -- Line: 12
    -- upvalues: u2 (copy), u3 (copy), ClanMenuInviteCard (copy), AutoCanvasScrollingFrame (copy), Theme (copy), Empty (copy)
    local _ = p7.useState;
    local v8;

    if next(p6.ClanInvites) == nil then
        v8 = u3.createElement("TextLabel", {
            Text = "<b>No incoming clan invites.\n Would you like to create one instead?</b>",
            TextXAlignment = "Center",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            TextTransparency = 0,
            BorderSizePixel = 0,
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            LayoutOrder = 1,
            AutoLocalize = false,
            Size = UDim2.fromScale(1, 0.9),
            TextColor3 = Theme.textPrimary
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 24
            }) });
    else
        local ClanInvites = p6.ClanInvites;

        if ClanInvites then
            local v9 = u2.entries(p6.ClanInvites);

            local function _(p10) -- Line: 19
                -- upvalues: u3 (ref), ClanMenuInviteCard (ref)
                local _ = p10[1];

                return u3.createElement(ClanMenuInviteCard, {
                    ClanInvite = p10[2]
                });
            end;

            ClanInvites = table.create(#v9);

            for i, v in v9 do
                local _ = i - 1;
                local _ = v[1];
                ClanInvites[i] = u3.createElement(ClanMenuInviteCard, {
                    ClanInvite = v[2]
                });
            end;
        end;

        local v11 = {
            AdditionalSpace = 80,
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.9)
            }
        };
        local v12 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 1)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v13 = #v12;

        for i, v in ClanInvites do
            v12[v13 + i] = v;
        end;

        v8 = u3.createElement(AutoCanvasScrollingFrame, v11, v12);
    end;

    local v14 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v15 = {
        [#v15 + 1] = v8
    };

    return u3.createFragment({
        ClanMenuInvitesTab = u3.createElement(Empty, v14, v15)
    });
end);

return {
    ClanMenuInvites = v5.connect(function(p17, p18) -- Line: 88
        local v19 = {};

        for i, v in p18 do
            v19[i] = v;
        end;

        v19.ClanInvites = p17.Clans.incomingClanInvites;

        return v19;
    end)(v16)
};