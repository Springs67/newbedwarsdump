local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.TweenService
local u12 = v7.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = {
    ["tag"] = "invisible-landmine",
    ["enemyFadeTransparency"] = 1,
    ["friendlyFadeTransparency"] = 0.6,
    ["fadeDuration"] = 0.3,
    ["revealTransparency"] = 0,
    ["revealDuration"] = 0.25,
    ["beepVolume"] = 0.3,
    ["rollOffMaxDistance"] = 25,
    ["beepSound"] = u15.INVISIBLE_LANDMINE_BEEP_LOOP
}
local u18 = TweenInfo.new(u17.fadeDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local u19 = TweenInfo.new(u17.revealDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "InvisibleLandmineController"
    end,
    ["__index"] = u13
})
u20.__index = u20
function u20.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23, ...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    u13.constructor(p23, ...)
    p23.Name = "InvisibleLandmineController"
    p23.invisibleLandmineMap = {}
    p23.tweenMaid = u6.new()
end
function u20.KnitStart(u24) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u17
        [4] = u14
        [5] = u9
        [6] = u3
        [7] = u15
        [8] = u10
        [9] = u12
        [10] = u16
        [11] = u8
    --]]
    u13.KnitStart(u24)
    u4(u17.tag, function(p25) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if not u24:isClientPrediction(p25) then
            u24:tagLandmineWithTeam(p25)
            u24:hideLandmine(p25)
            u24:handleTouch(p25)
        end
    end)
    u14.Client:OnEvent("LandmineExplode", function(p26) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u15
            [4] = u10
            [5] = u12
            [6] = u16
        --]]
        local v27 = u9.LocalPlayer.Character
        if v27 then
            v27 = u9.LocalPlayer.Character == p26.targetEntityInstance
        end
        local v28 = u3
        local v29 = u15.INVISIBLE_LANDMINE_EXPLOSION
        local v30 = {
            ["rollOffMaxDistance"] = 250
        }
        local v31
        if v27 then
            v31 = nil
        else
            v31 = p26.position
        end
        v30.position = v31
        v28:playSound(v29, v30)
        local v32 = u10.Assets.Effects.LandmineExplosion:Clone()
        v32.Parent = u12
        v32.CFrame = CFrame.new(p26.position)
        u16:playEffects({ v32 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end)
    u8:GetInstanceRemovedSignal(u17.tag):Connect(function(p33) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if not u24:isClientPrediction(p33) then
            local v34 = u24.invisibleLandmineMap[p33]
            if v34 ~= nil then
                local v35 = v34.beepLoopMaid
                if v35 ~= nil then
                    v35:DoCleaning()
                end
            end
            u24.invisibleLandmineMap[p33] = nil
        end
    end)
end
function u20.hideLandmine(u36, u37) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
        [3] = u18
    --]]
    local v38 = u37:WaitForChild("Landmine")
    local v39 = u37:GetAttribute("LandmineActive")
    local v40 = u37:GetAttribute("LandmineDetonating")
    local u41 = u36:isFriendlyLandmine(u37)
    if v39 then
        u36.invisibleLandmineMap[u37] = {
            ["isActive"] = v39,
            ["isDetonating"] = v40
        }
        local v42
        if u41 then
            v42 = u17.friendlyFadeTransparency
        else
            v42 = u17.enemyFadeTransparency
        end
        v38.Transparency = v42
        if not (v40 or u41) then
            u36:setupSound(u37)
            return
        end
    else
        local v43 = u11
        local v44 = u18
        local v45 = {}
        local v46
        if u41 then
            v46 = u17.friendlyFadeTransparency
        else
            v46 = u17.enemyFadeTransparency
        end
        v45.Transparency = v46
        local v47 = v43:Create(v38, v44, v45)
        local u48 = nil
        u48 = v47.Completed:Connect(function() --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u37
                [3] = u41
                [4] = u48
            --]]
            u36.invisibleLandmineMap[u37] = {
                ["isActive"] = true,
                ["isDetonating"] = false
            }
            u37:SetAttribute("LandmineActive", true)
            if not u41 then
                u36:setupSound(u37)
            end
            u36.tweenMaid:GiveTask(u48)
            u36.tweenMaid:DoCleaning()
        end)
        v47:Play()
    end
end
function u20.revealLandmine(_, p49) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u19
        [3] = u17
    --]]
    u11:Create(p49:WaitForChild("Landmine"), u19, {
        ["Transparency"] = u17.revealTransparency
    }):Play()
end
function u20.handleTouch(u50, u51) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u51.Touched:Connect(function(p52) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u51
            [3] = u14
        --]]
        local v53 = u50.invisibleLandmineMap[u51]
        local v54 = u50:isLandmineOwner(u51, p52)
        local v55 = u50:playerOnLandmineOwnersTeam(u51, p52)
        local v56 = u50:isHumanoid(p52) and not v54
        if v56 then
            v56 = not v55
        end
        if v56 then
            if v53 == nil then
                v56 = v53
            else
                v56 = v53.isActive
            end
            if v56 then
                local v57
                if v53 == nil then
                    v57 = v53
                else
                    v57 = v53.isDetonating
                end
                v56 = not v57
            end
        end
        if v56 then
            local v58 = u50:isLocalPlayer(p52)
            if v53 ~= nil then
                local v59 = v53.beepLoopMaid
                if v59 ~= nil then
                    v59:DoCleaning()
                end
            end
            u50:revealLandmine(u51)
            v53.isDetonating = true
            if v58 then
                u51:SetAttribute("LandmineDetonating", true)
                local v60 = {
                    ["invisibleLandmine"] = u51
                }
                u14.Client:Get("TriggerInvisibleLandmine"):SendToServer(v60)
            end
        end
    end)
end
function u20.setupSound(p61, p62) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v63 = p61:startBeepLoop(p62)
    local v64 = u6.new()
    v64:GiveTask(v63)
    local v65 = p61.invisibleLandmineMap[p62]
    if v65 then
        v65.beepLoopMaid = v64
    end
end
function u20.startBeepLoop(_, p66) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u17
    --]]
    return u3:playSound(u17.beepSound, {
        ["looped"] = true,
        ["position"] = p66.Position,
        ["volumeMultiplier"] = u17.beepVolume,
        ["rollOffMaxDistance"] = u17.rollOffMaxDistance
    })
end
function u20.tagLandmineWithTeam(_, p67) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v68 = u9:GetPlayerByUserId((p67:GetAttribute("PlacedByUserId")))
    if v68 then
        local v69 = v68.Team
        if v69 ~= nil then
            v69 = v69.Name
        end
        p67:SetAttribute("LandmineTeam", v69)
    end
end
function u20.isLandmineOwner(_, p70, p71) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v72 = u9:GetPlayerFromCharacter(p71.Parent)
    local v73 = p70:GetAttribute("PlacedByUserId")
    if v72 ~= nil then
        v72 = v72.UserId
    end
    return v73 == v72
end
function u20.playerOnLandmineOwnersTeam(_, p74, p75) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v76 = u9:GetPlayerByUserId((p74:GetAttribute("PlacedByUserId")))
    local v77 = u9:GetPlayerFromCharacter(p75.Parent)
    if v76 ~= nil then
        v76 = v76.Team
        if v76 ~= nil then
            v76 = v76.Name
        end
    end
    if v77 ~= nil then
        v77 = v77.Team
        if v77 ~= nil then
            v77 = v77.Name
        end
    end
    return v76 == v77
end
function u20.isFriendlyLandmine(_, p78) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v79 = p78:GetAttribute("LandmineTeam")
    local v80 = u9.LocalPlayer.Team
    if v80 ~= nil then
        v80 = v80.Name
    end
    return v79 == v80
end
function u20.isLocalPlayer(_, p81) --[[ Line: 252 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v82 = u9.LocalPlayer.Character
    if v82 then
        v82 = p81.Parent == u9.LocalPlayer.Character
    end
    return v82
end
function u20.isHumanoid(_, p83) --[[ Line: 255 ]]
    local v84 = p83.Parent
    if v84 ~= nil then
        v84 = v84:FindFirstChild("Humanoid")
    end
    return v84 ~= nil
end
function u20.isClientPrediction(_, p85) --[[ Line: 262 ]]
    return p85:GetAttribute("ClientPlaced")
end
v5.CreateController(u20.new())
return nil