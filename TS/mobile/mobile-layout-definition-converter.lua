local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Action
local v2 = {}
local u3 = nil
local u4 = nil
local function u71(p5) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v6 = nil
    for v7, v8 in p5 do
        local _ = v7 - 1
        if v8.buttonType == "SwordSwing" == true then
            v6 = v8
            break
        end
    end
    local v9 = nil
    for v10, v11 in p5 do
        local _ = v10 - 1
        if v11.buttonType == "Sprint" == true then
            v9 = v11
            break
        end
    end
    local v12 = nil
    for v13, v14 in p5 do
        local _ = v13 - 1
        if v14.buttonType == "Jump" == true then
            v12 = v14
            break
        end
    end
    local v15 = nil
    for v16, v17 in p5 do
        local _ = v16 - 1
        if v17.buttonType == "Ping" == true then
            v15 = v17
            break
        end
    end
    local v18 = nil
    for v19, v20 in p5 do
        local _ = v19 - 1
        if v20.buttonType == "MoveMountUp" == true then
            v18 = v20
            break
        end
    end
    local v21 = nil
    for v22, v23 in p5 do
        local _ = v22 - 1
        if v23.buttonType == "MoveMountDown" == true then
            v21 = v23
            break
        end
    end
    local v24 = nil
    for v25, v26 in p5 do
        local _ = v25 - 1
        if v26.buttonType == "DropItem" == true then
            v24 = v26
            break
        end
    end
    local v27 = nil
    for v28, v29 in p5 do
        local _ = v28 - 1
        if v29.buttonType == "KitPrimary" == true then
            v27 = v29
            break
        end
    end
    local v30 = nil
    for v31, v32 in p5 do
        local _ = v31 - 1
        if v32.buttonType == "KitSecondary" == true then
            v30 = v32
            break
        end
    end
    local v33 = nil
    for v34, v35 in p5 do
        local _ = v34 - 1
        if v35.buttonType == "KitTertiary" == true then
            v33 = v35
            break
        end
    end
    local v36 = nil
    for v37, v38 in p5 do
        local _ = v37 - 1
        if v38.buttonType == "ItemPrimary" == true then
            v36 = v38
            break
        end
    end
    local v39 = nil
    for v40, v41 in p5 do
        local _ = v40 - 1
        if v41.buttonType == "ItemSecondary" == true then
            v39 = v41
            break
        end
    end
    local v42 = nil
    for v43, v44 in p5 do
        local _ = v43 - 1
        if v44.buttonType == "MiscPrimary" == true then
            v42 = v44
            break
        end
    end
    local v45 = nil
    for v46, v47 in p5 do
        local _ = v46 - 1
        if v47.buttonType == "MiscSecondary" == true then
            v45 = v47
            break
        end
    end
    local v48 = nil
    for v49, v50 in p5 do
        local _ = v49 - 1
        if v50.buttonType == "Recall" == true then
            v48 = v50
            break
        end
    end
    local v51 = nil
    for v52, v53 in p5 do
        local _ = v52 - 1
        if v53.buttonType == "Consume" == true then
            v51 = v53
            break
        end
    end
    local v54 = u3(v51)
    local v55 = nil
    for v56, v57 in p5 do
        local _ = v56 - 1
        if v57.buttonType == "BlockBreak" == true then
            v55 = v57
            break
        end
    end
    local v58 = u3(v55)
    local v59 = nil
    for v60, v61 in p5 do
        local _ = v60 - 1
        if v61.buttonType == "AutoBridge" == true then
            v59 = v61
            break
        end
    end
    local v62 = u3(v59)
    local v63 = nil
    for v64, v65 in p5 do
        local _ = v64 - 1
        if v65.buttonType == "Interact" == true then
            v63 = v65
            break
        end
    end
    local v66 = u3(v63)
    local v67 = nil
    for v68, v69 in p5 do
        local _ = v68 - 1
        if v69.buttonType == "FireProjectile" == true then
            v67 = v69
            break
        end
    end
    local v70 = u3(v67)
    return {
        ["SwordSwing"] = u4(v6),
        ["Sprint"] = u4(v9),
        ["Jump"] = u4(v12),
        ["Ping"] = u4(v15),
        ["MoveMountUp"] = u4(v18),
        ["MoveMountDown"] = u4(v21),
        ["DropItem"] = u4(v24),
        ["KitPrimary"] = u4(v27),
        ["KitSecondary"] = u4(v30),
        ["KitTertiary"] = u4(v33),
        ["ItemPrimary"] = u4(v36),
        ["ItemSecondary"] = u4(v39),
        ["MiscPrimary"] = u4(v42),
        ["MiscSecondary"] = u4(v45),
        ["Recall"] = u4(v48),
        ["AutoBridge"] = v62,
        ["BlockBreak"] = v58,
        ["Consume"] = v54,
        ["FireProjectile"] = v70,
        ["Interact"] = v66
    }
end
v2.fromMobileButtonLayouts = u71
function v2.fromProfileLayoutData(u72) --[[ Line: 322 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u71
    --]]
    local v73 = u1.AllMobileActions
    local function v76(p74) --[[ Line: 324 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        local v75 = u72[p74]
        return v75 and {
            ["buttonType"] = p74,
            ["size"] = UDim2.new(v75.sizeScale, v75.sizeOffset, v75.sizeScale, v75.sizeOffset),
            ["position"] = UDim2.new(v75.positionXScale, v75.positionXOffset, v75.positionYScale, v75.positionYOffset)
        } or nil
    end
    local v77 = 0
    local v78 = {}
    for v79, v80 in v73 do
        local v81 = v76(v80, v79 - 1, v73)
        if v81 ~= nil then
            v77 = v77 + 1
            v78[v77] = v81
        end
    end
    return u71(v78)
end
function v2.toProfileData(u82) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local u83 = {}
    local v84 = u1.AllMobileActions
    local function v87(p85) --[[ Line: 355 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u83
        --]]
        local v86 = u82[p85]
        if v86 then
            u83[p85] = {
                ["sizeOffset"] = v86.size.X.Offset,
                ["sizeScale"] = v86.size.X.Scale,
                ["positionXOffset"] = v86.position.X.Offset,
                ["positionYOffset"] = v86.position.Y.Offset,
                ["positionXScale"] = v86.position.X.Scale,
                ["positionYScale"] = v86.position.Y.Scale
            }
        end
    end
    for v88, v89 in v84 do
        v87(v89, v88 - 1, v84)
    end
    return u83
end
u4 = function(p90) --[[ Name: toMobileLayoutProperty, Line 376 ]]
    return {
        ["size"] = p90.size,
        ["position"] = p90.position
    }
end
v2.toMobileLayoutProperty = u4
u3 = function(p91) --[[ Name: toOptionalMobileLayoutProperties, Line 383 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p91 then
        return u4(p91)
    else
        return nil
    end
end
return {
    ["MobileLayoutDefinitionConverter"] = v2
}