local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "DisruptionController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
    --]]
    u14.constructor(p18, u10.DISRUPTOR)
    p18.Name = "DisruptionController"
    p18.lastOpen = 0
    p18.highlightMap = {}
end
function u15.KnitStart(p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onKitLocalActivated(u20, p21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u8
        [4] = u6
    --]]
    p21:GiveTask(u7.MatchStateChange:connect(function(p22) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u6
            [4] = u20
        --]]
        if p22.matchState == u11.RUNNING then
            local u23 = u8:getPlayerTeam(u6.LocalPlayer)
            if u23 ~= nil then
                u23 = u23.name
            end
            local v24 = u6:GetPlayers()
            local function v28(u25) --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u23
                --]]
                u25:GetAttributeChangedSignal("DisruptorActivation"):Connect(function() --[[ Line: 50 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u20
                        [3] = u23
                    --]]
                    local v26 = u25:GetAttribute("DisruptorActivation")
                    if v26 == 0 or (v26 ~= v26 or (v26 == "" or not v26)) then
                        u20:removeHighLight(u25)
                        return
                    elseif u25:GetAttribute("DisruptorTarget") == u23 then
                        u20:createHighLight(u25)
                    else
                        u20:removeHighLight(u25)
                    end
                end)
                u25:GetAttributeChangedSignal("DisruptorTarget"):Connect(function() --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u23
                        [3] = u20
                    --]]
                    if u25:GetAttribute("DisruptorTarget") == u23 then
                        local v27 = u25:GetAttribute("DisruptorActivation")
                        if v27 ~= 0 and (v27 == v27 and (v27 ~= "" and v27)) then
                            u20:createHighLight(u25)
                        end
                    else
                        u20:removeHighLight(u25)
                    end
                end)
            end
            for v29, v30 in v24 do
                v28(v30, v29 - 1, v24)
            end
        end
    end))
end
function u15.onKitLocalDeactivated(_) --[[ Line: 79 ]] end
function u15.onKitReplicationActivated(u31, p32) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u13
        [4] = u6
        [5] = u2
        [6] = u9
    --]]
    local u33 = u12.Client:OnEvent("DisruptionCollect", function(_) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
        --]]
        u3:playSound(u13.PICKUP_ITEM_DROP)
    end)
    p32:GiveTask(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:cancel()
    end)
    local u35 = u6.LocalPlayer:GetAttributeChangedSignal("DisruptionPriceIncrease"):Connect(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u2
            [3] = u9
        --]]
        local v34 = time()
        if v34 - u31.lastOpen >= 2.5 and u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u9.BEDWARS_ITEM_SHOP) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u9.BEDWARS_ITEM_SHOP)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u9.BEDWARS_ITEM_SHOP, {})
            u31.lastOpen = v34
        end
    end)
    p32:GiveTask(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:Disconnect()
    end)
end
function u15.onKitReplicationDeactivated(_) --[[ Line: 104 ]] end
function u15.onInnateAbilityEnabled(_, _, _) --[[ Line: 106 ]] end
function u15.onAbilityUsed(_, _, _) --[[ Line: 108 ]] end
function u15.createHighLight(p36, p37) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v38 = u5("Highlight", {
        ["FillTransparency"] = 1,
        ["OutlineTransparency"] = 0,
        ["Parent"] = p37.Character,
        ["OutlineColor"] = Color3.fromRGB(255, 120, 120),
        ["FillColor"] = Color3.fromRGB(255, 150, 150),
        ["DepthMode"] = Enum.HighlightDepthMode.Occluded
    })
    p36.highlightMap[p37] = v38
end
function u15.removeHighLight(p39, p40) --[[ Line: 124 ]]
    local v41 = p39.highlightMap[p40]
    if v41 ~= nil then
        v41:Destroy()
    end
    p39.highlightMap[p40] = nil
end
v4.CreateController(u15.new())
return nil