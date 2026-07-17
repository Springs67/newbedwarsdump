-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanSearchListingCard = RuntimeLib.import(script, script.Parent, "clan-search-listing-card").ClanSearchListingCard;

return {
    ClanMenuSearchClanList = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u2 (copy), DeviceUtil (copy), UIUtil (copy), ClanSearchListingCard (copy), AutoCanvasScrollingFrame (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 14
            -- upvalues: DeviceUtil (ref), u6 (copy), UIUtil (ref)
            if DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u6:getValue()));
            end;
        end, {});
        local v7 = {
            AdditionalSpace = 80
        };
        local v8 = {
            Size = u4.Size or UDim2.new(1, 0, 1, 0)
        };
        local LayoutOrder = u4.LayoutOrder;
        v8.LayoutOrder = LayoutOrder == nil and 2 or LayoutOrder;
        v7.ScrollingFrameProps = v8;
        v7.ScrollingFrameRef = u6;
        local Clans = u4.Clans;

        local function v11(u9, p10) -- Line: 35
            -- upvalues: u2 (ref), ClanSearchListingCard (ref), u4 (copy)
            return u2.createElement(ClanSearchListingCard, {
                Clan = u9,

                OnClick = function() -- Line: 38, Name: OnClick
                    -- upvalues: u4 (ref), u9 (copy)
                    u4.SetSelectedClan(u9);
                end,

                FrameProps = {
                    LayoutOrder = p10
                },
                Selected = u4.SelectedClanId == u9.clanId
            });
        end;

        local v12 = table.create(#Clans);

        for i, v in Clans do
            v12[i] = v11(v, i - 1, Clans);
        end;

        local v13 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 6)
            }) };
        local v14 = #v13;

        for i, v in v12 do
            v13[v14 + i] = v;
        end;

        return u2.createElement(AutoCanvasScrollingFrame, v7, v13);
    end)
};