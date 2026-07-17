-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BloodAssassinContracts = RuntimeLib.import(script, script.Parent, "blood-assassin-contracts").BloodAssassinContracts;
local BloodAssassinFrame = RuntimeLib.import(script, script.Parent, "blood-assassin-frame").BloodAssassinFrame;
local BloodAssassinLearningList = RuntimeLib.import(script, script.Parent, "blood-assassin-learning-list").BloodAssassinLearningList;

return {
    ContractSelectComponent = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), u1 (copy), BloodAssassinFrame (copy), BloodAssassinLearningList (copy), BloodAssassinContracts (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local v7, u8 = useState(20);
        useEffect(function() -- Line: 14
            -- upvalues: u1 (ref), u6 (copy), u8 (copy)
            local u9 = u1.new();
            local u10 = u6:getValue();

            if u10 then
                u8(u10.AbsoluteSize.Y * 0.09101941747572816);
                u9:GiveTask((u10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 19
                    -- upvalues: u8 (ref), u10 (copy)
                    u8(u10.AbsoluteSize.Y * 0.09101941747572816);
                end)));
            end;

            return function() -- Line: 24
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        return u2.createFragment({ u2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.8),
                BackgroundTransparency = 1,
                [u2.Ref] = u6
            }, { u2.createElement(BloodAssassinFrame, {
                    Title = "DARK LEARNINGS",
                    Size = UDim2.fromScale(0.34798534798534797, 0.6553398058252428),
                    HeaderSizePixels = v7
                }, { u2.createElement(BloodAssassinLearningList, {
                        bloodUpgrades = p4.bloodUpgrades
                    }) }), u2.createElement(BloodAssassinFrame, {
                    Title = "CONTRACTS",
                    Size = UDim2.fromScale(0.6111111111111112, 0.9902912621359223),
                    HeaderSizePixels = v7,
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0)
                }, { u2.createElement(BloodAssassinContracts, {
                        activeContract = p4.activeContract,
                        availableContracts = p4.availableContracts
                    }) }) }) });
    end)
};