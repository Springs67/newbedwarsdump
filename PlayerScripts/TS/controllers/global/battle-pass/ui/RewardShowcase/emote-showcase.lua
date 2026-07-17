-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SpriteSheetPlayer = v1.SpriteSheetPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;

return {
    EmoteShowcase = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u3 (copy), EmoteMeta (copy), DeviceUtil (copy), u2 (copy), SpriteSheetPlayer (copy), KnitClient (copy), GameAnimationUtil (copy), ReplicatedStorage (copy), PlayerViewport (copy)
        local useEffect = p6.useEffect;
        local u7, _ = p6.useState(u3.createRef());
        local u8 = EmoteMeta[u5.Emote];

        if not u8 then
            return u3.createFragment();
        end;

        useEffect(function() -- Line: 22
            -- upvalues: DeviceUtil (ref), u8 (copy), u5 (copy), u2 (ref), u7 (copy), SpriteSheetPlayer (ref), KnitClient (ref)
            if DeviceUtil.isHoarceKat() or not u8 then
                return nil;
            end;

            if u5.PlaySound then
                local _ = u8.soundsOnBegin;
            end;

            local u9 = u2.new();
            local v10 = u8.spritesheet and u7:getValue();

            if v10 then
                local u11 = SpriteSheetPlayer.new(v10, u8.spritesheet);
                u11:play();
                u9:GiveTask(function() -- Line: 34
                    -- upvalues: u11 (copy)
                    u11:stop();
                    u11:disconnect();
                end);
            end;

            return function() -- Line: 40
                -- upvalues: KnitClient (ref), u9 (copy)
                KnitClient.Controllers.EmoteController:stopEmoteShowcase();
                u9:DoCleaning();
            end;
        end, { u5.Emote });
        local image = u8.image;

        if image == "" or not image then
            image = u8.animatedImage or u8.spritesheet;
        end;

        local v12;

        if image == "" or not image then
            if u8.animation then
                local v13 = {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Animation = GameAnimationUtil:getAssetId(u8.animation.type),
                    Size = u5.Size,
                    LayoutOrder = u5.LayoutOrder,
                    PreviewItemTypes = u8.animation.previewItems
                };
                local previewReplicatedStorageAssets = u8.animation.previewReplicatedStorageAssets;
                local v14;

                if previewReplicatedStorageAssets == nil then
                    v14 = previewReplicatedStorageAssets;
                else
                    local function v20(p15) -- Line: 84
                        -- upvalues: ReplicatedStorage (ref)
                        local v16 = string.split(p15, "/");
                        local Assets = ReplicatedStorage.Assets;

                        local function _(p17) -- Line: 87
                            -- upvalues: Assets (ref)
                            local v18 = Assets;

                            if v18 ~= nil then
                                v18 = v18:FindFirstChild(p17);
                            end;

                            if v18 then
                                Assets = v18;
                            end;
                        end;

                        for i, v in v16 do
                            local _ = i - 1;
                            local v19 = Assets;

                            if v19 ~= nil then
                                v19 = v19:FindFirstChild(v);
                            end;

                            if v19 then
                                Assets = v19;
                            end;
                        end;

                        return Assets;
                    end;

                    local v21 = 0;
                    v14 = {};

                    for i, v in previewReplicatedStorageAssets do
                        local v22 = v20(v, i - 1, previewReplicatedStorageAssets);

                        if v22 ~= nil then
                            v21 = v21 + 1;
                            v14[v21] = v22;
                        end;
                    end;
                end;

                v13.PreviewAccessories = v14;
                v13.ZIndex = u5.ZIndex;
                local Transparency = u5.Transparency;
                v13.ImageTransparency = Transparency == nil and 0 or Transparency;
                v12 = u3.createFragment({
                    RewardShowcase = u3.createElement(PlayerViewport, v13)
                });
            else
                v12 = u3.createFragment();
            end;
        else
            v12 = u3.createFragment({
                RewardShowcase = u3.createElement("ImageLabel", {
                    Image = u8.image,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = u5.Size or UDim2.fromScale(1, 1),
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    ImageTransparency = u5.Transparency,
                    LayoutOrder = u5.LayoutOrder,
                    ZIndex = u5.ZIndex,
                    [u3.Ref] = u7
                }, { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }) })
            });
        end;

        local v23 = {
            [#v23 + 1] = v12
        };

        return u3.createFragment(v23);
    end)
};