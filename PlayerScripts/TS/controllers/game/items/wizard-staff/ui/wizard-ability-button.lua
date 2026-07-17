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
local WizardUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    WizardAbilityButton = v4.new(u3)(function(u5, p6) -- Line: 15
        -- upvalues: AbilityMeta (copy), WizardUtil (copy), u3 (copy), DeviceUtil (copy), u2 (copy), Flamework (copy), ClientSyncEvents (copy), AbilityId (copy), BedwarsImageId (copy), Countdown (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(0);
        local v9, u10 = useState(false);
        local cooldown = AbilityMeta[u5.ability].cooldown;

        if cooldown ~= nil then
            cooldown = cooldown.id;
        end;

        local v11 = u5.activeAbility == u5.ability and true or u5.extra;
        local v12 = false;
        local v13 = 0;
        local v14 = {};

        while true do
            if v12 then
                v13 = v13 + 1;
            else
                v12 = true;
            end;

            local v15 = WizardUtil:getAbilityCost(u5.ability);

            if v13 >= (v15 == nil and 0 or v15) then
                useEffect(function() -- Line: 67
                    -- upvalues: DeviceUtil (ref), cooldown (copy), u2 (ref), Flamework (ref), u8 (copy), u10 (copy), ClientSyncEvents (ref)
                    if DeviceUtil.isHoarceKat() then
                        return nil;
                    end;

                    if cooldown == "" or not cooldown then
                        return nil;
                    end;

                    local u16 = u2.new();
                    local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(cooldown);

                    if v17 then
                        u8(v17.expire);
                        u10(true);
                    end;

                    u16:GiveTask(ClientSyncEvents.CooldownStarted:connect(function(p18) -- Line: 81
                        -- upvalues: cooldown (ref), Flamework (ref), u8 (ref), u10 (ref)
                        if p18.cooldownId ~= cooldown then
                            return nil;
                        end;

                        local v19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(cooldown);

                        if v19 ~= nil then
                            v19 = v19.expire;
                        end;

                        if v19 ~= 0 and (v19 == v19 and v19) then
                            u8(v19);
                        end;

                        u10(true);
                    end));
                    u16:GiveTask(ClientSyncEvents.CooldownExpired:connect(function(p20) -- Line: 95
                        -- upvalues: cooldown (ref), u10 (ref), u8 (ref)
                        if p20.cooldownId ~= cooldown then
                            return nil;
                        end;

                        u10(false);
                        u8(0);
                    end));

                    return function() -- Line: 102
                        -- upvalues: u16 (copy)
                        u16:DoCleaning();
                    end;
                end, {});
                local v21 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1)
                };
                local v22 = { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 0.8
                    }) };
                local v23 = #v22;
                local v26 = {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = v11 and 0.8 or 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,

                    [u3.Event.Activated] = function(p24, p25) -- Line: 125
                        -- upvalues: u5 (copy), AbilityId (ref), Flamework (ref)
                        if not u5.extra then
                            u5.ChangeAbility(u5.ability);
                        end;

                        if u5.ability == AbilityId.SHOCKWAVE then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SHOCKWAVE, p25, {
                                target = Vector3.new()
                            });
                        end;
                    end
                };
                local v27 = { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) };
                local _ = #v27;
                local v28 = {
                    Size = UDim2.fromScale(0.9, 0.9),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v29 = WizardUtil:getAbilityImage(u5.ability);

                if v29 == nil then
                    v29 = BedwarsImageId.WIZARD_LIGHTNING_STRIKE;
                end;

                v28.Image = v29;
                v28.ImageColor3 = Color3.fromHex("C0E8FF");
                v28.ImageTransparency = v11 and not v9 and 0 or 0.5;
                v28.ScaleType = "Fit";
                v28.BorderSizePixel = 0;
                v28.BackgroundTransparency = 1;
                v28.LayoutOrder = 1;
                v27.AbilityIcon = u3.createElement("ImageLabel", v28, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                v22.AbilityButton = u3.createElement("ImageButton", v26, v27);

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
                    v22[v23 + 1] = v9;
                end;

                local _ = #v22;
                local v30 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.2),
                    Position = UDim2.fromScale(0.5, -0.05),
                    AnchorPoint = Vector2.new(0.5, 0)
                };
                local v31 = { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.1, 0)
                    }) };
                local v32 = #v31;

                for i, v in v14 do
                    v31[v32 + i] = v;
                end;

                v22.ManaRequirementWrapper = u3.createElement("Frame", v30, v31);

                return u3.createFragment({
                    AbilityButtonContainer = u3.createElement("Frame", v21, v22)
                });
            end;

            local v33 = u3.createFragment({
                ManaCircle = u3.createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    Size = UDim2.fromScale(0.2, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 255, 238)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 10)
                    }), u3.createElement("UIStroke", {
                        Thickness = 1,
                        Transparency = 0,
                        Color = Color3.fromRGB(0, 48, 66)
                    }) })
            });
            table.insert(v14, v33);
        end;
    end)
};