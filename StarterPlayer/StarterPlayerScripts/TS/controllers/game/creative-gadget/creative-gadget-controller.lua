local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.DeviceUtil
local u7 = v4.WatchCollectionTag
local u8 = v4.WatchPlayer
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "creative-gadget", "creative-gadget-util").getCreativeGadgetMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "CreativeGadgetController"
    end,
    ["__index"] = u15
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
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u21
    --]]
    u15.constructor(p25)
    p25.Name = "CreativeGadgetController"
    p25.gamemodeRemotes = u21.Client:GetNamespace("Gamemode")
    p25.promptMap = {}
    p25.creativeGadgetData = {}
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u14
        [4] = u10
        [5] = u18
        [6] = u7
        [7] = u19
        [8] = u11
        [9] = u6
    --]]
    u15.KnitStart(u26)
    u8(function(p27) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u26
            [3] = u10
        --]]
        if p27 ~= u14.LocalPlayer then
            return nil
        end
        u26:toggleGadgetVisibility(u10.Controllers.GamemodeController:isLocalPlayerInCreativeMode())
    end)
    u26.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p28) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u26
            [3] = u18
        --]]
        if p28.player ~= u14.LocalPlayer then
            return nil
        end
        u26:toggleGadgetVisibility(p28.gamemode == u18.CREATIVE)
    end)
    u7("CreativeGadget", function(u29) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u6
            [4] = u26
            [5] = u14
        --]]
        local v30 = u19(u29.Name)
        if not v30.gadget then
            return nil
        end
        if u29:GetAttribute("ClientPlaced") then
            return nil
        end
        local v31 = u11.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Configure",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["ObjectText"] = v30.displayName,
            ["Parent"] = u29,
            ["ClickablePrompt"] = u6.isMobileControls()
        })
        u26.promptMap[u29] = v31
        v31.Triggered:Connect(function(p32) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u26
                [3] = u29
            --]]
            if p32 ~= u14.LocalPlayer then
                return nil
            end
            u26:openGadgetMenu(u29)
        end)
    end)
end
function u22.toggleGadgetVisibility(u33, p34, p35) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local u36 = p34 and 0 or 1
    local function v42(p37, p38) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u36
        --]]
        local v39 = u33.promptMap[p38]
        if v39 then
            v39.Enabled = p37
        end
        for v40, v41 in p38:GetDescendants() do
            local _ = v40 - 1
            if v41:IsA("Decal") then
                v41.Transparency = u36
            elseif v41:IsA("BasePart") or v41:IsA("MeshPart") then
                v41.Transparency = u36
            end
        end
        p38.Transparency = 1
    end
    if p35 then
        v42(p34, p35)
    else
        for v43, v44 in u13:GetTagged("CreativeGadget") do
            local _ = v43 - 1
            v42(p34, v44)
        end
    end
end
function u22.getSavedDataForGadget(p45, p46, p47) --[[ Line: 125 ]]
    local v48 = p45.creativeGadgetData[p46]
    if v48 ~= nil then
        v48 = v48[p47]
    end
    return v48
end
function u22.saveDataToGadget(p49, p50, p51, p52) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v53 = u3.getOrCreate(p49.creativeGadgetData, p50, {})
    v53[p51] = p52
    p49.creativeGadgetData[p50] = v53
end
u22.requestGadgetRemoval = v1.async(function(_, u54) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
    --]]
    u21.Client:Get("RequestRemoveGadget"):CallServerAsync({
        ["blockInstance"] = u54
    }):andThen(function(p55) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u54
        --]]
        if p55 then
            local v56 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
            local v57 = {}
            local v58 = u54.Position
            v57.message = "Removed gadget at " .. tostring(v58) .. "."
            v56:sendInfoNotification(v57)
        end
        return p55
    end)
end)
u22.requestGadgetCreation = v1.async(function(p59, p60) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u20
        [3] = u19
    --]]
    local v61 = p59.creativeGadgetData[p60]
    if v61 then
        local v62 = p60.Name
        for v63, _ in u17(v62).config do
            local v64 = v61[v63]
            local _ = v64 == "" or v64
        end
        local v65 = v61.Team
        local v66 = v61.Cooldown
        local v67 = tonumber(v66)
        local v68 = v61["Max Stack Size"]
        local v69 = tonumber(v68)
        local v70 = v61.Item
        if v62 == u20.BED_GADGET then
            if v65 == "" or not v65 then
                return false
            else
                return p59:setUpBed(p60, v65)
            end
        elseif v62 == u20.TEAM_GENERATOR_GADGET then
            if v65 == "" or (not v65 or (v67 == 0 or (v67 ~= v67 or (not v67 or (v69 == 0 or (v69 ~= v69 or not v69)))))) then
                return false
            else
                return p59:setUpTeamGenerator(p60, v65, v67, v69)
            end
        elseif v62 == u20.GLOBAL_GENERATOR_GADGET then
            if v70 == "" or (not v70 or (v67 == 0 or (v67 ~= v67 or (not v67 or (v69 == 0 or (v69 ~= v69 or not v69)))))) then
                return false
            elseif u19(v70) then
                return p59:setUpGlobalGenerator(p60, v70, v67, v69)
            else
                return false
            end
        elseif v62 == u20.SPAWN_GADGET then
            if v65 == "" or not v65 then
                return false
            else
                return p59:setUpTeamSpawn(p60, v65)
            end
        else
            return true
        end
    else
        return false
    end
end)
u22.setUpBed = v1.async(function(_, u71, p72) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u21
        [3] = u2
        [4] = u5
    --]]
    local u73 = u10.Controllers.TeamController:getTeamById(p72)
    if u73 then
        return u21.Client:Get("RequestCreateBed"):CallServerAsync({
            ["blockInstance"] = u71,
            ["teamId"] = p72
        }):andThen(function(p74) --[[ Line: 219 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u5
                [3] = u73
                [4] = u71
            --]]
            if p74 then
                local v75 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v76 = {}
                local v77 = u5.richTextColor(u73.color)
                local v78 = u73.name
                local v79 = u71.Position
                v76.message = "Placed a bed for <font color=\"" .. v77 .. "\">" .. v78 .. "</font> at " .. tostring(v79) .. "."
                v75:sendInfoNotification(v76)
            end
            return p74
        end)
    else
        return false
    end
end)
u22.setUpGlobalGenerator = v1.async(function(_, u80, u81, p82, p83) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
    --]]
    return u21.Client:Get("RequestCreateGenerator"):CallServerAsync({
        ["blockInstance"] = u80,
        ["item"] = u81,
        ["cooldown"] = p82,
        ["maxStackSize"] = p83
    }):andThen(function(p84) --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u81
            [3] = u80
        --]]
        if p84 then
            local v85 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
            local v86 = {}
            local v87 = u81
            local v88 = u80.Position
            v86.message = "Placed a global generator of " .. v87 .. " at " .. tostring(v88) .. "."
            v85:sendInfoNotification(v86)
        end
        return p84
    end)
end)
u22.setUpTeamGenerator = v1.async(function(_, u89, p90, p91, p92) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u21
        [3] = u2
        [4] = u5
    --]]
    local u93 = u10.Controllers.TeamController:getTeamById(p90)
    if u93 then
        return u21.Client:Get("RequestCreateTeamGenerator"):CallServerAsync({
            ["blockInstance"] = u89,
            ["teamId"] = p90,
            ["cooldown"] = p91,
            ["maxStackSize"] = p92
        }):andThen(function(p94) --[[ Line: 253 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u5
                [3] = u93
                [4] = u89
            --]]
            if p94 then
                local v95 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v96 = {}
                local v97 = u5.richTextColor(u93.color)
                local v98 = u93.name
                local v99 = u89.Position
                v96.message = "Placed a team generator for <font color=\"" .. v97 .. "\">" .. v98 .. "</font> at " .. tostring(v99) .. "."
                v95:sendInfoNotification(v96)
            end
            return p94
        end)
    else
        return false
    end
end)
u22.setUpTeamSpawn = v1.async(function(_, u100, p101) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u21
        [3] = u2
        [4] = u5
    --]]
    if p101 == "" or not p101 then
        return false
    else
        local u102 = u10.Controllers.TeamController:getTeamById(p101)
        if u102 then
            return u21.Client:Get("RequestSetTeamSpawn"):CallServerAsync({
                ["blockInstance"] = u100,
                ["teamId"] = p101
            }):andThen(function(p103) --[[ Line: 273 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u5
                    [3] = u102
                    [4] = u100
                --]]
                if p103 then
                    local v104 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                    local v105 = {}
                    local v106 = u5.richTextColor(u102.color)
                    local v107 = u102.name
                    local v108 = u100.Position
                    v105.message = "Changed the spawn position for <font color=\"" .. v106 .. "\">" .. v107 .. "</font> to " .. tostring(v108) .. "."
                    v104:sendInfoNotification(v105)
                end
                return p103
            end)
        else
            return false
        end
    end
end)
function u22.openGadgetMenu(_, p109) --[[ Line: 282 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CREATIVE_GADGET_MENU, {
        ["CreativeGadgetBlockInstance"] = p109
    })
end
function u22.closeGadgetMenu(_) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.CREATIVE_GADGET_MENU)
end
u10.CreateController(u22.new())
return nil