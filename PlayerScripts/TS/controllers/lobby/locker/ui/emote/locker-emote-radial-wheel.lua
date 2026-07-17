-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local RadialWheel = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "radial-wheel", "radial-wheel").RadialWheel;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local LockerPreviewButtons = RuntimeLib.import(script, script.Parent.Parent, "preview", "locker-preview-buttons").LockerPreviewButtons;

return {
    LockerEmoteRadialWheel = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: LockerPreviewUtil (copy), LockerTab (copy), EmoteMeta (copy), u2 (copy), EmoteShowcase (copy), EmoteType (copy), Empty (copy), RadialWheel (copy), u1 (copy), LockerPreviewButtons (copy)
        local _ = p5.useEffect;
        local u6, u7 = p5.useState(0);
        local u8;

        if u4.Element then
            u8 = LockerPreviewUtil.canPreviewLockerElement(u4.Element, LockerTab.EMOTES);
        else
            u8 = false;
        end;

        local u9 = {};
        local SelectedEmotes = u4.SelectedEmotes;

        local function v13(p10, u11) -- Line: 21
            -- upvalues: EmoteMeta (ref), u2 (ref), EmoteShowcase (ref), u7 (copy), u4 (copy), u9 (copy)
            local v12 = EmoteMeta[p10];

            if not v12 then
                return nil;
            end;

            u9[u11] = {
                element = u2.createElement(EmoteShowcase, {
                    Emote = p10
                }),
                title = v12.name,

                onSelect = function() -- Line: 32, Name: onSelect
                    -- upvalues: u7 (ref), u11 (copy), u4 (ref)
                    u7(u11 - 1);
                    u4.SetSelectedSlot(u11);
                end
            };
        end;

        for i, v in SelectedEmotes do
            v13(v, i, SelectedEmotes);
        end;

        local u14 = 1;
        local v15 = false;

        while true do
            if v15 then
                u14 = u14 + 1;
            else
                v15 = true;
            end;

            if u14 > 8 then
                local function v18() -- Line: 73
                    -- upvalues: u2 (ref), Empty (ref), u8 (copy), u4 (copy), RadialWheel (ref), u1 (ref), u9 (copy), u6 (copy)
                    local createElement = u2.createElement;
                    local v16 = {};
                    local v17;

                    if u8 then
                        v17 = UDim2.fromScale(1, 0.5);
                    else
                        v17 = UDim2.fromScale(1, 1);
                    end;

                    v16.Size = v17;
                    local AnchorPoint = u4.AnchorPoint;

                    if not AnchorPoint then
                        if u8 then
                            AnchorPoint = Vector2.new(1, 0);
                        else
                            AnchorPoint = Vector2.new(0.5, 0.5);
                        end;
                    end;

                    v16.AnchorPoint = AnchorPoint;
                    local Position = u4.Position;

                    if not Position then
                        if u8 then
                            Position = UDim2.fromScale(1, 0);
                        else
                            Position = UDim2.fromScale(0.5, 0.5);
                        end;
                    end;

                    v16.Position = Position;

                    return createElement(Empty, v16, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 6)
                        }), u2.createElement(RadialWheel, {
                            numSlices = 8,
                            angleOffset = 270,
                            limitHoverDistance = true,
                            enableClickToSelect = true,
                            entries = u1.values(u9),
                            highlightSlice = u6,
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.9, 0.9)
                        }) });
                end;

                local v19 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = u4.Size,
                    LayoutOrder = u4.LayoutOrder
                };
                local v20 = { u2.createElement(v18) };
                local v21 = #v20;

                if u8 then
                    u8 = u2.createElement(LockerPreviewButtons, {
                        CanReplay = true,
                        Tab = LockerTab.EMOTES,
                        Element = u4.Element
                    });
                end;

                if u8 then
                    v20[v21 + 1] = u8;
                end;

                return u2.createFragment({
                    LockerShowcase = u2.createElement("Frame", v19, v20)
                });
            end;

            if u9[u14] == nil then
                u9[u14] = {
                    element = u2.createElement(EmoteShowcase, {
                        Emote = EmoteType.NONE
                    }),
                    title = "Slot " .. tostring(u14),

                    onSelect = function() -- Line: 63, Name: onSelect
                        -- upvalues: u7 (copy), u14 (ref), u4 (copy)
                        u7(u14 - 1);
                        u4.SetSelectedSlot(u14);
                    end
                };
            end;
        end;
    end)
};