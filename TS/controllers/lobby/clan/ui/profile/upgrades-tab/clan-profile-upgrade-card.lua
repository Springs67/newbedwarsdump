-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local ClanUpgradeMeta = v5.ClanUpgradeMeta;
local ClanUpgradeTypeMeta = v5.ClanUpgradeTypeMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfileUpgradeCard = v4.new(u3)(function(u6, p7) -- Line: 15
        -- upvalues: ClanUpgradeTypeMeta (copy), ClanUpgradeMeta (copy), u2 (copy), u3 (copy), Theme (copy), SoundManager (copy), GameSound (copy), TweenService (copy), ColorUtil (copy)
        local _ = p7.useState;
        local v8 = ClanUpgradeTypeMeta[u6.UpgradeType];
        local v9;

        if u6.UpgradeTier then
            v9 = ClanUpgradeMeta[u6.UpgradeTier];
        else
            v9 = ClanUpgradeMeta[v8.firstUpgrade];
        end;

        local u10 = u2.new();
        local u11 = u6.SelectedUpgrade == u6.UpgradeTier;
        local createFragment = u3.createFragment;
        local v12 = {};
        local createElement = u3.createElement;
        local v13 = {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 1
        };
        local v14;

        if u11 then
            v14 = Theme.textPrimary;
        else
            v14 = Theme.backgroundPrimary;
        end;

        v13.BorderColor3 = v14;
        v13.BorderMode = "Inset";
        v13.LayoutOrder = 1;
        v13.AutoButtonColor = false;

        v13[u3.Event.Activated] = function(p15) -- Line: 30
            -- upvalues: u6 (copy), SoundManager (ref), GameSound (ref), u10 (copy), TweenService (ref)
            u6.OnClick(u6.UpgradeTier);
            SoundManager:playSound(GameSound.UI_CLICK);
            u10:DoCleaning();
            local u16 = TweenService:Create(p15, TweenInfo.new(0.12), {
                BackgroundTransparency = 0
            });
            u16:Play();
            u10:GiveTask(function() -- Line: 38
                -- upvalues: u16 (copy)
                u16:Cancel();
            end);
        end;

        v13[u3.Event.MouseEnter] = function(p17) -- Line: 42
            -- upvalues: u11 (copy), u10 (copy), TweenService (ref)
            if u11 then
                return nil;
            end;

            u10:DoCleaning();
            local u18 = TweenService:Create(p17, TweenInfo.new(0.12), {
                BackgroundTransparency = 0.3
            });
            u18:Play();
            u10:GiveTask(function() -- Line: 51
                -- upvalues: u18 (copy)
                u18:Cancel();
            end);
        end;

        v13[u3.Event.MouseLeave] = function(p19) -- Line: 55
            -- upvalues: u11 (copy), u10 (copy), TweenService (ref)
            if u11 then
                return nil;
            end;

            u10:DoCleaning();
            local u20 = TweenService:Create(p19, TweenInfo.new(0.12), {
                BackgroundTransparency = 0
            });
            u20:Play();
            u10:GiveTask(function() -- Line: 64
                -- upvalues: u20 (copy)
                u20:Cancel();
            end);
        end;

        v12.UpgradeCard = createElement("ImageButton", v13, {
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center"
            }),
            u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }),
            u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.8, 1),
                Text = "<b>" .. v8.name .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }),
            u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Right",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.2, 1),
                Text = "<b>Lv. " .. tostring(v9.level) .. "</b>",
                TextColor3 = Theme.mcYellow
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) })
        });

        return createFragment(v12);
    end)
};