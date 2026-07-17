-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local PlayerRender = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").PlayerRender;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v2 = u1.Component:extend("HotbarPartyMember");

function v2.init(p3) -- Line: 10
end;

function v2.render(p4) -- Line: 12
    -- upvalues: u1 (copy), Flamework (copy), BedwarsAppIds (copy), PlayerRender (copy)
    return u1.createElement("ImageButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        ImageTransparency = 1,
        LayoutOrder = p4.props.LayoutOrder,

        [u1.Event.MouseButton1Click] = function() -- Line: 20
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PARTY, {});
        end
    }, { u1.createElement(PlayerRender, {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            PlayerUserId = p4.props.Member.userId,
            Size = UDim2.fromScale(1, 1)
        }, { u1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) }) });
end;

return {
    HotbarPartyMember = v2
};