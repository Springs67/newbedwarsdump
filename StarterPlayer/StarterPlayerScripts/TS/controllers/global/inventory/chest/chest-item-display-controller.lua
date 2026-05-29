local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v10 = {}
local u11 = setmetatable({}, {
    ["__index"] = v10
})
u11.NONE = "None"
v10.None = "NONE"
u11.SMALL = "Small"
v10.Small = "SMALL"
u11.MEDIUM = "Medium"
v10.Medium = "MEDIUM"
u11.LARGE = "Large"
v10.Large = "LARGE"
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "ChestItemDisplayController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "ChestItemDisplayController"
    p15.gameChestMap = {}
end
function u12.KnitStart(u16) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u9
        [4] = u7
        [5] = u6
    --]]
    u8.KnitStart(u16)
    u2("team-crate", function(p17) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u16
        --]]
        if p17.Name ~= u9.TEAM_CRATE then
            return nil
        end
        local v18 = p17:WaitForChild("ChestFolderValue", 1)
        if not v18 then
            return nil
        end
        local v19 = v18.Value
        if not v19 then
            return nil
        end
        u16:initChest(p17, v19)
    end)
    u2("chest", function(p20) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u6
            [4] = u16
        --]]
        if p20.Name ~= u9.PERSONAL_CHEST and p20.Name ~= u9.OG_PERSONAL_CHEST then
            return nil
        end
        local v21 = u7:WaitForChild("Inventories", 1)
        if v21 ~= nil then
            v21 = v21:WaitForChild(u6.LocalPlayer.Name .. "_personal", 1)
        end
        if not v21 then
            return nil
        end
        u16:initChest(p20, v21)
    end)
end
function u12.initChest(u22, u23, p24) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u22.gameChestMap[u23] = {}
    u22:updateChestDisplay(u23)
    p24.ChildAdded:Connect(function(u25) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u22
            [3] = u23
        --]]
        if u25:IsA("Accessory") then
            local u26 = u25.Name
            if u26 == u9.IRON or (u26 == u9.DIAMOND or u26 == u9.EMERALD) then
                local v27 = u25:GetAttribute("Amount")
                if v27 == 0 or (v27 ~= v27 or not v27) then
                    return nil
                end
                u22:setChestItems(u23, u26, v27)
                u25:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u22
                        [3] = u23
                        [4] = u26
                    --]]
                    local v28 = u25:GetAttribute("Amount")
                    if v28 == 0 or (v28 ~= v28 or not v28) then
                        return nil
                    end
                    u22:setChestItems(u23, u26, v28)
                end)
            end
        end
    end)
    p24.ChildRemoved:Connect(function(p29) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u22
            [3] = u23
        --]]
        if p29:IsA("Accessory") then
            local v30 = p29.Name
            if v30 == u9.IRON or (v30 == u9.DIAMOND or v30 == u9.EMERALD) then
                local v31 = u22.gameChestMap[u23]
                if not v31 then
                    return nil
                end
                v31[v30] = 0
                u22:updateChestDisplay(u23)
            end
        end
    end)
end
function u12.setChestItems(p32, p33, p34, p35) --[[ Line: 116 ]]
    local v36 = p32.gameChestMap[p33]
    if not v36 then
        return nil
    end
    v36[p34] = p35
    p32.gameChestMap[p33] = v36
    p32:updateChestDisplay(p33)
end
function u12.getChestItems(p37, p38) --[[ Line: 133 ]]
    return p37.gameChestMap[p38]
end
function u12.updateChestDisplay(p39, p40) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v41 = p39:getChestItems(p40)
    if not v41 then
        return nil
    end
    local v42 = v41[u9.IRON]
    local v43 = v42 == nil and 0 or v42
    local v44 = v41[u9.DIAMOND]
    local v45 = v44 == nil and 0 or v44
    local v46 = v41[u9.EMERALD]
    local v47 = v46 == nil and 0 or v46
    local v48 = p39:getIronGroup(v43)
    local v49 = p39:getDiamondGroup(v45)
    local v50 = p39:getEmeraldGroup(v47)
    local v51 = p40:WaitForChild("CrateDisplays", 1)
    if not v51 then
        return nil
    end
    local v52 = v51:FindFirstChild("Iron" .. v48)
    local v53 = v51:FindFirstChild("Diamond" .. v49)
    local v54 = v51:FindFirstChild("Emerald" .. v50)
    for v55, v56 in v51:GetDescendants() do
        local _ = v55 - 1
        if v56:IsA("BasePart") or v56:IsA("MeshPart") then
            v56.Transparency = 1
        elseif v56:IsA("ParticleEmitter") then
            v56.Enabled = false
        end
    end
    if v52 then
        for v57, v58 in v52:GetDescendants() do
            local _ = v57 - 1
            if v58:IsA("BasePart") or v58:IsA("MeshPart") then
                v58.Transparency = 0
            elseif v58:IsA("ParticleEmitter") then
                v58.Enabled = true
            end
        end
    end
    if v53 then
        for v59, v60 in v53:GetDescendants() do
            local _ = v59 - 1
            if v60:IsA("BasePart") or v60:IsA("MeshPart") then
                v60.Transparency = 0
            elseif v60:IsA("ParticleEmitter") then
                v60.Enabled = true
            end
        end
    end
    if v54 then
        for v61, v62 in v54:GetDescendants() do
            local _ = v61 - 1
            if v62:IsA("BasePart") or v62:IsA("MeshPart") then
                v62.Transparency = 0
            elseif v62:IsA("ParticleEmitter") then
                v62.Enabled = true
            end
        end
    end
end
function u12.getEmeraldGroup(_, p63) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p63 >= 20 then
        return u11.LARGE
    elseif p63 >= 5 then
        return u11.MEDIUM
    elseif p63 >= 1 then
        return u11.SMALL
    else
        return u11.NONE
    end
end
function u12.getDiamondGroup(_, p64) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p64 >= 20 then
        return u11.LARGE
    elseif p64 >= 5 then
        return u11.MEDIUM
    elseif p64 >= 1 then
        return u11.SMALL
    else
        return u11.NONE
    end
end
function u12.getIronGroup(_, p65) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p65 >= 200 then
        return u11.LARGE
    elseif p65 >= 30 then
        return u11.MEDIUM
    elseif p65 >= 1 then
        return u11.SMALL
    else
        return u11.NONE
    end
end
function u12.getTeamCrate(p66) --[[ Line: 255 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    local v67 = u6.LocalPlayer:GetAttribute("Team")
    if v67 == 0 or (v67 ~= v67 or not v67) then
        return nil
    end
    local v68 = nil
    for v69, v70 in u4.keys(p66.gameChestMap) do
        local _ = v69 - 1
        if v70:GetAttribute("Team") == v67 == true then
            return v70
        end
    end
    return v68
end
v3.CreateController(u12.new())
return nil