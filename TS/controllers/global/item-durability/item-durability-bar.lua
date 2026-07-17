-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    ItemDurabilityBar = v3.new(u2)(function(u4, p5) -- Line: 8
        -- upvalues: getItemMeta (copy), u1 (copy), u2 (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local durability = getItemMeta(u4.inventoryItem.itemType).durability;

        if durability ~= nil then
            durability = durability.itemHealth;
        end;

        local u6 = durability == nil and 100 or durability;
        local v7, u8 = useState(u4.inventoryItem.tool:GetAttribute("Durability") / u6);
        useEffect(function() -- Line: 23
            -- upvalues: u1 (ref), u4 (copy), u8 (copy), u6 (copy)
            local u9 = u1.new();
            u9:GiveTask(u4.inventoryItem.tool:GetAttributeChangedSignal("Durability"):Connect(function() -- Line: 25
                -- upvalues: u4 (ref), u8 (ref), u6 (ref)
                local v10 = u4.inventoryItem.tool:GetAttribute("Durability");
                u8((v10 == nil and 0 or v10) / u6);
            end));

            return function() -- Line: 32
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});
        local uiStrokeColor = u4.uiStrokeColor;

        if uiStrokeColor then
            local v11 = {
                Thickness = 1,
                Color = u4.uiStrokeColor
            };
            local uiStrokeTransparency = u4.uiStrokeTransparency;
            v11.Transparency = uiStrokeTransparency == nil and 0 or uiStrokeTransparency;
            uiStrokeColor = u2.createElement("UIStroke", v11);
        end;

        local v12 = {
            AcceptZero = true,
            AnchorPoint = u4.AnchorPoint,
            Position = u4.Position,
            Size = u4.Size,
            Progress = v7,
            ChangingBarColor = {
                MinBarColor = Color3.fromRGB(255, 0, 0),
                MaxBarColor = Color3.fromRGB(0, 255, 0)
            },
            ZIndex = u4.ZIndex
        };
        local v13 = {};
        local v14 = #v13;

        if uiStrokeColor then
            v13[v14 + 1] = uiStrokeColor;
        end;

        return u2.createElement(ProgressBar, v12, v13);
    end)
};