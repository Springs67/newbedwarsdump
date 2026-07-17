-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local SpriteSheetPlayer = v1.SpriteSheetPlayer;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local EngineerFilmEffect = RuntimeLib.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GlitchedText = RuntimeLib.import(script, script.Parent, "glitched-text", "glitched-text").GlitchedText;

return {
    GlitchedMatchAnnouncement = v5.new(u4)(function(u6, p7) -- Line: 17
        -- upvalues: u4 (copy), u2 (copy), SoundManager (copy), GameSound (copy), UIUtil (copy), GlitchedText (copy), SpriteSheetPlayer (copy), Workspace (copy), u3 (copy), BalanceFile (copy), Empty (copy), EngineerFilmEffect (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u4.createRef();
        local u9 = u4.createRef();
        local v10, u11 = u4.createBinding(1);
        useEffect(function() -- Line: 23
            -- upvalues: u2 (ref), u6 (copy), u9 (copy), SoundManager (ref), GameSound (ref), u4 (ref), UIUtil (ref), GlitchedText (ref), u11 (copy), u8 (copy), SpriteSheetPlayer (ref), Workspace (ref), u3 (ref), BalanceFile (ref)
            local u12 = u2.new();
            local u13 = u6.tonedDownEffects and 1 or 11;
            local u14 = u9:getValue();

            if u14 then
                SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                    volumeMultiplier = 0.5
                });
                local v15 = {
                    Text = "Glitched Lucky Block!",
                    FrameProps = {
                        AnchorPoint = Vector2.new(0.5, 1),
                        Position = UIUtil:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
                        Size = UDim2.new(0.8, 0, 0.1, 0)
                    },
                    TextLabelProps = {
                        TextTransparency = 0,
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        ZIndex = 3,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.SciFi,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }
                };
                u4.mount(u4.createElement(GlitchedText, v15), u14);
                task.wait(0.75);
                task.spawn(function() -- Line: 58
                    -- upvalues: u13 (copy), SoundManager (ref), GameSound (ref), u4 (ref), UIUtil (ref), GlitchedText (ref), u14 (copy)
                    local v16 = false;
                    local v17 = 0;

                    while true do
                        if v16 then
                            v17 = v17 + 1;
                        else
                            v16 = true;
                        end;

                        if v17 >= u13 - 1 then
                            return;
                        end;

                        local v18 = v17 == math.round(u13 / 2) - 1;
                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                            volumeMultiplier = 0.5
                        });
                        local v19 = {
                            Text = v17 == 0 and "Glitched Lucky Block" or "CRITICAL ERROR!",
                            FrameProps = {
                                AnchorPoint = Vector2.new(0.5, 1),
                                Position = UIUtil:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
                                Size = UDim2.new(0.8, 0, v18 and 0.1 or 0.05, 0)
                            },
                            TextLabelProps = {
                                TextScaled = true,
                                RichText = true,
                                BackgroundTransparency = 1,
                                ZIndex = 3,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.new(0.5, 0, 0.5, 0),
                                Size = UDim2.new(1, 0, 1, 0),
                                Font = Enum.Font.SciFi,
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                TextTransparency = v18 and 0 or 0.3
                            }
                        };
                        u4.mount(u4.createElement(GlitchedText, v19), u14);
                        task.wait(0.05);
                    end;
                end);
            end;

            SoundManager:playSound(GameSound.GLITCH_OVERLAY_2, {
                volumeMultiplier = 0.6
            });
            u11(0.925);
            local u20 = SoundManager:playSound(GameSound.TV_STATIC, {
                looped = true,
                volumeMultiplier = u6.tonedDownEffects and 0.1 or 0.175
            });
            u12:GiveTask(function() -- Line: 115
                -- upvalues: u20 (copy)
                local v21 = u20;

                if v21 ~= nil then
                    v21:Stop();
                end;

                local v22 = u20;

                if v22 ~= nil then
                    v22:Destroy();
                end;
            end);
            local v23 = u8:getValue();
            local u24;

            if v23 then
                u24 = SpriteSheetPlayer.new(v23, {
                    image = "rbxassetid://10844183471",
                    imageWidth = 807,
                    imageHeight = 1023,
                    rows = 4,
                    columns = 3,
                    sprites = 12,
                    imageTransparency = u6.tonedDownEffects and 0.75 or 0.6,
                    config = {
                        framesPerSecond = 30,
                        numLoops = u6.tonedDownEffects and 1 or 2
                    }
                });
                u24:play();
                SoundManager:playSound(GameSound.GLITCH_OVERLAY);
            else
                u24 = nil;
            end;

            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera then
                local v25 = u3("DepthOfFieldEffect", {
                    Name = "GlitchDOF",
                    InFocusRadius = 15,
                    Parent = CurrentCamera
                });
                local v26 = u3("BlurEffect", {
                    Name = "GlitchBlur",
                    Size = 24,
                    Parent = CurrentCamera
                });
                u12:GiveTask(v25);
                u12:GiveTask(v26);
            end;

            task.delay(BalanceFile.GLITCH_LB_ANNOUNCEMENT_DURATION - 0.2, function() -- Line: 162
                -- upvalues: u11 (ref), u24 (ref), SoundManager (ref), GameSound (ref), u12 (copy)
                u11(0.75);
                local v27 = u24;

                if v27 ~= nil then
                    v27:play();
                end;

                SoundManager:playSound(GameSound.GLITCH_OVERLAY);
                u12:DoCleaning();
            end);

            local function _() -- Line: 171
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end;
        end, {});
        local v28 = { u4.createElement("ImageLabel", {
                Size = UDim2.fromScale(1, 1),
                [u4.Ref] = u8,
                BackgroundTransparency = 1,
                ZIndex = 10
            }), u4.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                [u4.Ref] = u9
            }, { u4.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0.03, 0)
                }) }) };
        local v29 = #v28;
        local v30 = not u6.tonedDownEffects and u4.createElement(EngineerFilmEffect, {
            transparency = v10
        });

        if v30 then
            v28[v29 + 1] = v30;
        end;

        return u4.createFragment(v28);
    end)
};