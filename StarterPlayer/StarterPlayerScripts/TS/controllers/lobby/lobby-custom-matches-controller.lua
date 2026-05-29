local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CollectionTagAdded
local u5 = v3.ColorUtil
local u6 = v3.GetTarmacAsset
local u7 = v3.SoundManager
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = u1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = u1.import(script, script.Parent, "custom-matches", "ui", "create-match-hud").CreateMatchHud
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "LobbyCustomMatchesController"
    end,
    ["__index"] = u15
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
    --]]
    u15.constructor(p23)
    p23.Name = "LobbyCustomMatchesController"
    p23.remotes = u17.Client:GetNamespace("CustomMatches")
end
u20.KnitStart = u1.async(function(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u14
        [4] = u5
        [5] = u13
    --]]
    u4("CustomMatchesNpc", function(p25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u14
            [3] = u24
            [4] = u5
            [5] = u13
        --]]
        u10.Controllers.ProximityPromptController:createProximityPrompt({
            ["MaxActivationDistance"] = 17,
            ["ActionText"] = "Creative",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = p25
        }).Triggered:Connect(function(p26) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u24
            --]]
            if p26 == u14.LocalPlayer then
                u24:openCustomMatchApp()
            end
        end)
        local v27 = p25.PrimaryPart
        local v28 = string.split("Creative", "")
        local v29 = u5.hexColor(16756669)
        local v30 = u5.hexColor(16761760)
        local v31 = table.create(#v28)
        for v32, v33 in v28 do
            local v34 = v29:Lerp(v30, (v32 - 1) / (#v28 - 1))
            v31[v32] = "<font color=\"" .. u5.richTextColor(v34) .. "\">" .. v33 .. "</font>"
        end
        v27:SetAttribute("BillboardTitle", table.concat(v28, ""))
        v27:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3))
        v27:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0))
        u13:AddTag(v27, "Billboard")
    end)
end)
function u20.openCustomMatchApp(u35) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u1
        [4] = u7
        [5] = u18
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CUSTOM_MATCHES, {
        ["OnJoinMatch"] = u1.async(function(p36) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u35
            --]]
            if p36 == "" or not p36 then
                return nil
            end
            local v37 = u1.await(u35.remotes:WaitFor("JoinByCode"))
            if v37 then
                u1.await(v37:CallServerAsync(p36))
            end
        end),
        ["OnCreateMatch"] = function(...) --[[ Name: OnCreateMatch, Line 87 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            return u35:createMatch(unpack({ ... }))
        end,
        ["OnClose"] = function() --[[ Name: OnClose, Line 91 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u16
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.CUSTOM_MATCHES)
        end
    })
    u7:playSound(u18.UI_OPEN_2)
end
function u20.createMatch(u38, ...) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u19
        [4] = u14
        [5] = u9
    --]]
    local v39 = { ... }
    local v40 = v39[3]
    if v40 ~= nil then
        v40 = v40.mapName
    end
    local v41 = v40 == nil and "" or v40
    local v42 = v39[3]
    if v42 ~= nil then
        v42 = v42.mapThumbnail
    end
    if v42 == nil then
        v42 = u6("NoImage").Image
    end
    u38.customMatchHudTree = u11.mount(u11.createElement(u19, {
        ["mapName"] = v41,
        ["mapImage"] = v42
    }), u14.LocalPlayer:WaitForChild("PlayerGui"))
    local v43 = u9.Controllers.LobbyCustomMatchesController.remotes:WaitFor("CreateCustomMatch"):expect():CallServerAsync(unpack(v39)):expect()
    task.delay(3, function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u11
        --]]
        if u38.customMatchHudTree then
            u11.unmount(u38.customMatchHudTree)
        end
    end)
    return v43
end
u9.CreateController(u20.new())
return nil