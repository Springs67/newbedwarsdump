-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockHealthType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "shared", "block", "block-meta").BlockHealthType;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ProgressBar = v1.ProgressBar;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local SpiritGardenerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance;

return {
    SpiritGardenerFlowerHealthUi = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: BlockEngine (copy), BlockHealthType (copy), Players (copy), SpiritGardenerKitBalance (copy), StringUtil (copy), u2 (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(u4.spiritGardenerFlower.Position));
        local v7 = BlockEngine:getHandlerRegistry():getHandler(u4.spiritGardenerFlower.Name);

        if v7 ~= nil then
            v7 = v7:getBlockMeta();
        end;

        local u8 = "";
        local v9;

        if v7 == nil then
            v9 = v7;
        else
            v9 = v7.healthType;
        end;

        if v9 == BlockHealthType.GLOBAL then
            u8 = "Health";
        else
            if v7 ~= nil then
                v7 = v7.healthType;
            end;

            if v7 == BlockHealthType.PERSONAL then
                local _ = u8 == Players.LocalPlayer.Name .. "_Health";
            else
                u8 = tostring(BlockEngine:getDefaultHealthKey());
            end;
        end;

        local u10 = u4.spiritGardenerFlower:GetAttribute("MaxHealth");
        local v11, u12 = useState(0);

        local function _(p13) -- Line: 42
            -- upvalues: SpiritGardenerKitBalance (ref), StringUtil (ref)
            local v14 = math.max(0, (p13 - SpiritGardenerKitBalance.FLOWER_DAMAGED_THRESHOLD) / SpiritGardenerKitBalance.FLOWER_DECAY_PER_SECOND);

            return StringUtil.formatCountdownTime(v14, {
                hours = false,
                days = false,
                seperator = ":"
            });
        end;

        local v15 = math.max(0, (1 - SpiritGardenerKitBalance.FLOWER_DAMAGED_THRESHOLD) / SpiritGardenerKitBalance.FLOWER_DECAY_PER_SECOND);
        local v16, u17 = useState((StringUtil.formatCountdownTime(v15, {
            hours = false,
            days = false,
            seperator = ":"
        })));
        local v18, u19 = useState(false);
        local v20, u21 = useState(false);
        useEffect(function() -- Line: 55
            -- upvalues: u6 (copy), u4 (copy), u19 (copy), u21 (copy), u8 (ref), u12 (copy), SpiritGardenerKitBalance (ref), u10 (copy), u17 (copy), StringUtil (ref)
            if not u6 then
                return nil;
            end;

            local u23 = u4.spiritGardenerFlower:GetAttributeChangedSignal("FlowerDamaged"):Connect(function() -- Line: 59
                -- upvalues: u4 (ref), u19 (ref)
                local v22 = u4.spiritGardenerFlower:GetAttribute("FlowerDamaged");

                if v22 == 0 or (v22 ~= v22 or (v22 == "" or not v22)) then
                    u19(false);

                    return;
                end;

                u19(true);
            end);
            local u25 = u4.spiritGardenerFlower:GetAttributeChangedSignal("HasFullyGrown"):Connect(function() -- Line: 67
                -- upvalues: u4 (ref), u21 (ref)
                local v24 = u4.spiritGardenerFlower:GetAttribute("HasFullyGrown");

                if v24 == 0 or (v24 ~= v24 or (v24 == "" or not v24)) then
                    u21(false);

                    return;
                end;

                u21(true);
            end);
            local u29 = u6.AttributeChanged:Connect(function(p26) -- Line: 75
                -- upvalues: u8 (ref), u6 (ref), u12 (ref), SpiritGardenerKitBalance (ref), u10 (ref), u17 (ref), StringUtil (ref)
                if p26 ~= u8 then
                    return nil;
                end;

                local v27 = u6:GetAttribute(u8);
                u12((v27 - SpiritGardenerKitBalance.FLOWER_DAMAGED_THRESHOLD) / (u10 - SpiritGardenerKitBalance.FLOWER_DAMAGED_THRESHOLD));
                local v28 = math.max(0, (v27 - SpiritGardenerKitBalance.FLOWER_DAMAGED_THRESHOLD) / SpiritGardenerKitBalance.FLOWER_DECAY_PER_SECOND);
                u17((StringUtil.formatCountdownTime(v28, {
                    hours = false,
                    days = false,
                    seperator = ":"
                })));
            end);

            return function() -- Line: 84
                -- upvalues: u29 (copy), u23 (copy), u25 (copy)
                u29:Disconnect();
                u23:Disconnect();
                u25:Disconnect();
            end;
        end, {
            v16,
            v11,
            v18,
            v20
        });
        local v30 = {
            StudsOffset = Vector3.new(0, 2.5, 0),
            MaxDistance = 33,
            AlwaysOnTop = true,
            Adornee = u4.billboardPart,
            Size = UDim2.fromScale(4, 0.45)
        };
        local v31 = {};
        local v32 = #v31;
        local v33 = not v20 and u2.createElement("TextLabel", {
            Text = "NEEDS ENERGY",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextXAlignment = "Center",
            TextYAlignment = "Center",
            TextStrokeTransparency = 0,
            ZIndex = 60,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        });

        if v33 then
            v31[v32 + 1] = v33;
        end;

        local v34 = #v31;
        local v35 = v20 and not v18 and u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextXAlignment = "Center",
            TextYAlignment = "Center",
            TextStrokeTransparency = 0,
            ZIndex = 60,
            Text = tostring(v16),
            Size = UDim2.fromScale(1, 1),
            FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        });

        if v35 then
            v31[v34 + 1] = v35;
        end;

        local v36 = #v31;

        if v18 then
            v18 = u2.createElement("TextLabel", {
                Text = "WITHERED",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                TextStrokeTransparency = 0,
                ZIndex = 60,
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            });
        end;

        if v18 then
            v31[v36 + 1] = v18;
        end;

        v31[#v31 + 1] = u2.createElement(ProgressBar, {
            AcceptZero = true,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0),
            Progress = v11,
            ChangingBarColor = {
                MinBarColor = Color3.fromRGB(255, 0, 0),
                MaxBarColor = Color3.fromRGB(0, 255, 0)
            },
            BarCornerRadius = UDim.new(0.2)
        });

        return u2.createElement("BillboardGui", v30, v31);
    end)
};