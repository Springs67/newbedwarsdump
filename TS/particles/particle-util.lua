return {
    ["ParticleUtil"] = {
        ["setSpeedButKeepDistance"] = function(p1, p2, p3) --[[ Name: setSpeedButKeepDistance, Line 6 ]]
            local v4 = p1.Speed.Min * p1.Lifetime.Min
            local v5 = p1.Speed.Max * p1.Lifetime.Max
            p1.Speed = NumberRange.new(p2, p3)
            p1.Lifetime = NumberRange.new(v4 / p2, v5 / p3)
        end,
        ["setSpeedAndDistance"] = function(p6, p7, p8, p9) --[[ Name: setSpeedAndDistance, Line 16 ]]
            p6.Speed = NumberRange.new(math.min(p7, p8), (math.max(p7, p8)))
            p6.Lifetime = NumberRange.new(p9 / p7)
        end
    }
}