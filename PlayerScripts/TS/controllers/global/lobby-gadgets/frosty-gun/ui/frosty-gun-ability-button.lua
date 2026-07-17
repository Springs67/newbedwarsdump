-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local FrostyGunMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyGunMode;

return {
    FrostyGunButton = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: AbilityMeta (copy), AbilityId (copy), DeviceUtil (copy), u2 (copy), Flamework (copy), ClientSyncEvents (copy), u3 (copy), FrostyGunMode (copy), Countdown (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(0);
        local v9, u10 = useState(false);
        local cooldown = AbilityMeta[AbilityId.FROSTY_GUN_SWAP].cooldown;

        if cooldown ~= nil then
            cooldown = cooldown.id;
        end;

        local v11 = u5.activeMode == u5.buttonMode and true or u5.extra;
        local v12 = {};
        useEffect(function() -- Line: 26
            -- upvalues: DeviceUtil (ref), cooldown (copy), u2 (ref), Flamework (ref), u8 (copy), u10 (copy), ClientSyncEvents (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            if cooldown == "" or not cooldown then
                return nil;
            end;

            local u13 = u2.new();
            local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(cooldown);

            if v14 then
                u8(v14.expire);
                u10(true);
            end;

            u13:GiveTask(ClientSyncEvents.CooldownStarted:connect(function(p15) -- Line: 40
                -- upvalues: cooldown (ref), Flamework (ref), u8 (ref), u10 (ref)
                if p15.cooldownId ~= cooldown then
                    return nil;
                end;

                local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(cooldown);

                if v16 ~= nil then
                    v16 = v16.expire;
                end;

                if v16 ~= 0 and (v16 == v16 and v16) then
                    u8(v16);
                end;

                u10(true);
            end));
            u13:GiveTask(ClientSyncEvents.CooldownExpired:connect(function(p17) -- Line: 54
                -- upvalues: cooldown (ref), u10 (ref), u8 (ref)
                if p17.cooldownId ~= cooldown then
                    return nil;
                end;

                u10(false);
                u8(0);
            end));

            return function() -- Line: 61
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end;
        end, {});
        local v18 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v21 = {
            u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.8
            }),
            AbilityButton = u3.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = v11 and 0.8 or 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,

                [u3.Event.Activated] = function(p19, p20) -- Line: 82
                    -- upvalues: u5 (copy)
                    u5.ChangeAbility(u5.buttonMode);
                end
            }, {
                u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                AbilityIcon = u3.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.9, 0.9),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = u5.buttonMode == FrostyGunMode.MIST and "rbxassetid://11611911951" or "rbxassetid://139613766654382",
                    ImageColor3 = Color3.fromHex("C0E8FF"),
                    ImageTransparency = v11 and not v9 and 0 or 0.5
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            })
        };
        local v22 = #v21;

        if v7 > 0 then
            if v9 then
                v9 = u3.createElement(Countdown, {
                    UseOsClock = true,
                    OnCompleteText = "",
                    EndTime = v7,
                    CountdownConfig = {
                        days = false,
                        hours = false,
                        minutes = false,
                        seconds = true,
                        disablePadding = true,
                        decimalPoints = 1,
                        seperator = ""
                    },
                    TextLabel = {
                        Size = UDim2.fromScale(0.8, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }
                });
            end;
        else
            v9 = false;
        end;

        if v9 then
            v21[v22 + 1] = v9;
        end;

        local _ = #v21;
        local v23 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.fromScale(0.5, -0.05),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v24 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.1, 0)
            }) };
        local v25 = #v24;

        for i, v in v12 do
            v24[v25 + i] = v;
        end;

        v21.ManaRequirementWrapper = u3.createElement("Frame", v23, v24);

        return u3.createFragment({
            AbilityButtonContainer = u3.createElement("Frame", v18, v21)
        });
    end)
};