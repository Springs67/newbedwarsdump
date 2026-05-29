local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
return {
    ["CommonEffectsUtil"] = {
        ["attachRingAura"] = function(p2, p3) --[[ Line: 7 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v4 = u1.Assets.Effects.RingAura:Clone()
            local v5
            if p3 == nil then
                v5 = p3
            else
                v5 = p3.disablePulse
            end
            if v5 then
                v4.Center.PulseEmitter.Enabled = false
            end
            local v6
            if p3 == nil then
                v6 = p3
            else
                v6 = p3.size
            end
            if v6 ~= 0 and (v6 == v6 and v6) then
                local v7 = p3.size
                local v8 = p3.size
                v4.Size = Vector3.new(v7, 0.001, v8)
            end
            local v9
            if p3 == nil then
                v9 = p3
            else
                v9 = p3.color
            end
            if v9 then
                v4.SurfaceGui.RingAura.ImageColor3 = p3.color
                v4.Center.PulseEmitter.Color = ColorSequence.new(p3.color)
            end
            local v10
            if p3 == nil then
                v10 = p3
            else
                v10 = p3.positionOverride
            end
            local v11
            if v10 then
                v11 = CFrame.new(p3.positionOverride)
            else
                local v12 = p2:GetPivot()
                local v13 = p2.Size.Y
                v11 = v12 - Vector3.new(0, v13, 0)
            end
            v4:PivotTo(v11)
            v4.WeldConstraint.Part1 = p2
            v4.Parent = p2
            return v4
        end
    }
}