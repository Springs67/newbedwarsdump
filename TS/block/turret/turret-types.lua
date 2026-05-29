return {
    ["isTurretBlock"] = function(p1) --[[ Name: isTurretBlock, Line 2 ]]
        return table.find(p1:GetTags(), "Turret") ~= nil
    end,
    ["isLitTurretBlock"] = function(_) --[[ Name: isLitTurretBlock, Line 5 ]]
        return true
    end
}