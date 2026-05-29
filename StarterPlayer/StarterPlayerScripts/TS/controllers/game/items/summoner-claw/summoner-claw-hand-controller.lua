local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileTouchType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_isItemClaw
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "SummonerClawHandController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
    --]]
    u10.constructor(p20)
    p20.Name = "SummonerClawHandController"
    p20.maid = u5.new()
    p20.lastAttackTime = 0
    p20.enableTime = 0
end
function u17.KnitStart(p21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p21)
end
function u17.onEnable(u22, u23) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u3
        [4] = u9
    --]]
    u22.enableTime = u8:GetServerTimeNow()
    local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v26 = {
        ["action"] = "Attack",
        ["actionId"] = "Summoner Claw Attack",
        ["boundFunction"] = function(_, p25, _) --[[ Name: boundFunction, Line 48 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u23
            --]]
            if p25 == Enum.UserInputState.Begin then
                u22:attack(u23.itemType)
            end
        end,
        ["mobile"] = {
            ["touchType"] = u3.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 55 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u23
                --]]
                u22:attack(u23.itemType)
            end
        }
    }
    local v27 = v24:bindAction(v26)
    u22.maid:GiveTask(v27)
    u22.maid:GiveTask(u9.MobileSwordButtonPressed:connect(function(_) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
        --]]
        u22:attack(u23.itemType)
    end))
end
function u17.onDisable(p28) --[[ Line: 66 ]]
    p28.maid:DoCleaning()
end
function u17.isRelevantItem(_, p29) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return u13(p29.itemType)
end
function u17.attack(p30, u31) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u16
        [4] = u15
        [5] = u8
        [6] = u12
        [7] = u4
        [8] = u14
    --]]
    local v32 = u11:getEntity(u7.LocalPlayer)
    if not v32 then
        return nil
    end
    if u16:isActive(v32:getInstance(), u15.FROZEN) then
        return nil
    end
    if u8:GetServerTimeNow() - p30.enableTime < 0.1 then
        return nil
    end
    if u8:GetServerTimeNow() - p30.lastAttackTime < u12.CLAW_COOLDOWN then
        return nil
    end
    if u4.Controllers.SummonerKitController:isPlayerCastingSpell(u7.LocalPlayer) then
        return nil
    end
    p30.lastAttackTime = u8:GetServerTimeNow()
    local u33 = u8.CurrentCamera.CFrame.LookVector
    local u34 = u7.LocalPlayer.Character.PrimaryPart.Position
    task.spawn(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u34
            [4] = u33
            [5] = u31
        --]]
        u4.Controllers.SummonerClawController:clawAttack(u7.LocalPlayer, u34, u33, u31)
    end)
    u14.Client:Get("SummonerClawAttackRequest"):SendToServer({
        ["position"] = u34,
        ["direction"] = u33,
        ["clientTime"] = u8:GetServerTimeNow()
    })
end
u4.CreateController(u17.new())
return nil