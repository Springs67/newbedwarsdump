-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;

return {
    CommonEffectsUtil = {
        attachRingAura = function(p1, p2) -- Line: 7
            -- upvalues: ReplicatedStorage (copy)
            local v3 = ReplicatedStorage.Assets.Effects.RingAura:Clone();
            local v4;

            if p2 == nil then
                v4 = p2;
            else
                v4 = p2.disablePulse;
            end;

            if v4 then
                v3.Center.PulseEmitter.Enabled = false;
            end;

            local v5;

            if p2 == nil then
                v5 = p2;
            else
                v5 = p2.size;
            end;

            if v5 ~= 0 and (v5 == v5 and v5) then
                v3.Size = Vector3.new(p2.size, 0.001, p2.size);
            end;

            local v6;

            if p2 == nil then
                v6 = p2;
            else
                v6 = p2.color;
            end;

            if v6 then
                v3.SurfaceGui.RingAura.ImageColor3 = p2.color;
                v3.Center.PulseEmitter.Color = ColorSequence.new(p2.color);
            end;

            local v7;

            if p2 == nil then
                v7 = p2;
            else
                v7 = p2.positionOverride;
            end;

            local v8;

            if v7 then
                v8 = CFrame.new(p2.positionOverride);
            else
                v8 = p1:GetPivot() - Vector3.new(0, p1.Size.Y, 0);
            end;

            v3:PivotTo(v8);
            v3.WeldConstraint.Part1 = p1;
            v3.Parent = p1;

            return v3;
        end
    }
};