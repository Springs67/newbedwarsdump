-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local GroupModifierBehavior = v1.GroupModifierBehavior;
local ModifierGroup = v1.ModifierGroup;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local InQuart = v2.InQuart;
local Linear = v2.Linear;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local useEffect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src", "Runtime").useEffect;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Workspace = v5.Workspace;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lighting", "default-lighting-constants");
local DefaultAtmosphereProperties = v6.DefaultAtmosphereProperties;
local DefaultLightingProperties = v6.DefaultLightingProperties;
local u7 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "rain");
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u8 = Random.new();
local u9 = nil;
local u10 = nil;

return {
    ManageAtmosphereBehavior = {
        name = "Manage Atmosphere",
        event = "Heartbeat",

        func = function(u11, p12, p13) -- Line: 33, Name: func
            -- upvalues: u9 (ref), DeviceUtil (copy), ModifierGroup (copy), Lighting (copy), u3 (copy), GroupModifierBehavior (copy), KnitClient (copy), u10 (ref), InQuart (copy), PirateSceneTimestamps (copy), InQuad (copy), Linear (copy), DefaultAtmosphereProperties (copy), DefaultLightingProperties (copy), u7 (copy), Workspace (copy), GameQueryUtil (copy), u8 (copy), SoundManager (copy), GameSound (copy), u4 (copy), OutQuad (copy), useEffect (copy)
            local u14;

            if u11.chainInfo == nil then
                u14 = false;
            else
                u14 = u11.chainInfo.stageInChain > 0;
            end;

            if not u9 then
                local v15;

                if DeviceUtil.isHoarceKat() then
                    v15 = ModifierGroup.new(Lighting:FindFirstChildOfClass("Atmosphere") or u3("Atmosphere", {
                        Parent = Lighting
                    }), {
                        baseProperties = {
                            Density = 0.25,
                            Offset = 0,
                            Glare = 0,
                            Haze = 0,
                            Color = Color3.fromRGB(198, 198, 198),
                            Decay = Color3.fromRGB(104, 112, 124)
                        },
                        behavior = GroupModifierBehavior.Merge
                    });
                else
                    v15 = KnitClient.Controllers.LightingController:getAtmosphereModifier();
                end;

                u9 = v15;
            end;

            if not u10 then
                local v16;

                if DeviceUtil.isHoarceKat() then
                    v16 = ModifierGroup.new(Lighting, {
                        baseProperties = {
                            Brightness = 2,
                            EnvironmentDiffuseScale = 0.1,
                            EnvironmentSpecularScale = 0.1,
                            GlobalShadows = true,
                            ShadowSoftness = 0.2,
                            ClockTime = 14,
                            GeographicLatitude = -7,
                            ExposureCompensation = 0.05,
                            Ambient = Color3.fromRGB(89, 60, 86),
                            ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
                            ColorShift_Top = Color3.fromRGB(117, 57, 57),
                            OutdoorAmbient = Color3.fromRGB(216, 191, 161)
                        },
                        behavior = GroupModifierBehavior.Merge
                    });
                else
                    v16 = KnitClient.Controllers.LightingController.lightingModifier;
                end;

                u10 = v16;
            end;

            local v17;

            if u14 == true then
                v17 = 1;
            else
                local v18 = InQuart(u11.elapsedEventTime, 0, 1, u11.totalLength) * 10000;
                local v19 = math.floor(v18) / 10000;
                v17 = math.clamp(v19, 0, 1);
            end;

            if u14 and u11.elapsedEventTime > PirateSceneTimestamps.HouseExplodes then
                if u11.elapsedEventTime < PirateSceneTimestamps.CelebrationEnds + 0 then
                    local v20 = InQuad(u11.elapsedEventTime - PirateSceneTimestamps.HouseExplodes, 1, -1, PirateSceneTimestamps.CelebrationEnds - PirateSceneTimestamps.HouseExplodes);
                    v17 = math.clamp(v20, 0, 1);
                else
                    local v21 = InQuad(u11.elapsedEventTime - PirateSceneTimestamps.CelebrationEnds + 0, 0, 1, 2);
                    v17 = math.clamp(v21, 0, 1);
                end;
            end;

            if p12:get("atmosphereModifier") then
                if u14 == true or u11.elapsedEventTime > u11.totalLength * 0.5 then
                    p12:get("atmosphereModifier"):setProperties({
                        Density = Linear(v17, DefaultAtmosphereProperties.Density, 0.35 - DefaultAtmosphereProperties.Density, 1),
                        Color = DefaultAtmosphereProperties.Color:Lerp(Color3.fromRGB(52, 70, 66), v17),
                        Haze = Linear(v17, DefaultAtmosphereProperties.Haze, 10 - DefaultAtmosphereProperties.Haze, 1)
                    });
                end;
            else
                p12:set("atmosphereModifier", u9:addModifier(100, {}));
            end;

            if p12:get("lightingModifier") then
                p12:get("lightingModifier"):setProperties({
                    Ambient = DefaultLightingProperties.Ambient:Lerp(Color3.fromRGB(47, 60, 85), v17),
                    ColorShift_Top = DefaultLightingProperties.ColorShift_Top:Lerp(Color3.fromRGB(0, 0, 0), v17),
                    OutdoorAmbient = DefaultLightingProperties.OutdoorAmbient:Lerp(Color3.fromRGB(88, 112, 117), v17),
                    ClockTime = Linear(v17, DefaultLightingProperties.ClockTime, 10 - DefaultLightingProperties.ClockTime, 1),
                    Brightness = Linear(v17, DefaultLightingProperties.Brightness, 1 - DefaultLightingProperties.Brightness, 1)
                });
            else
                p12:set("lightingModifier", u10:addModifier(100, {}));
            end;

            local v22 = p12:get("rainEnabled");

            if u14 == true or u11.elapsedEventTime > u11.totalLength * 0.7 then
                if v22 ~= true then
                    u7:Enable();
                    u7:SetIntensityRatio(0.2);
                    u7:SetTransparency(0.8);
                    u7:SetStraightTexture("rbxassetid://8030734851");
                    u7:SetSplashTexture("rbxassetid://8030760338");
                    u7:SetDirection(Vector3.new(0.1, -1, 0));
                    u7:SetSoundId("");
                    u7:SetSize(1);
                    local __RainEmitter = Workspace.CurrentCamera:FindFirstChild("__RainEmitter");

                    if __RainEmitter then
                        GameQueryUtil:setQueryIgnored(__RainEmitter, true);
                    end;

                    p12:set("rainEnabled", true);
                    v22 = true;
                end;
            else
                p12:set("rainEnabled", nil);
                v22 = nil;
            end;

            if v22 == nil then
                u7:Disable();
            end;

            if p12:get("thunderLightningModifier") then
                if u14 == true or u11.elapsedEventTime > u11.totalLength * 0.8 then
                    local v23 = p12:get("nextThunder");

                    if v23 == 0 or (v23 ~= v23 or not v23) then
                        p12:set("nextThunder", os.clock() + u8:NextNumber(7, 15));
                    elseif v23 < os.clock() and (u11.elapsedEventTime >= PirateSceneTimestamps.CelebrationEnds or (u11.elapsedEventTime <= PirateSceneTimestamps.CelebrationStarts or not u14)) then
                        p12:set("nextThunder", os.clock() + u8:NextNumber(7, 15));
                        local u24 = p12:get("thunderLightningModifier");
                        task.spawn(function() -- Line: 137
                            -- upvalues: SoundManager (ref), GameSound (ref), u8 (ref), u24 (copy)
                            SoundManager:playSound(GameSound.PIRATE_EVENT_THUNDER);
                            local v25 = u8:NextInteger(1, 3);
                            local v26 = false;
                            local v27 = 0;

                            while true do
                                if v26 then
                                    v27 = v27 + 1;
                                else
                                    v26 = true;
                                end;

                                if v27 >= v25 then
                                    return;
                                end;

                                task.wait(u8:NextNumber(0.05, 0.3));
                                local v28 = u24;

                                if v28 ~= nil then
                                    v28:setProperties({
                                        Brightness = 4 + u8:NextNumber(0, 3)
                                    });
                                end;

                                task.wait(u8:NextNumber(0.05, 0.3));
                                local v29 = u24;

                                if v29 ~= nil then
                                    v29:setProperties({});
                                end;
                            end;
                        end);
                    end;
                end;
            else
                p12:set("thunderLightningModifier", u10:addModifier(200, {}));
            end;

            u4.portal(Workspace.Terrain, function() -- Line: 169
                -- upvalues: u4 (ref), u14 (copy), OutQuad (ref), u11 (copy), useEffect (ref)
                local u31 = u4.useInstance(function(p30) -- Line: 170
                    local Clouds = Instance.new("Clouds");
                    p30.clouds = Clouds;

                    return Clouds;
                end);
                local u32;

                if u14 == true then
                    u32 = 1;
                else
                    local v33 = OutQuad(u11.elapsedEventTime, 0, 1, u11.totalLength) * 100;
                    u32 = math.floor(v33) / 100;
                end;

                useEffect(function() -- Line: 176
                    -- upvalues: u31 (copy), u32 (copy)
                    u31.clouds.Cover = u32 * 0.8;
                    u31.clouds.Density = u32;
                    u31.clouds.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(15, 25, 36), u32);
                end, u32);
            end);
        end
    }
};