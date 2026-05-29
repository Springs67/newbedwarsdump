local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "collection-util").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "player-util").WatchCharacter
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out", "sync-event-priority").SyncEventPriority
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "april-fools", "april-fools-2026").AprilFools2026
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "AprilFools2026Controller"
    end,
    ["__index"] = u15
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p26)
    p26.Name = "AprilFools2026Controller"
    p26.bedSkinMap = {}
    p26.matchStarted = false
end
function u23.KnitStart(u27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u20
        [4] = u22
        [5] = u3
        [6] = u14
        [7] = u7
        [8] = u18
        [9] = u6
        [10] = u2
        [11] = u12
        [12] = u13
        [13] = u21
    --]]
    u15.KnitStart(u27)
    if not u16.ENABLED then
        return nil
    end
    u20.Client:Get("SendPlayerBedSkin"):Connect(function(u28) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u22
        --]]
        u27.bedSkinMap[u28.player] = {
            ["bedSkin"] = u28.bedSkin,
            ["color"] = u28.color
        }
        local v29 = u28.player:GetAttribute("IsBed")
        if v29 == 0 or v29 ~= v29 then
            v29 = false
        elseif v29 == "" then
            v29 = false
        end
        local u30 = (not v29 or u28.player:GetAttribute("IsBedSkin") ~= u28.bedSkin) and (u22.isLobbyServer() or u27.matchStarted) and u28.player.Character
        if u30 then
            task.spawn(function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u27
                    [3] = u30
                --]]
                if not u28.player:HasAppearanceLoaded() then
                    u28.player.CharacterAppearanceLoaded:Wait()
                end
                u27:turnPlayerIntoBed(u28.player, u30)
            end)
        end
    end)
    if u22.isLobbyServer() then
        u3(function(u31, u32) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            task.spawn(function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u27
                    [3] = u32
                --]]
                if not u31:HasAppearanceLoaded() then
                    u31.CharacterAppearanceLoaded:Wait()
                end
                u27:turnPlayerIntoBed(u31, u32)
            end)
        end)
    end
    u14.MatchStateChange:setPriority(u7.MONITOR):connect(function(p33) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u27
            [4] = u3
            [5] = u2
            [6] = u20
            [7] = u12
            [8] = u13
            [9] = u21
        --]]
        if p33.matchState ~= u18.RUNNING then
            return nil
        end
        local v34 = u6.Controllers.MatchController:getQueueMeta()
        if not v34 then
            return nil
        end
        if v34.rankCategory then
            return nil
        end
        u27.matchStarted = true
        u3(function(u35, u36) --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            task.spawn(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u27
                    [3] = u36
                --]]
                if not u35:HasAppearanceLoaded() then
                    u35.CharacterAppearanceLoaded:Wait()
                end
                u27:turnPlayerIntoBed(u35, u36)
            end)
        end)
        for v37, v38 in u6.Controllers.TeamController:getTeams() do
            local _ = v37 - 1
            local v39 = v38.id
            u27:turnShopkeeperIntoBed("item_shop", v39)
            u27:turnShopkeeperIntoBed("upgrade_shop", v39)
        end
        u2("armor", function(p40) --[[ Line: 119 ]]
            if p40:GetAttribute("ArmorSlot") ~= 0 then
                p40:Destroy()
            end
        end)
        u20.Client:Get("PillowHitEffect"):Connect(function(p41) --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u13
            --]]
            local u42 = u12.Assets.Effects.SmallWhiteFeatherEffect:Clone()
            u42.Parent = u13
            u42:PivotTo(p41.position)
            if u42 ~= nil then
                for v43, v44 in u42:GetChildren() do
                    local _ = v43 - 1
                    if v44:IsA("ParticleEmitter") then
                        v44.LightEmission = 1
                        v44:Emit(10)
                    end
                end
            end
            task.delay(4, function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Destroy()
            end)
        end)
        u2("GameEntity_" .. u21.GOLEM_BOSS, function(p45) --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            local v46 = p45:FindFirstChild("Body")
            if not v46 then
                return nil
            end
            local v47 = p45:GetChildren()
            local function v49(p48) --[[ Line: 154 ]]
                if p48:IsA("MeshPart") then
                    if p48.Name == "WingNeon" then
                        p48.Material = Enum.Material.Neon
                        p48.Color = Color3.fromRGB(171, 124, 53)
                        return
                    end
                    p48:SetAttribute("TransparencyOverride", 1)
                    p48.Transparency = 1
                end
            end
            for v50, v51 in v47 do
                v49(v51, v50 - 1, v47)
            end
            u27:createBedModel("0", p45, v46, {
                ["scale"] = 3,
                ["bedTransparency"] = 0.5,
                ["bedMaterial"] = Enum.Material.Neon,
                ["bedColor"] = Color3.fromRGB(171, 124, 53)
            })
        end)
        u2("GameEntity_" .. u21.DIAMOND_GUARDIAN, function(p52) --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            local v53 = p52:FindFirstChild("RootPart")
            if not v53 then
                return nil
            end
            for v54, v55 in p52:GetChildren() do
                local _ = v54 - 1
                if v55:IsA("MeshPart") then
                    v55:SetAttribute("TransparencyOverride", 1)
                    v55.Transparency = 1
                end
            end
            u27:createBedModel("0", p52, v53, {
                ["bedMaterial"] = Enum.Material.Neon,
                ["bedColor"] = Color3.fromRGB(0, 157, 157),
                ["blanketColor"] = Color3.fromRGB(255, 131, 8)
            })
        end)
    end)
end
function u23.turnPlayerIntoBed(p56, p57, p58) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v59 = u19.getGamePlayer(p57):getTeamId()
    local v60 = v59 == nil and "0" or v59
    local v61 = p58:WaitForChild("Head")
    if not v61 then
        return nil
    end
    local v62 = p56.bedSkinMap[p57]
    if v62 ~= nil then
        v62 = v62.bedSkin
    end
    local v63 = p56.bedSkinMap[p57]
    if v63 ~= nil then
        v63 = v63.color
    end
    p56:createBedModel(v60, p58, v61, {
        ["bedSkin"] = v62,
        ["color"] = v63
    })
    local v64 = p58:GetChildren()
    local function v74(p65) --[[ Line: 230 ]]
        if p65.Name == "3DClothing" then
            local v66 = p65:GetChildren()
            local function v70(p67) --[[ Line: 233 ]]
                if p67.Name ~= "Welding" then
                    p67:Destroy()
                end
                if p67.Name == "Head" then
                    for v68, v69 in p67:GetDescendants() do
                        local _ = v68 - 1
                        if v69:IsA("BasePart") then
                            v69:Destroy()
                        end
                    end
                end
            end
            for v71, v72 in v66 do
                v70(v72, v71 - 1, v66)
            end
        end
        if p65:IsA("BasePart") or p65:IsA("MeshPart") then
            p65.Transparency = 1
        end
        if p65:IsA("Accessory") and p65:GetAttribute("InvItem") ~= true then
            local v73 = p65:FindFirstChild("AccessoryWeld", true)
            if v73 ~= nil then
                v73 = v73.Part1
                if v73 ~= nil then
                    v73 = v73.Name
                end
            end
            if v73 ~= "Head" then
                p65:Destroy()
            end
        end
    end
    for v75, v76 in v64 do
        v74(v76, v75 - 1, v64)
    end
    p57:SetAttribute("IsBed", true)
    p57:SetAttribute("IsBedSkin", v62)
    print("[APRIL FOOLS] Turning " .. p57.Name .. " into bed" .. (not v62 and "" or " (" .. v62 .. ")"))
end
function u23.turnShopkeeperIntoBed(p77, p78, p79) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    local v80 = u6.Controllers.ShopkeeperController:getShopkeeperModel(p78, p79)
    if not v80 then
        return nil
    end
    local v81 = v80:WaitForChild("Head")
    if not v81 then
        return nil
    end
    local v82 = v80.Parent
    if not v82 then
        return nil
    end
    v82.Transparency = 1
    p77:createBedModel(p79, v80, v81, {
        ["scale"] = 1.1,
        ["bedSkin"] = u11:GetTagged("bed:" .. p79)[1]:GetAttribute("BedSkin")
    })
    local v83 = v80:GetChildren()
    local function v87(p84) --[[ Line: 298 ]]
        if p84.Name == "3D Clothing" then
            for v85, v86 in p84:GetChildren() do
                local _ = v85 - 1
                if v86.Name ~= "Mesh/Head" and (v86.Name ~= "Mesh/Mustach" and v86.Name ~= "Weld") then
                    v86:Destroy()
                end
            end
        end
        if (p84:IsA("Part") or p84:IsA("MeshPart")) and p84.Name ~= "Head" then
            p84.Transparency = 1
        end
    end
    for v88, v89 in v83 do
        v87(v89, v88 - 1, v83)
    end
end
function u23.createBedModel(_, u90, p91, p92, u93) --[[ Line: 320 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u6
        [4] = u17
        [5] = u9
        [6] = u8
    --]]
    local v94
    if u93 == nil then
        v94 = u93
    else
        v94 = u93.bedSkin
    end
    local v95
    if v94 then
        v95 = u12.Assets.Blocks:FindFirstChild(u93.bedSkin)
        if v95 ~= nil then
            v95 = v95:Clone()
        end
    else
        local v96 = u5.Controllers.BreakBedEffectUtilController
        local v97
        if u93 == nil then
            v97 = u93
        else
            v97 = u93.color
        end
        v95 = v96:createBedClone(u90, nil, v97)
    end
    if not v95 then
        return nil
    end
    local v98 = p91:FindFirstChild("AprilFoolsBed")
    if v98 ~= nil then
        v98:Destroy()
    end
    local v99
    if u93 == nil then
        v99 = u93
    else
        v99 = u93.bedSkin
    end
    if v99 then
        local v100 = v95:GetDescendants()
        local function v103(p101) --[[ Line: 355 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u90
                [3] = u93
            --]]
            if p101:IsA("MeshPart") or p101:IsA("SurfaceAppearance") then
                local v102 = u6.Controllers.TeamController:getTeamById(u90)
                if v102 ~= nil then
                    v102 = v102.color
                end
                if v102 == nil then
                    v102 = u93
                    if v102 ~= nil then
                        v102 = v102.color
                    end
                    if v102 == nil then
                        v102 = Color3.fromRGB(0, 0, 0)
                    end
                end
                p101.Color = v102
            end
        end
        for v104, v105 in v100 do
            v103(v105, v104 - 1, v100)
        end
    end
    v95.Name = "AprilFoolsBed"
    v95:PivotTo(p92:GetPivot() * CFrame.Angles(1.5707963267948966, 0, -3.141592653589793))
    v95:PivotTo(CFrame.new(p91:GetPivot().Position) * v95:GetPivot().Rotation)
    v95:PivotTo(v95:GetPivot() * CFrame.new(0, -0.5, -1.35))
    v95:SetAttribute("TransparencyOverride", 0)
    for v106, v107 in v95:GetDescendants() do
        local _ = v106 - 1
        if v107:IsA("BasePart") then
            v107.Massless = true
        end
    end
    v95.Parent = p91
    local v108
    if u93 == nil then
        v108 = u93
    else
        v108 = u93.bedSkin
    end
    if v108 == u17.BED_PRESENT then
        local v109 = v95:FindFirstChild("Lights", true)
        if v109 ~= nil then
            v109:Destroy()
        end
    end
    local v110 = v95:FindFirstChild("Carpet", true)
    if v110 ~= nil then
        v110:Destroy()
    end
    local v111
    if u93 == nil then
        v111 = u93
    else
        v111 = u93.scale
    end
    if v111 ~= 0 and (v111 == v111 and v111) then
        u9(v95, u93.scale)
    end
    local u112 = v95:FindFirstChild("Root")
    if u112 then
        u112:SetAttribute("TransparencyOverride", 1)
        u112.Anchored = false
        u112.CanCollide = false
        u112.CanQuery = false
        u8("WeldConstraint", {
            ["Part0"] = p92,
            ["Part1"] = u112,
            ["Parent"] = u112
        })
    end
    if u112 ~= nil then
        local v113 = u112:GetChildren()
        local function v122(p114) --[[ Line: 440 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u112
                [3] = u93
            --]]
            p114:SetAttribute("TransparencyOverride", 0)
            if p114:IsA("MeshPart") then
                p114.Anchored = false
                p114.CanCollide = false
                p114.CanQuery = false
                u8("WeldConstraint", {
                    ["Part0"] = p114,
                    ["Part1"] = u112,
                    ["Parent"] = u112
                })
                if p114.Name == "Bed" then
                    local v115 = u93
                    if v115 ~= nil then
                        v115 = v115.bedColor
                    end
                    if v115 then
                        local v116 = u93
                        if v116 ~= nil then
                            v116 = v116.bedColor
                        end
                        p114.Color = v116
                    end
                    local v117 = u93
                    if v117 ~= nil then
                        v117 = v117.bedMaterial
                    end
                    if v117 then
                        p114.Material = u93.bedMaterial
                    end
                    local v118 = u93
                    if v118 ~= nil then
                        v118 = v118.bedTransparency
                    end
                    if v118 ~= 0 and (v118 == v118 and v118) then
                        p114.Transparency = u93.bedTransparency
                        p114:SetAttribute("TransparencyOverride", u93.bedTransparency)
                    end
                end
                if p114.Name == "Blanket" then
                    local v119 = u93
                    if v119 ~= nil then
                        v119 = v119.blanketColor
                    end
                    if v119 then
                        local v120 = u93
                        if v120 ~= nil then
                            v120 = v120.blanketColor
                        end
                        p114.Color = v120
                    end
                    local v121 = u93
                    if v121 ~= nil then
                        v121 = v121.blanketMaterial
                    end
                    if v121 then
                        p114.Material = u93.blanketMaterial
                    end
                end
            end
        end
        for v123, v124 in v113 do
            v122(v124, v123 - 1, v113)
        end
    end
    return v95
end
u5.CreateController(u23.new())
return nil