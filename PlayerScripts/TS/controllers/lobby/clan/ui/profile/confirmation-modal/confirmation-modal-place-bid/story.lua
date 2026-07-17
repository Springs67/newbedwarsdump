-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local StringUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ConfirmationModalApp = RuntimeLib.import(script, script.Parent, "confirmation-modal-base").ConfirmationModalApp;

return function(p2) -- Line: 7
    -- upvalues: StringUtil (copy), CreateRoduxApp (copy), ConfirmationModalApp (copy), u1 (copy)
    local u3 = CreateRoduxApp("ConfirmationModalPlaceBid", ConfirmationModalApp, {
        Title = "Place Bid",
        PreviouslySelected = nil,
        Body = "Are you sure you want to place a bid for <font color=\"" .. "#55FFFF" .. "\">" .. StringUtil.formatNumberWithCommas(20001) .. " Clan War Crystals</font> for <font color=\"#55FFFF\">Baby Penguin</font>\n<font color=\"#AAAAAA\">[Warning] Placing this bid will deduct your bid currency immediately. You\'ll be refunded if you lose, or refunded the difference if your max bid exceeds the winning bid amount.</font>",
        TextBodyProps = {
            RichText = true,
            TextWrapped = true,
            TextScaled = false,
            TextSize = 18
        },
        SecondaryBtnProps = {
            Text = "CANCEL"
        },
        PrimaryBtnProps = {
            Text = "PLACE BID"
        },

        OnPrimaryBtnClick = function() -- Line: 30, Name: OnPrimaryBtnClick
        end,

        OnSecondaryBtnClick = function() -- Line: 31, Name: OnSecondaryBtnClick
        end
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 35
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;