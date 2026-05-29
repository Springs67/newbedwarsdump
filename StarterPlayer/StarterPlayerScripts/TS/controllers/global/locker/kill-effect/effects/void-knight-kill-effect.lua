local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InExpo
local u9 = v7.Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.TweenService
local u14 = v12.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "VoidKnightKillEffect"
    end,
    ["__index"] = u21
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25, p26) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.constructor(p25, p26)
    u21.setPlayDefaultKillEffect(p25, false)
end
function u22.onKill(p27, _, p28, p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u21
        [4] = u3
        [5] = u16
        [6] = u18
        [7] = u19
        [8] = u6
        [9] = u17
        [10] = u4
        [11] = u5
        [12] = u20
        [13] = u15
        [14] = u8
        [15] = u13
        [16] = u11
        [17] = u9
    --]]
    local u30 = u10.new()
    p28.Archivable = true
    local u31 = p28:Clone()
    u31:PivotTo(p29)
    u31.Parent = u14
    u31.HumanoidRootPart.Anchored = false
    u21.hideCharacter(p27, p28)
    u30:GiveTask(u31)
    u31:BreakJoints()
    for _, v32 in u31:GetDescendants() do
        if v32:IsA("BasePart") then
            u3:setQueryIgnored(v32, false)
        end
    end
    local u33 = u16:getEntity(p27.killerPlayer)
    local v34
    if u33 == nil then
        v34 = u33
    else
        v34 = u33:getHandItemInstanceFromCharacter()
    end
    local v35
    if u33 == nil then
        v35 = u33
    else
        v35 = u33:getItemsFromArmorSlot(u18.HELMET)
    end
    local v36 = v35 == nil and {} or v35
    local v37
    if u33 == nil then
        v37 = u33
    else
        v37 = u33:getItemsFromArmorSlot(u18.CHESTPLATE)
    end
    local v38 = v37 == nil and {} or v37
    local v39
    if u33 == nil then
        v39 = u33
    else
        v39 = u33:getItemsFromArmorSlot(u18.BOOTS)
    end
    local v40 = v39 == nil and {} or v39
    local v41
    if v34 then
        v41 = u19(v34.Name).sword ~= nil
    else
        v41 = v34
    end
    local v42 = nil
    local v43 = {}
    local v44 = #v43
    local v45 = #v36
    table.move(v36, 1, v45, v44 + 1, v43)
    local v46 = v44 + v45
    local v47 = #v38
    table.move(v38, 1, v47, v46 + 1, v43)
    local v48 = v46 + v47
    table.move(v40, 1, #v40, v48 + 1, v43)
    if v41 then
        table.insert(v43, v34)
    end
    if u6.Controllers.KitController:isUsingKit(p27.killerPlayer, u17.VOID_KNIGHT) then
        local v49 = p27.killerPlayer:GetAttribute("VoidKnightTier")
        local v50 = v49 == nil and 0 or v49
        local v51 = p27.killerPlayer.Character
        if v51 ~= nil then
            v51 = v51:WaitForChild("3DClothing", 1)
        end
        if v51 then
            local v52 = v50 + 1
            local v53 = v51:FindFirstChild("Tier" .. tostring(v52) .. "Clothing")
            if v51 then
                local v54 = {}
                if v53 ~= nil then
                    for v55, v56 in v53:GetChildren() do
                        local _ = v55 - 1
                        if v56:IsA("MeshPart") then
                            table.insert(v54, v56)
                        end
                    end
                end
                v42 = u4.fromList(unpack(v54))
            end
        end
    end
    if v42 or #v43 ~= 0 then
        local v57 = v42 or u4.fromList(unpack(v43)):WaitForChild("Handle", 3)
        if v57 then
            u33 = v57
        elseif u33 ~= nil then
            u33 = u33:getInstance().PrimaryPart
        end
    elseif u33 ~= nil then
        u33 = u33:getInstance().PrimaryPart
    end
    if not u33 then
        return u30
    end
    u5:playSound(u20.VOID_KNIGHT_KILL_EFFECT, {
        ["volumeMultiplier"] = 2,
        ["position"] = p29.Position
    })
    for v58, u59 in u31:GetChildren() do
        local _ = v58 - 1
        if u59:IsA("MeshPart") then
            local u60 = u59.Color
            u15(1, u8, function(p61) --[[ Line: 168 ]]
                --[[
                Upvalues:
                    [1] = u59
                    [2] = u60
                --]]
                u59.Color = u60:Lerp(Color3.fromRGB(94, 0, 107), p61)
                u59.Transparency = p61 / 2
            end)
        end
    end
    task.delay(1, function() --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u33
            [3] = u14
            [4] = u13
        --]]
        local v62 = u31:WaitForChild("Head"):WaitForChild("Nametag")
        if v62 ~= nil then
            v62:Destroy()
        end
        u31:BreakJoints()
        local v63 = u31:GetChildren()
        local function v72(u64) --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u14
                [3] = u13
            --]]
            if u64:IsA("MeshPart") then
                local u65 = u64.Size
                local u66 = nil
                u64.Anchored = true
                task.spawn(function() --[[ Line: 190 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u14
                        [3] = u66
                        [4] = u13
                        [5] = u64
                        [6] = u65
                    --]]
                    local v67 = false
                    local v68 = 0
                    while true do
                        if v67 then
                            v68 = v68 + 1
                        else
                            v67 = true
                        end
                        if v68 >= 3 or not (u33 and u33:IsDescendantOf(u14)) then
                            return
                        end
                        local v69 = u66
                        if v69 ~= nil then
                            v69:Destroy()
                        end
                        u66 = u13:Create(u64, TweenInfo.new(0.75), {
                            ["Size"] = u65 * 0.5,
                            ["CFrame"] = u33.CFrame
                        })
                        u66:Play()
                        task.wait(0.3)
                    end
                end)
                task.delay(0.9, function() --[[ Line: 219 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u14
                        [3] = u64
                        [4] = u66
                        [5] = u13
                    --]]
                    local v70 = u33
                    if v70 then
                        v70 = u33:IsDescendantOf(u14)
                    end
                    if v70 then
                        v70 = (u33.Position - u64.Position).Magnitude > 3
                    end
                    if v70 then
                        local v71 = u66
                        if v71 ~= nil then
                            v71:Destroy()
                        end
                        u13:Create(u64, TweenInfo.new(0.3), {
                            ["CFrame"] = u33.CFrame
                        }):Play()
                    end
                end)
            end
        end
        for v73, v74 in v63 do
            v72(v74, v73 - 1, v63)
        end
    end)
    task.delay(2, function() --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u33
            [3] = u14
            [4] = u30
            [5] = u5
            [6] = u20
            [7] = u11
            [8] = u15
            [9] = u9
        --]]
        u31:Destroy()
        local u75 = {}
        if not (u33 and u33:IsDescendantOf(u14)) then
            return u30
        end
        u5:playSound(u20.VOID_KNIGHT_CONSUME, {
            ["position"] = u33.Position
        })
        local v76 = u11("Highlight", {
            ["Name"] = "handleHighlight",
            ["FillTransparency"] = 1,
            ["OutlineTransparency"] = 1,
            ["Parent"] = u33,
            ["FillColor"] = Color3.fromRGB(173, 33, 255),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })
        table.insert(u75, v76)
        u30:GiveTask(v76)
        local v77 = u33:GetChildren()
        local function v81(p78) --[[ Line: 262 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u75
                [3] = u30
            --]]
            if p78:IsA("MeshPart") then
                local v79 = u11("Highlight", {
                    ["Name"] = "highlight",
                    ["FillTransparency"] = 1,
                    ["OutlineTransparency"] = 1,
                    ["Parent"] = p78,
                    ["FillColor"] = Color3.fromRGB(173, 33, 255),
                    ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
                })
                local v80 = u75
                table.insert(v80, v79)
                u30:GiveTask(v79)
            end
        end
        for v82, v83 in v77 do
            v81(v83, v82 - 1, v77)
        end
        u15(1, u9, function(p84) --[[ Line: 279 ]]
            --[[
            Upvalues:
                [1] = u75
            --]]
            for v85, v86 in u75 do
                local _ = v85 - 1
                v86.FillTransparency = math.abs(p84) + 0.5
            end
        end, 0.5, -0.5)
    end)
    return u30
end
return u22