-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutCubic = v1.InOutCubic;
local OutElastic = v1.OutElastic;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = UDim2.fromScale(0.18, 0.1);
local u5 = UDim2.fromScale(0.22, 0.11);

return {
    DasherProgressBar = v3.new(u2)(function(u6, p7) -- Line: 17
        -- upvalues: u4 (copy), GameSound (copy), Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), RuntimeLib (copy), default (copy), InOutCubic (copy), OutElastic (copy), u5 (copy), OutExpo (copy), u2 (copy)
        local useEffect = p7.useEffect;
        local useBinding = p7.useBinding;
        local v8, u9 = useBinding(0);
        local v10, u11 = useBinding(u4);
        local DAO_CHARGING = GameSound.DAO_CHARGING;
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;
        end;

        local v12;

        if LocalPlayer then
            local v13 = KnitClient.Controllers.KitController:getKitSkin(LocalPlayer);

            if v13 then
                v12 = BedwarsKitSkinMeta[v13].yuzi;

                if v12 ~= nil then
                    v12 = v12.dashChargingSound;
                end;

                local v14;

                if v12 == "" or not v12 then
                    v14 = v12;
                else
                    v14 = #v12 > 0;
                end;

                if v14 == "" then
                    v12 = DAO_CHARGING;
                elseif not v14 then
                    v12 = DAO_CHARGING;
                end;
            else
                v12 = DAO_CHARGING;
            end;
        else
            v12 = DAO_CHARGING;
        end;

        local u15 = SoundManager:playSound(v12);
        useEffect(function() -- Line: 47
            -- upvalues: RuntimeLib (ref), default (ref), u6 (copy), InOutCubic (ref), u9 (copy), SoundManager (ref), GameSound (ref), OutElastic (ref), u11 (copy), u4 (ref), u5 (ref), OutExpo (ref), u15 (copy)
            local u16 = true;
            RuntimeLib.Promise.try(function() -- Line: 49
                -- upvalues: default (ref), u6 (ref), InOutCubic (ref), u9 (ref), u16 (ref), SoundManager (ref), GameSound (ref), OutElastic (ref), u11 (ref), u4 (ref), u5 (ref), OutExpo (ref)
                default(u6.chargeTime, InOutCubic, function(p17) -- Line: 50
                    -- upvalues: u9 (ref), u6 (ref)
                    u9(p17 / u6.chargeTime);
                end, 0, u6.chargeTime):Wait();
                task.delay(0.05, function() -- Line: 53
                    -- upvalues: u16 (ref), SoundManager (ref), GameSound (ref)
                    if u16 then
                        SoundManager:playSound(GameSound.DAO_CHARGE_COMPLETE);
                    end;
                end);
                default(0.15, OutElastic, function(p18) -- Line: 58
                    -- upvalues: u11 (ref)
                    u11(p18);
                end, u4, u5):Wait();
                default(0.2, OutExpo, function(p19) -- Line: 61
                    -- upvalues: u11 (ref)
                    u11(p19);
                end, u5, u4);
            end);

            return function() -- Line: 65
                -- upvalues: u16 (ref), u15 (ref)
                u16 = false;
                local v20 = u15;

                if v20 ~= nil then
                    v20:Stop();
                end;
            end;
        end);

        return u2.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            Size = v10,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.7),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 10.95890410958904,
                DominantAxis = "Height"
            }), u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = v8:map(function(p21) -- Line: 86
                    return UDim2.fromScale(p21, 1);
                end)
            }, { u2.createElement("UIGradient", {
                    Color = ColorSequence.new(Color3.fromRGB(255, 33, 33), Color3.fromRGB(255, 89, 89))
                }) }) });
    end)
};