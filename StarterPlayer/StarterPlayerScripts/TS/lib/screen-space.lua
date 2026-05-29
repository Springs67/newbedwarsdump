local u1 = Game:GetService("Workspace").CurrentCamera
local u124 = {
    ["ViewSizeX"] = function() --[[ Name: ViewSizeX, Line 7 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v2 = u1.ViewportSize.X
        local _ = u1.ViewportSize.Y
        return v2
    end,
    ["ViewSizeY"] = function() --[[ Name: ViewSizeY, Line 23 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local _ = u1.ViewportSize.X
        return u1.ViewportSize.Y
    end,
    ["AspectRatio"] = function() --[[ Name: AspectRatio, Line 41 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        return u124.ViewSizeX() / u124.ViewSizeY()
    end,
    ["WorldToScreen"] = function(p3) --[[ Name: WorldToScreen, Line 47 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v4 = Workspace.CurrentCamera.CoordinateFrame:pointToObjectSpace(p3)
        local v5 = u124.AspectRatio()
        local v6 = Workspace.CurrentCamera.FieldOfView
        local v7 = math.rad(v6) / 2
        local v8 = math.tan(v7)
        local v9 = v5 * v8
        local v10 = v4.x / v4.z / -v9
        local v11 = v4.y / v4.z / v8
        return Vector2.new(u124.ViewSizeX() * (0.5 + 0.5 * v10), u124.ViewSizeY() * (0.5 + 0.5 * v11))
    end,
    ["ScreenToWorld"] = function(p12, p13, p14) --[[ Name: ScreenToWorld, Line 61 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v15 = u124.AspectRatio()
        local v16 = Workspace.CurrentCamera.FieldOfView
        local v17 = math.rad(v16) / 2
        local v18 = math.tan(v17)
        local v19 = v15 * v18
        local v20 = p12 / u124.ViewSizeX() * 2 - 1
        local v21 = p13 / u124.ViewSizeY() * 2 - 1
        local v22 = v20 * -v19 * p14
        local v23 = v21 * v18 * p14
        return Vector3.new(v22, v23, p14)
    end,
    ["ScreenWidthToWorldWidth"] = function(p24, p25, p26) --[[ Name: ScreenWidthToWorldWidth, Line 74 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v27 = u124.AspectRatio()
        local v28 = p26 or Workspace.CurrentCamera.FieldOfView
        local v29 = math.rad(v28) / 2
        local v30 = v27 * math.tan(v29)
        return -(p24 / u124.ViewSizeX()) * 2 * v30 * p25
    end,
    ["ScreenHeightToWorldHeight"] = function(p31, p32, p33) --[[ Name: ScreenHeightToWorldHeight, Line 82 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v34 = p33 or Workspace.CurrentCamera.FieldOfView
        local v35 = math.rad(v34) / 2
        local v36 = math.tan(v35)
        return -(p31 / u124.ViewSizeY()) * 2 * v36 * p32
    end,
    ["WorldWidthToScreenWidth"] = function(p37, p38) --[[ Name: WorldWidthToScreenWidth, Line 91 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v39 = u124.AspectRatio()
        local v40 = Workspace.CurrentCamera.FieldOfView
        local v41 = math.rad(v40) / 2
        local v42 = v39 * math.tan(v41)
        return -(p37 * u124.ViewSizeX()) / (2 * v42 * p38)
    end,
    ["WorldHeightToScreenHeight"] = function(p43, p44) --[[ Name: WorldHeightToScreenHeight, Line 99 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v45 = Workspace.CurrentCamera.FieldOfView
        local v46 = math.rad(v45) / 2
        local v47 = math.tan(v46)
        return -(p43 * u124.ViewSizeY()) / (v47 * 2 * p44)
    end,
    ["GetDepthForWidth"] = function(p48, p49) --[[ Name: GetDepthForWidth, Line 107 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v50 = u124.AspectRatio()
        local v51 = Workspace.CurrentCamera.FieldOfView
        local v52 = math.rad(v51) / 2
        local v53 = v50 * math.tan(v52)
        local v54 = u124.ViewSizeX()
        u124.ViewSizeY()
        return -(v54 * p49) / (p48 * 2 * v53)
    end,
    ["GetDepthForHeight"] = function(p55, p56) --[[ Name: GetDepthForHeight, Line 115 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v57 = Workspace.CurrentCamera.FieldOfView
        local v58 = math.rad(v57) / 2
        local v59 = math.tan(v58)
        return -(u124.ViewSizeY() * p56) / (p55 * 2 * v59)
    end,
    ["ScreenToWorldByHeightDepth"] = function(p60, p61, p62, p63) --[[ Name: ScreenToWorldByHeightDepth, Line 125 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v64 = u124.AspectRatio()
        local v65 = Workspace.CurrentCamera.FieldOfView
        local v66 = math.rad(v65) / 2
        local v67 = math.tan(v66)
        local v68 = v64 * v67
        local v69 = u124.ViewSizeX()
        local v70 = u124.ViewSizeY()
        local v71 = -(p62 / v70) * 2 * v67 * p63
        local v72 = p60 / v69 * 2 - 1
        local v73 = p61 / v70 * 2 - 1
        local v74 = v72 * -v68 * p63
        local v75 = v73 * v67 * p63
        return Vector3.new(v74, v75, p63), v71
    end,
    ["ScreenToWorldByWidthDepth"] = function(p76, p77, p78, p79) --[[ Name: ScreenToWorldByWidthDepth, Line 143 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v80 = u124.AspectRatio()
        local v81 = Workspace.CurrentCamera.FieldOfView
        local v82 = math.rad(v81) / 2
        local v83 = math.tan(v82)
        local v84 = v80 * v83
        local v85 = u124.ViewSizeX()
        local v86 = u124.ViewSizeY()
        local v87 = p78 / v85 * 2 * -v84 * p79
        local v88 = p76 / v85 * 2 - 1
        local v89 = p77 / v86 * 2 - 1
        local v90 = v88 * -v84 * p79
        local v91 = v89 * v83 * p79
        return Vector3.new(v90, v91, p79), v87
    end,
    ["ScreenToWorldByHeight"] = function(p92, p93, p94, p95) --[[ Name: ScreenToWorldByHeight, Line 161 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v96 = u124.AspectRatio()
        local v97 = Workspace.CurrentCamera.FieldOfView
        local v98 = math.rad(v97) / 2
        local v99 = math.tan(v98)
        local v100 = v96 * v99
        local v101 = u124.ViewSizeX()
        local v102 = u124.ViewSizeY()
        local v103 = -(v102 * p95) / (p94 * 2 * v99)
        local v104 = p92 / v101 * 2 - 1
        local v105 = p93 / v102 * 2 - 1
        local v106 = v104 * -v100 * v103
        local v107 = v105 * v99 * v103
        return Vector3.new(v106, v107, v103)
    end,
    ["ScreenToWorldByWidth"] = function(p108, p109, p110, p111) --[[ Name: ScreenToWorldByWidth, Line 179 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v112 = u124.AspectRatio()
        local v113 = Workspace.CurrentCamera.FieldOfView
        local v114 = math.rad(v113) / 2
        local v115 = math.tan(v114)
        local v116 = v112 * v115
        local v117 = u124.ViewSizeX()
        local v118 = u124.ViewSizeY()
        local v119 = -(v117 * p111) / (p110 * 2 * v116)
        local v120 = p108 / v117 * 2 - 1
        local v121 = p109 / v118 * 2 - 1
        local v122 = v120 * -v116 * v119
        local v123 = v121 * v115 * v119
        return Vector3.new(v122, v123, v119)
    end
}
return u124