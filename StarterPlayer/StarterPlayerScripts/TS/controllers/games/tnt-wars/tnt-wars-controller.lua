local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").CORE_HP
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, script.Parent, "ui", "tnt-wars-hud").TNTWarsHud
local u15 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, (1 / 0), true, 0)
local u16 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, (1 / 0), false, 0)
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "TNTWarsController"
    end,
    ["__index"] = u8
})
u17.__index = u17
function u17.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p20)
    p20.Name = "TNTWarsController"
    p20.cores = {}
    p20.coreMap = {}
end
function u17.KnitStart(u21) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u9
        [4] = u12
        [5] = u10
    --]]
    u8.KnitStart(u21)
    u13.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p22, _, _) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
            [3] = u10
            [4] = u21
        --]]
        local v23 = u9:getState().Game.queueType
        if p22 == u12.RUNNING and v23 == u10.TNT_WARS then
            u21:handleCores()
        end
    end)
end
function u17.handleCores(u24) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2("tnt-wars-core", function(p25) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:animateCore(p25)
        u24:handleCoreSpawned(p25)
        u24:handleCoreDamaged(p25)
    end)
end
function u17.animateCore(_, p26) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
        [3] = u16
    --]]
    u7:Create(p26, u15, {
        ["Position"] = p26.Position + Vector3.new(0, 1, 0)
    }):Play()
    u7:Create(p26, u16, {
        ["Orientation"] = p26.Orientation + Vector3.new(360, 0, 0)
    }):Play()
end
function u17.handleCoreSpawned(p27, p28) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v29 = p28:GetAttribute("TeamId")
    local v30 = p28:GetAttribute("CoreUUID")
    local v31 = p27.coreMap[v29]
    local v32 = {
        ["hp"] = u11,
        ["teamId"] = v29,
        ["position"] = p28.Position,
        ["coreUUID"] = v30,
        ["corePart"] = p28
    }
    local v33 = p27.cores
    table.insert(v33, v32)
    if v31 then
        table.insert(v31, v32)
        local _ = #v31
    else
        p27.coreMap[v29] = { v32 }
    end
    if #p27.cores == 4 then
        p27:onCoresSpawned()
    end
end
function u17.handleCoreDamaged(u34, u35) --[[ Line: 101 ]]
    local u36 = u35:GetAttribute("CoreUUID")
    u35:GetAttributeChangedSignal("Hp"):Connect(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u36
            [3] = u35
        --]]
        local v37 = u34:getCoreByUUID(u36)
        if not v37 then
            return nil
        end
        local v38 = v37.hp
        local v39 = u35:GetAttribute("Hp")
        v37.hp = v39
        local v40 = v38 - v39
        u34:showDamageNumber(v37, (math.abs(v40)))
    end)
end
function u17.showDamageNumber(_, p41, p42) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.Controllers.DamageIndicatorController:spawnDamageIndicator(p41.position, p42, {
        ["infiniteRange"] = true,
        ["color"] = Color3.fromRGB(255, 0, 0)
    })
end
function u17.onCoresSpawned(p43) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u14
    --]]
    local v44 = u6.LocalPlayer:GetAttribute("Team")
    local v45 = {}
    local v46 = {}
    local v47 = v45
    local v48 = v46
    for v49, v50 in p43.coreMap do
        if v44 == v49 then
            v45 = v50
            v47 = v45
        else
            v46 = v50
            v48 = v46
        end
    end
    u4.mount(u4.createElement(u14, {
        ["enemyCores"] = v48,
        ["friendlyCores"] = v47
    }), u6.LocalPlayer:WaitForChild("PlayerGui"))
end
function u17.getCoreByUUID(p51, p52) --[[ Line: 143 ]]
    local v53 = nil
    for v54, v55 in p51.cores do
        local _ = v54 - 1
        if v55.coreUUID == p52 == true then
            return v55
        end
    end
    return v53
end
u3.CreateController(u17.new())
return nil