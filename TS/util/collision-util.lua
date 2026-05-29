return {
    ["isPositionWithinBoundsOfPart"] = function(p1, p2) --[[ Name: isPositionWithinBoundsOfPart, Line 3 ]]
        local v3 = p2.CFrame:PointToObjectSpace(p1)
        local v4 = p2.Size / 2
        local v5
        if v3.X >= -v4.X and (v3.X <= v4.X and (v3.Y >= -v4.Y and (v3.Y <= v4.Y and v3.Z >= -v4.Z))) then
            v5 = v3.Z <= v4.Z
        else
            v5 = false
        end
        return v5
    end
}