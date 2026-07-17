-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    MimicBlockFace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), ColorUtil (copy), u2 (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState(0);
        useEffect(function() -- Line: 12
            -- upvalues: u1 (ref), u6 (copy)
            local u7 = u1.new();
            local u8 = true;
            u7:GiveTask(function() -- Line: 15
                -- upvalues: u8 (ref)
                u8 = false;

                return u8;
            end);
            task.spawn(function() -- Line: 19
                -- upvalues: u8 (ref), u6 (ref)
                local v9 = os.clock();

                while true do
                    local v10 = task.wait(0);

                    if v10 ~= 0 and (v10 == v10 and v10) then
                        v10 = u8;
                    end;

                    if v10 == 0 or (v10 ~= v10 or not v10) then
                        return;
                    end;

                    local v11 = (os.clock() - v9) / 0.5;
                    u6((math.pow(v11, 1.5)));
                end;
            end);

            return function() -- Line: 33
                -- upvalues: u7 (copy)
                u7:DoCleaning();
            end;
        end, {});
        local u12 = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.hexColor(16761445)), ColorSequenceKeypoint.new(0.5, ColorUtil.hexColor(6684520)), ColorSequenceKeypoint.new(1, ColorUtil.hexColor(14247423)) });
        local u13 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.75),
            NumberSequenceKeypoint.new(0.6, 1),
            NumberSequenceKeypoint.new(0.7, 0.75),
            NumberSequenceKeypoint.new(0.8, 1),
            NumberSequenceKeypoint.new(0.9, 0.5),
            NumberSequenceKeypoint.new(1, 0.6)
        });

        if p3.face == Enum.NormalId.Left then
            local Keypoints = u12.Keypoints;

            local function _(p14) -- Line: 41
                return ColorSequenceKeypoint.new(1 - p14.Time, p14.Value);
            end;

            local v15 = table.create(#Keypoints);

            for i, v in Keypoints do
                local _ = i - 1;
                v15[i] = ColorSequenceKeypoint.new(1 - v.Time, v.Value);
            end;

            table.sort(v15, function(p16, p17) -- Line: 50
                return p16.Time < p17.Time;
            end);
            u12 = ColorSequence.new(v15);
            local Keypoints2 = u13.Keypoints;

            local function _(p18) -- Line: 56
                return NumberSequenceKeypoint.new(1 - p18.Time, p18.Value);
            end;

            local v19 = table.create(#Keypoints2);

            for i, v in Keypoints2 do
                local _ = i - 1;
                v19[i] = NumberSequenceKeypoint.new(1 - v.Time, v.Value);
            end;

            table.sort(v19, function(p20, p21) -- Line: 65
                return p20.Time < p21.Time;
            end);
            u13 = NumberSequence.new(v19);
        end;

        local function v33(p22) -- Line: 72
            -- upvalues: u12 (ref), u13 (ref)
            local u23 = math.clamp(p22, 0, 1);
            local v24 = u12.Keypoints[1];
            local v25 = nil;

            for _, v in u12.Keypoints do
                if v24.Time <= u23 and u23 <= v.Time then
                    local v26 = v.Time - v24.Time;

                    if v26 > 0 then
                        v25 = v24.Value:Lerp(v.Value, (u23 - v24.Time) / v26);
                    else
                        v25 = v24.Value;
                    end;

                    break;
                end;

                v24 = v;
            end;

            local function _(p27) -- Line: 91
                -- upvalues: u23 (ref)
                return u23 <= p27.Time;
            end;

            local v28 = -1;

            for i, v in u13.Keypoints do
                local _ = i - 1;

                if u23 <= v.Time == true then
                    v28 = i - 1;
                    break;
                end;
            end;

            local v29;

            if v28 == 0 then
                v29 = u13.Keypoints[v28 + 1].Value;
            else
                local v30 = u13.Keypoints[v28 + 1];
                local v31 = u13.Keypoints[v28 - 1 + 1];
                local v32 = (u23 - v30.Time) / (v31.Time - v30.Time);
                v29 = v30.Value * (1 - v32) + v31.Value * v32;
            end;

            return {
                transparencyResult = v29,
                colorResult = v25
            };
        end;

        local v34 = table.find({ Enum.NormalId.Front, Enum.NormalId.Back }, p3.face) ~= nil;
        local v35 = u12;
        local v36 = u13;

        if v34 then
            local v37 = v33(1 - (v5 + (p3.face == Enum.NormalId.Front and 0 or 0.5)));
            v35 = ColorSequence.new(v37.colorResult);
            v36 = NumberSequence.new(v37.transparencyResult);
        end;

        local createElement = u2.createElement;
        local v38 = {
            LightInfluence = 0,
            Brightness = 6,
            ClipsDescendants = true,
            Face = p3.face
        };
        local v39 = {};
        local createElement2 = u2.createElement;
        local v40 = {
            Size = UDim2.fromScale(2, 1)
        };
        local v41 = {};
        local createElement3 = u2.createElement;
        local v42 = {
            Color = v35,
            Transparency = v36
        };
        local v43;

        if v34 then
            v43 = 0;
        elseif p3.face == Enum.NormalId.Left then
            v43 = -1 * v5;
        else
            v43 = v5 - 0.5;
        end;

        v42.Offset = Vector2.new(v43, 0);
        v41[1] = createElement3("UIGradient", v42);
        v39[1] = createElement2("Frame", v40, v41);

        return createElement("SurfaceGui", v38, v39);
    end)
};