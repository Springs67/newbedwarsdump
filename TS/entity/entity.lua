local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitServer
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.RunService
local u9 = v5.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "Entity"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(u17, p18) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
    --]]
    u17.instance = p18
    if u8:IsServer() then
        local v19 = u17.instance:GetAttribute("CompletedSetup")
        if v19 == 0 or (v19 ~= v19 or (v19 == "" or not v19)) then
            u17:onServerSetup()
            task.defer(function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u17
                --]]
                u2.Services.EntitySpawnService:fireEntitySpawnEvent(u17)
            end)
            u17.instance:SetAttribute("CompletedSetup", true)
        end
        local v20 = u17.instance:FindFirstChild("Health")
        if v20 then
            v20:Destroy()
        end
    end
end
function u14.onServerSetup(u21) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u3
        [4] = u12
        [5] = u4
    --]]
    u21.instance:SetAttribute("MaxHealth", 100)
    u21.instance:SetAttribute("BaseMaxHealth", 100)
    u21.instance:SetAttribute("Health", 100)
    u21.instance:SetAttribute("LastDamageTakenTime", 0)
    u21.instance:SetAttribute("SpawnTime", u9:GetServerTimeNow())
    u21.instance:SetAttribute("CanHealthRegen", true)
    u6:AddTag(u21.instance, "DontBlockSwordRaycast")
    u21.instance:SetAttribute("lastHitTime", 0)
    for _, v22 in u3.values(u12) do
        u21.instance:SetAttribute("Shield_" .. v22, 0)
    end
    task.spawn(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        if u21.instance:GetAttribute("NoNametag") == true then
            return nil
        end
    end)
    task.spawn(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u4
        --]]
        local v23 = u21.instance:WaitForChild("Humanoid", 10)
        if v23 then
            u4("Animator", {
                ["Name"] = "Animator",
                ["Parent"] = v23
            })
        end
    end)
    u6:AddTag(u21.instance, "entity")
end
function u14.enableHealthRegen(p24) --[[ Line: 76 ]]
    p24.instance:SetAttribute("CanHealthRegen", true)
end
function u14.disableHealthRegen(p25) --[[ Line: 79 ]]
    p25.instance:SetAttribute("CanHealthRegen", false)
end
function u14.canHealthRegen(p26) --[[ Line: 82 ]]
    local v27 = p26.instance:GetAttribute("CanHealthRegen")
    return v27 == nil and true or v27
end
function u14.getSpawnTime(p28) --[[ Line: 89 ]]
    return p28.instance:GetAttribute("SpawnTime")
end
function u14.getShield(p29, p30) --[[ Line: 92 ]]
    local v31 = p29.instance:GetAttribute("Shield_" .. p30)
    return v31 == nil and 0 or v31
end
function u14.getAllShield(p32) --[[ Line: 99 ]]
    local v33 = p32:getInstance():GetAttribute("TotalShield")
    local v34 = v33 == nil and 0 or v33
    return math.max(v34, 0)
end
function u14.setShield(u35, u36, p37, p38, p39) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
    --]]
    if u35:isDead() then
        return nil
    end
    local v40 = math.max(0, p37)
    if u8:IsServer() then
        local v41 = u2.Services.DamageService:getServerShieldAmount(u35, v40, u36, p38)
        if v41 == nil then
            return nil
        end
        v40 = u35:getShield(u36) + v41
        local v42 = u35.instance:GetAttribute("TotalShield")
        local v43 = (v42 == nil and 0 or v42) + v41
        u35.instance:SetAttribute("TotalShield", v43)
    end
    u35.instance:SetAttribute("Shield_" .. u36, v40)
    if p39 ~= 0 and (p39 == p39 and p39) then
        if u35.shieldThread then
            task.cancel(u35.shieldThread)
        end
        u35.shieldThread = task.delay(p39, function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u36
            --]]
            local v44 = u35:getShield(u36)
            local v45 = u35.instance:GetAttribute("TotalShield")
            local v46 = v45 == nil and 0 or v45
            u35.instance:SetAttribute("TotalShield", v46 - v44)
            u35.instance:SetAttribute("Shield_" .. u36, 0)
        end)
    end
end
function u14.onShieldChanged(p47, p48) --[[ Line: 146 ]]
    return p47.instance:GetAttributeChangedSignal("Shield_" .. p48)
end
function u14.getShields(p49) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
    --]]
    local v50 = 0
    local v51 = {}
    for v52, v54 in u3.keys(p49.instance:GetAttributes()) do
        local _ = v52 - 1
        if not u10.includes(v54, "Shield_") then
            local v54 = nil
        end
        if v54 ~= nil then
            v50 = v50 + 1
            v51[v50] = v54
        end
    end
    return v51
end
function u14.waitForSetupCompleted(p55) --[[ Line: 171 ]]
    if p55.instance:GetAttribute("CompletedSetup") == true then
        return nil
    end
    p55.instance:GetAttributeChangedSignal("CompletedSetup"):Wait()
end
function u14.shouldShowNametag(p56) --[[ Line: 177 ]]
    local v57 = p56.instance:GetAttribute("NoNametag")
    if v57 == nil then
        v57 = false
    end
    return not v57
end
function u14.hideLobbyDisplayName(p58) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isGameServer() then
        return nil
    end
    local v59 = p58.instance:WaitForChild("Head"):WaitForChild("Nametag", 3)
    local v60
    if v59 == nil then
        v60 = v59
    else
        v60 = v59:WaitForChild("DisplayNameContainer", 3)
    end
    if v60 then
        v60.Visible = false
    end
    local v61
    if v60 == nil then
        v61 = v60
    else
        v61 = v60:WaitForChild("DisplayName", 3)
    end
    if v61 then
        v61.Visible = false
    end
    if v59 ~= nil then
        v59 = v59:FindFirstChild("TeamIndicator")
    end
    if v59 then
        v59.Visible = false
    end
    if v60 ~= nil then
        v60 = v60:FindFirstChildWhichIsA("UIStroke")
    end
    if v60 then
        v60.Enabled = false
    end
end
function u14.showLobbyDisplayName(p62) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isGameServer() then
        return nil
    end
    local v63 = p62.instance:WaitForChild("Head"):WaitForChild("Nametag", 3)
    local v64
    if v63 == nil then
        v64 = v63
    else
        v64 = v63:WaitForChild("DisplayNameContainer")
    end
    if v64 then
        v64.Visible = true
    end
    local v65
    if v64 == nil then
        v65 = v64
    else
        v65 = v64:WaitForChild("DisplayName")
    end
    if v65 then
        v65.Visible = true
    end
    if v63 ~= nil then
        v63 = v63:FindFirstChild("TeamIndicator")
    end
    if v63 then
        v63.Visible = true
    end
    if v64 ~= nil then
        v64 = v64:FindFirstChildWhichIsA("UIStroke")
    end
    if v64 then
        v64.Enabled = false
    end
end
function u14.setNametag(p66, p67, p68) --[[ Line: 261 ]]
    local v69 = p66.instance:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("DisplayNameContainer"):WaitForChild("DisplayName")
    v69.Text = p67
    v69.TextColor3 = p68 or Color3.fromRGB(255, 255, 255)
end
function u14.setNametagBorderColor(p70, p71) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isGameServer() then
        return nil
    end
    local v72 = p70.instance:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("DisplayNameContainer"):WaitForChild("Stroke")
    v72.Color = p71
    v72.Transparency = 0
end
function u14.disableLobbyNametagAlwaysOnTop(p73) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isGameServer() then
        return nil
    end
    p73.instance:WaitForChild("Head"):WaitForChild("Nametag").AlwaysOnTop = false
end
function u14.hideNametag(p74) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isLobbyServer() then
        p74.instance:WaitForChild("Head"):WaitForChild("Nametag", 3).Enabled = false
    end
    p74.instance:SetAttribute("NoNametag", true)
end
function u14.showNametag(p75) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13.isLobbyServer() then
        p75.instance:WaitForChild("Head"):WaitForChild("Nametag").Enabled = true
    end
    p75.instance:SetAttribute("NoNametag", false)
end
function u14.centerLobbyNameTag(p76) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
    --]]
    if u13.isGameServer() then
        return nil
    end
    local v77 = p76.instance:WaitForChild("Head"):WaitForChild("Nametag")
    u4("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 10)
    }).Parent = v77
end
function u14.isHumanEntity(p78) --[[ Line: 312 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p78.humanEntityMemo == nil then
        if u7:GetPlayerFromCharacter(p78.instance) then
            p78.humanEntityMemo = true
            return true
        else
            local v79 = p78.instance:GetAttribute("DummyPlayerEntity")
            if v79 == 0 or (v79 ~= v79 or (v79 == "" or not v79)) then
                p78.humanEntityMemo = false
                return false
            else
                p78.humanEntityMemo = true
                return true
            end
        end
    else
        return p78.humanEntityMemo
    end
end
function u14.getHealth(p80) --[[ Line: 328 ]]
    return p80.instance:GetAttribute("Health")
end
function u14.getHealthPercent(p81) --[[ Line: 331 ]]
    return p81:getHealth() / p81:getMaxHealth()
end
function u14.setHealth(p82, p83) --[[ Line: 334 ]]
    p82.instance:SetAttribute("Health", p83)
    local v84 = p82:getHumanoid()
    if v84 then
        v84.Health = p83
    end
end
function u14.getlastHitTime(p85) --[[ Line: 341 ]]
    return p85.instance:GetAttribute("lastHitTime")
end
function u14.setlastHitTime(p86, p87) --[[ Line: 344 ]]
    p86.instance:SetAttribute("lastHitTime", p87)
end
function u14.getBaseMaxHealth(p88) --[[ Line: 347 ]]
    return p88.instance:GetAttribute("BaseMaxHealth")
end
function u14.setBaseMaxHealth(p89, p90) --[[ Line: 350 ]]
    p89.instance:SetAttribute("BaseMaxHealth", p90)
    local v91 = p89:getHumanoid()
    if v91 then
        v91.MaxHealth = p90
    end
end
function u14.getMaxHealth(p92) --[[ Line: 357 ]]
    return p92.instance:GetAttribute("MaxHealth")
end
function u14.setMaxHealth(p93, p94) --[[ Line: 360 ]]
    p93.instance:SetAttribute("MaxHealth", p94)
    local v95 = p93:getHumanoid()
    if v95 then
        v95.MaxHealth = p94
    end
end
function u14.getLastDamageTakenTime(p96) --[[ Line: 367 ]]
    return p96.instance:GetAttribute("LastDamageTakenTime")
end
function u14.getLastDamageTakenTimeTrue(p97) --[[ Line: 370 ]]
    local v98 = p97.instance:GetAttribute("LastDamageTakenTimeTrue")
    return v98 == nil and 0 or v98
end
function u14.setLastDamageTakenTime(p99, p100) --[[ Line: 377 ]]
    p99.instance:SetAttribute("LastDamageTakenTime", p100)
end
function u14.setLastSwordHitTime(p101, p102) --[[ Line: 380 ]]
    p101.instance:SetAttribute("LastSwordHitTime", p102)
end
function u14.getLastSwordHitTime(p103) --[[ Line: 383 ]]
    local v104 = p103.instance:GetAttribute("LastSwordHitTime")
    return v104 == nil and 0 or v104
end
function u14.kill(p105) --[[ Line: 390 ]]
    local v106 = p105:getHumanoid()
    if v106 then
        v106.Health = 0
    end
end
function u14.getInstance(p107) --[[ Line: 396 ]]
    return p107.instance
end
function u14.isStreamedIn(p108) --[[ Line: 399 ]]
    return p108.instance.Parent ~= nil
end
function u14.getAnimator(p109) --[[ Line: 405 ]]
    local v110 = p109.instance:WaitForChild("Humanoid", 10)
    if v110 ~= nil then
        v110 = v110:WaitForChild("Animator")
    end
    return v110
end
function u14.playAnimation(p111, p112, p113) --[[ Line: 412 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v114 = p111:getAnimator()
    if not v114 then
        return nil
    end
    local v115 = v114:LoadAnimation(u11:getAnimation(p112))
    local v116
    if p113 == nil then
        v116 = p113
    else
        v116 = p113.looped
    end
    if v116 ~= nil then
        v115.Looped = p113.looped
    end
    v115:Play()
end
function u14.getHumanoid(p117) --[[ Line: 427 ]]
    return p117.instance:FindFirstChild("Humanoid")
end
function u14.isAlive(p118) --[[ Line: 430 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v119 = p118:getHumanoid()
    if u7:GetPlayerFromCharacter(p118.instance) and (v119 == nil or v119.Parent == nil) then
        return false
    elseif v119 and v119.Health <= 0 then
        return false
    elseif p118:getHealth() <= 0 then
        return false
    else
        return p118:getInstance():GetAttribute("Dead") ~= true
    end
end
function u14.isDead(p120) --[[ Line: 447 ]]
    return not p120:isAlive()
end
function u14.canAttack(p121, p122) --[[ Line: 450 ]]
    return p122:getInstance() ~= p121.instance
end
function u14.isLocalPlayer(p123) --[[ Line: 456 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v124 = u7.LocalPlayer
    if v124 ~= nil then
        v124 = v124.Character
    end
    return v124 == p123.instance
end
function u14.getPlayer(p125) --[[ Line: 463 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7:GetPlayerFromCharacter(p125.instance)
end
function u14.isPlayer(p126) --[[ Line: 466 ]]
    return p126:getPlayer() ~= nil
end
return {
    ["DEFAULT_ENTITY_MAX_HEALTH"] = 100,
    ["Entity"] = u14
}