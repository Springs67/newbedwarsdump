local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "OwlUtil"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(_) --[[ Line: 18 ]] end
function u5.setOwlTarget(p8, p9, p10) --[[ Line: 20 ]]
    p8.userTargetMap[p9.UserId] = p10
end
function u5.getOwlTarget(p11, p12) --[[ Line: 26 ]]
    return p11.userTargetMap[p12.UserId]
end
function u5.setOwlClientModel(p13, p14, p15) --[[ Line: 31 ]]
    p13.userOwlMap[p14.UserId] = p15
end
function u5.getOwlClientModelByUser(p16, p17) --[[ Line: 37 ]]
    return p16.userOwlMap[p17.UserId]
end
function u5.deattachOwl(p18, p19) --[[ Line: 42 ]]
    p18.userOwlMap[p19.UserId] = nil
    p18.userTargetMap[p19.UserId] = nil
end
function u5.linkOwls(p20, p21, p22) --[[ Line: 50 ]]
    p20.owlMap[p21] = p22
end
function u5.unlinkOwls(p23, p24) --[[ Line: 56 ]]
    p23.owlMap[p24] = nil
end
function u5.getClientOwlFromServerOwl(p25, p26) --[[ Line: 61 ]]
    return p25.owlMap[p26]
end
function u5.getOwlHootSound(p27, p28) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if p28.Character then
        local v29 = u3[u2.Controllers.KitSkinController:getKitSkin(p28.Character)]
        local v30 = v29.owl
        if v30 ~= nil then
            v30 = v30.owlHootSound
        end
        if v30 then
            return v29.owl.owlHootSound
        else
            return p27.owlHootSound
        end
    else
        return p27.owlHootSound
    end
end
function u5.getOwlCuteSound(p31, p32) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if p32.Character then
        local v33 = u3[u2.Controllers.KitSkinController:getKitSkin(p32.Character)]
        local v34 = v33.owl
        if v34 ~= nil then
            v34 = v34.owlHootSound
        end
        if v34 then
            return v33.owl.owlHootSound
        else
            return p31.owlHootSound
        end
    else
        return p31.owlCuteSound
    end
end
function u5.getOwlShootSound(p35, p36) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if p36.Character then
        local v37 = u3[u2.Controllers.KitSkinController:getKitSkin(p36.Character)]
        local v38 = v37.owl
        if v38 ~= nil then
            v38 = v38.owlShootSound
        end
        if v38 then
            return v37.owl.owlShootSound
        else
            return p35.owlShootingSound
        end
    else
        return p35.owlShootingSound
    end
end
u5.userOwlMap = {}
u5.userTargetMap = {}
u5.owlMap = {}
u5.owlHootSound = {
    v4.OWL_HOOT_1,
    v4.OWL_HOOT_2,
    v4.OWL_HOOT_3,
    v4.OWL_HOOT_4
}
u5.owlShootingSound = { v4.OWL_SHOOT_1, v4.OWL_SHOOT_2, v4.OWL_SHOOT_3 }
u5.owlCuteSound = { v4.OWL_CUTE_1, v4.OWL_CUTE_2 }
return {
    ["OwlUtil"] = u5
}