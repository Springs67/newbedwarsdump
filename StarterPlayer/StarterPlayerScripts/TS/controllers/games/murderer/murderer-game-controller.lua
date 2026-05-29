local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Countdown
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Lighting
local u12 = v10.Players
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = v1.import(script, script.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = v1.import(script, script.Parent, "ui", "match-end-screen", "murderer-match-end-screen").MurdererMatchEndScreen
local u26 = v1.import(script, script.Parent, "ui", "murderer-role-reveal").MurdererRoleReveal
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "MurdererGameController"
    end,
    ["__index"] = u14
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u17
    --]]
    u14.constructor(p30, { u17.MURDERER_GAME })
    p30.Name = "MurdererGameController"
end
function u27.KnitStart(p31) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p31)
end
function u27.onGameInit(u32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u20
        [4] = u15
        [5] = u5
        [6] = u23
        [7] = u22
        [8] = u9
        [9] = u26
        [10] = u12
        [11] = u18
        [12] = u25
        [13] = u6
        [14] = u19
        [15] = u4
        [16] = u3
    --]]
    u32:setupMurderLighting()
    u7.Controllers.BlockPlacementController:disableBlockPlacer()
    u13.MatchStateChange:connect(function(p33) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u15
            [3] = u5
            [4] = u23
        --]]
        if p33.matchState == u20.RUNNING then
            u15:fade(0.3, 1, 0.3)
            u5:playSound(u23.WIND_AMBIENCE, {
                ["volumeMultiplier"] = 1.25,
                ["looped"] = true
            })
            u5:playSound(u23.GRAVEYARD_MUSIC_LOOP, {
                ["volumeMultiplier"] = 1.2,
                ["looped"] = true
            })
        end
    end)
    u22.Client:Get("MurderRoleReveal"):Connect(function(p34) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u9
            [3] = u26
            [4] = u12
            [5] = u18
        --]]
        u32:handleNameTags()
        local u35 = u9.mount(u9.createElement(u26, {
            ["Role"] = p34.role
        }), u12.LocalPlayer:WaitForChild("PlayerGui"))
        task.delay(u18.ROLE_REVEAL_DISPLAY_DURATION, function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u35
            --]]
            u9.unmount(u35)
        end)
    end)
    u22.Client:Get("MakeMurderer"):Connect(function(p36) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:initMurdererHighlight(p36.murderers)
    end)
    u22.Client:Get("MurderEndGameScreen"):Connect(function(p37) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u25
            [3] = u12
        --]]
        u9.mount(u9.createElement(u25, {
            ["Roles"] = p37.roles,
            ["Eliminations"] = p37.eliminations
        }), u12.LocalPlayer:WaitForChild("PlayerGui"))
    end)
    u6("ItemDrop", function(p38) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u9
            [3] = u4
            [4] = u3
        --]]
        if p38.Name ~= u19.SHERIFF_CROSSBOW then
            return nil
        end
        local v39 = p38:GetAttribute("PickupReadyTime")
        if v39 ~= 0 and (v39 == v39 and v39) then
            local v40 = u9.mount
            local v41 = u9.createElement
            local v42 = {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 4.5, 1.5),
                ["ResetOnSpawn"] = false,
                ["MaxDistance"] = 200,
                ["Adornee"] = p38,
                ["Size"] = UDim2.fromScale(6, 3)
            }
            local v43 = {}
            local v44 = u9.createElement
            local v45 = u4
            local v46 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0, 0)
            }
            local v47 = {}
            local v48 = u9.createElement
            local v49 = u3
            local v50 = {
                ["EndTime"] = v39,
                ["TextLabel"] = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.RobotoMono
                },
                ["CountdownConfig"] = {
                    ["days"] = false,
                    ["hours"] = false,
                    ["minutes"] = false,
                    ["seconds"] = true
                }
            }
            __set_list(v47, 1, {v48(v49, v50)})
            __set_list(v43, 1, {v44(v45, v46, v47)})
            v40(v41("BillboardGui", v42, v43), p38, "ItemDropPickupCountdown")
        end
    end)
end
function u27.initMurdererHighlight(p51, p52) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    for _, v53 in p52 do
        if v53 ~= u12.LocalPlayer then
            p51:createHighlight(v53)
        end
    end
end
function u27.setupMurderLighting(_) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v54 = u11:FindFirstChild("Atmosphere")
    if v54 ~= nil then
        v54:Destroy()
    end
    u11.FogColor = Color3.fromRGB(237, 237, 229)
    u11.FogStart = 50
    u11.FogEnd = 450
end
function u27.createHighlight(_, p55) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if not p55.Character then
        return nil
    end
    local v56 = {
        ["Name"] = "Highlight",
        ["Parent"] = p55.Character
    }
    local v57 = p55.Character
    if v57 ~= nil then
        v57 = v57.PrimaryPart
        if v57 ~= nil then
            v57 = v57.CFrame - Vector3.new(0, 3, 0)
        end
    end
    v56.CFrame = v57
    v56.Shape = Enum.PartType.Cylinder
    v56.Color = Color3.fromRGB(0, 255, 64)
    v56.Material = Enum.Material.Neon
    v56.CastShadow = false
    v56.Size = Vector3.new(0.5, 6, 6)
    v56.Orientation = Vector3.new(0, 0, 90)
    v56.Transparency = 0.75
    v56.Anchored = false
    v56.CanCollide = false
    v56.CanQuery = false
    v56.CanTouch = false
    v56.Massless = true
    local v58 = u8("Part", v56)
    local v59 = {
        ["Part0"] = v58
    }
    local v60 = p55.Character
    if v60 ~= nil then
        v60 = v60.PrimaryPart
    end
    v59.Part1 = v60
    v59.Parent = v58
    u8("WeldConstraint", v59)
    u8("Highlight", {
        ["Enabled"] = true,
        ["FillTransparency"] = 1,
        ["OutlineTransparency"] = 0,
        ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
        ["FillColor"] = Color3.fromRGB(0, 255, 238),
        ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
        ["Parent"] = p55.Character
    })
end
function u27.handleNameTags(_) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u24
        [4] = u21
    --]]
    local v61 = u12:GetPlayers()
    local function v64(p62) --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u16
            [3] = u24
            [4] = u21
        --]]
        if p62 == u12.LocalPlayer then
            return nil
        end
        local v63 = u16:getEntity(p62)
        if v63 ~= nil then
            v63:disableLobbyNametagAlwaysOnTop()
        end
        if v63 ~= nil then
            v63:setNametagBorderColor(u24.mcGreen)
        end
        if v63 ~= nil then
            v63:setNametag(u21.getGamePlayer(p62):getDisplayName(), Color3.fromHex("55FF55"))
        end
    end
    for v65, v66 in v61 do
        v64(v66, v65 - 1, v61)
    end
end
u7.CreateController(u27.new())
return nil