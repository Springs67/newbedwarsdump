local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.MarketplaceService
local u7 = v4.Players
local u8 = v4.ReplicatedStorage
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-dev-products").getArmorTrimTierDevProduct
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-definition").getArmorTrimEffect
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRankMeta
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u20 = u1.import(script, script.Parent, "roblox-humanoid-attachments").humanoidAttachments
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "ArmorTrimController"
    end,
    ["__index"] = u10
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p24)
    p24.Name = "ArmorTrimController"
end
function u21.KnitStart(u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u18
        [3] = u11
        [4] = u19
        [5] = u3
        [6] = u17
        [7] = u9
    --]]
    u10.KnitStart(u25)
    u18.Client:Get("UpdatedArmorTrimConfig "):Connect(function(p26) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:dispatch({
            ["type"] = "SetArmorTrimData",
            ["allKitProgress"] = p26.progress,
            ["effectUnlocks"] = p26.effectUnlocks,
            ["allKitXpPotential"] = p26.xpPotential,
            ["selectedArmorTrimConfigs"] = p26.configs
        })
    end)
    if u19.isGameServer() then
        if u3.Controllers.MatchController:getMatchState() == u17.RUNNING then
            u25:hookArmorTrim()
            return
        end
        u9.MatchStateChange:connect(function(p27) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u25
            --]]
            if p27.matchState == u17.RUNNING then
                u25:hookArmorTrim()
            end
        end)
    end
end
function u21.equipArmorTrimConfig(_, p28, p29, p30, p31) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.Client:Get("SetSelectedArmorTrimConfig"):SendToServer({
        ["kit"] = p28,
        ["trim"] = p29,
        ["color"] = p30,
        ["effectType"] = p31
    })
end
function u21.promptPurchaseToTier(_, p32, p33, p34) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u12
        [3] = u6
        [4] = u7
    --]]
    u18.Client:Get("AttemptArmorTrimPurchaseTier"):SendToServer({
        ["armorTrimType"] = p32,
        ["kit"] = p33
    })
    local v35 = u12(p34)
    u6:PromptProductPurchase(u7.LocalPlayer, v35)
end
function u21.attachArmorTrim(p36, p37, p38) --[[ Line: 81 ]]
    local v39 = p37:GetAttribute("ArmorTrimEffectRank")
    local v40 = p37:GetAttribute("ArmorTrimType")
    local v41 = p37:GetAttribute("ArmorTrimColor")
    local v42 = p37:GetAttribute("ArmorTrimEffectType")
    if v39 == 0 or (v39 ~= v39 or not (v39 and v40)) then
        return nil
    end
    p36:attachArmorTrimEffects(p38, v40, v41, v39, v42)
end
function u21.attachArmorTrimEffects(_, u43, p44, p45, p46, p47) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u13
        [4] = u8
        [5] = u14
        [6] = u5
        [7] = u20
    --]]
    local v48 = u16[p46].tier
    local v49 = u15[p44].effects
    local v50
    if v49 == nil then
        v50 = v49
    else
        v50 = v49.definition
    end
    if p47 == nil then
        if v50 == nil then
            p47 = nil
        else
            p47 = u13(v50, p45)
        end
    end
    local v51 = nil
    local v52 = v49 and p47
    if v52 then
        local v53 = v49.tierOverrides
        v52 = table.find(v53, p46) ~= nil
    end
    if v52 then
        v51 = u8.Assets.ArmorTrimEffects:FindFirstChild(p47)
        if v51 ~= nil then
            v51 = v51:FindFirstChild(v48)
        end
    end
    if v51 == nil then
        v51 = u8.Assets.ArmorTrimEffects:FindFirstChild(u14.DEFAULT)
        if v51 ~= nil then
            v51 = v51:FindFirstChild(v48)
        end
    end
    if not v51 then
        return nil
    end
    local v54 = 0
    local v55 = {}
    for v56, v57 in u43:GetChildren() do
        local _ = v56 - 1
        if v57:IsA("BasePart") == true then
            v54 = v54 + 1
            v55[v54] = v57
        end
    end
    local u58 = table.create(#v55)
    for v59, v60 in v55 do
        local _ = v59 - 1
        u58[v59] = v60.Name
    end
    local v61 = v51:GetDescendants()
    local function v93(p62) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u43
            [3] = u5
            [4] = u20
        --]]
        local v63 = nil
        for v64, v65 in p62:GetChildren() do
            local _ = v64 - 1
            if v65:IsA("ParticleEmitter") == true then
                v63 = v65
                break
            end
        end
        if v63 == nil then
            local v66 = p62:IsA("ParticleEmitter") or p62:IsA("Beam")
            if v66 then
                v66 = p62.Parent
            end
            if v66 then
                local v67 = p62.Parent.Name
                v66 = table.find(u58, v67) ~= nil
            end
            if v66 then
                local v68 = p62:Clone()
                v68.Parent = u43:FindFirstChild(p62.Parent.Name)
                u5:AddTag(v68, "FirstPersonHidden")
                if v68:IsA("Beam") then
                    local v69 = v68.Attachment0
                    local v70 = v68.Attachment1
                    local v71
                    if v69 then
                        local v72
                        if v69 == nil then
                            v72 = v69
                        else
                            v72 = v69.Name
                        end
                        local v73 = u20[v72] ~= nil
                        v71 = not v73
                    else
                        v71 = v69
                    end
                    if v71 then
                        local v74 = v69:Clone()
                        v74.Parent = v68.Parent
                        v68.Attachment0 = v74
                    end
                    local v75
                    if v70 then
                        local v76
                        if v70 == nil then
                            v76 = v70
                        else
                            v76 = v70.Name
                        end
                        local v77 = u20[v76] ~= nil
                        v75 = not v77
                    else
                        v75 = v70
                    end
                    if v75 then
                        local v78 = v70:Clone()
                        v78.Parent = v68.Parent
                        v68.Attachment1 = v78
                    end
                end
            end
        else
            local v79 = p62
            while p62 do
                local v80 = p62.Name
                if table.find(u58, v80) ~= nil then
                    break
                end
                local v81 = p62.Parent
                v79 = p62
                p62 = v81
            end
            if p62 then
                local v82 = v79.Name
                if table.find(u58, v82) == nil then
                    if v79:IsA("Attachment") then
                        local v83 = v79:Clone()
                        v83.Parent = u43:FindFirstChild(p62.Name)
                        for v84, v85 in v83:GetDescendants() do
                            local _ = v84 - 1
                            if v85:IsA("ParticleEmitter") then
                                u5:AddTag(v85, "FirstPersonHidden")
                            end
                        end
                        return
                    end
                    if v79:IsA("BasePart") then
                        local v86 = u43:FindFirstChild(p62.Name)
                        if not v86 then
                            return nil
                        end
                        local v87 = v79:Clone()
                        local v88 = v79.Parent
                        if not v88 then
                            return nil
                        end
                        local v89 = v88.CFrame * v87.CFrame:Inverse()
                        v87.CFrame = v86.CFrame * v89:Inverse()
                        v87.CanCollide = false
                        v87.CanQuery = false
                        v87.CanTouch = false
                        v87.Transparency = 1
                        v87.Parent = v86
                        local v90 = v87:FindFirstChildWhichIsA("WeldConstraint")
                        if v90 then
                            v90.Part0 = v87
                            v90.Part1 = v86
                        end
                        for v91, v92 in v87:GetDescendants() do
                            local _ = v91 - 1
                            if v92:IsA("ParticleEmitter") then
                                u5:AddTag(v92, "FirstPersonHidden")
                            end
                        end
                        return
                    end
                end
            end
        end
    end
    for v94, v95 in v61 do
        v93(v95, v94 - 1, v61)
    end
end
function u21.hookArmorTrim(u96) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    u2(function(u97, u98, p99) --[[ Line: 279 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u96
        --]]
        if u98:FindFirstChild("Humanoid") then
            u96:attachArmorTrim(u97, u98)
        else
            local u100 = u1.Promise.new(function() --[[ Line: 284 ]]
                --[[
                Upvalues:
                    [1] = u98
                    [2] = u96
                    [3] = u97
                --]]
                u98:WaitForChild("Humanoid")
                u96:attachArmorTrim(u97, u98)
            end)
            p99:GiveTask(function() --[[ Line: 288 ]]
                --[[
                Upvalues:
                    [1] = u100
                --]]
                u100:cancel()
            end)
        end
    end)
end
u3.CreateController(u21.new())
return nil