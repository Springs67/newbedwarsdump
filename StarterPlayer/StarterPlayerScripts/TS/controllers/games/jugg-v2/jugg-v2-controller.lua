local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u24 = v1.import(script, script.Parent, "ui", "jugg-hud").JuggHud
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "JuggV2Controller"
    end,
    ["__index"] = u14
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u19
    --]]
    u14.constructor(p28, { u19.JUGGERNAUT_V2 })
    p28.Name = "JuggV2Controller"
    p28.swordMap = {}
end
function u25.KnitStart(p29) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p29)
end
function u25.onGameInit(u30) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u22
        [3] = u21
        [4] = u12
        [5] = u13
        [6] = u9
        [7] = u5
        [8] = u11
        [9] = u18
        [10] = u2
        [11] = u15
    --]]
    u8.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u22.JUGGERNAUT_GROUND_SMASH,
            u22.JUGGERNAUT_EXPLOSION_1,
            u22.JUGGERNAUT_LEAP,
            u22.JUGGERNAUT_SPIN
        }
    })
    u30:mountJuggHud()
    u21.Client:Get("SpawnJuggnautSword"):Connect(function(p31) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u30
            [4] = u9
            [5] = u5
            [6] = u11
            [7] = u18
            [8] = u2
        --]]
        local u32 = u12.Assets.Effects.JuggernautRageBlade:Clone()
        u32.Parent = u13
        for v33, v34 in u32:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("Sound") then
                v34:Play()
            end
        end
        if u32 then
            local v35 = u32.PrimaryPart
            if not v35 then
                return nil
            end
            u30.swordMap[p31.secret] = u32
            u32:SetAttribute("Secret", p31.secret)
            p31.position = p31.position - Vector3.new(0, 1, 0)
            u32:PivotTo(CFrame.new(p31.position))
            local u36 = u9.Controllers.ProximityPromptController:createProximityPrompt({
                ["ActionText"] = "Collect",
                ["HoldDuration"] = 3,
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 5,
                ["Parent"] = v35,
                ["ClickablePrompt"] = u5.isMobileControls()
            })
            u36.Triggered:Connect(function(p37) --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u18
                    [3] = u30
                    [4] = u32
                    [5] = u36
                    [6] = u2
                --]]
                if p37 == u11.LocalPlayer then
                    local v38 = u18:getEntity(p37)
                    if v38 ~= nil then
                        v38 = v38:isAlive()
                    end
                    if not v38 then
                        return nil
                    end
                    if u30:useSword(u32) then
                        u36:Destroy()
                        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            ["message"] = "You are now the Juggernaut!"
                        })
                        return
                    end
                    u36:Destroy()
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "You are late! Somebody else has took the sword!"
                    })
                end
            end)
        end
    end)
    u21.Client:Get("UseJuggernautSword"):Connect(function(p39) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local v40 = u30.swordMap[p39.secret]
        if v40 then
            u30:pullSwordAnimation(p39.player, v40)
            u30.swordMap[p39.secret] = nil
        end
    end)
    u21.Client:Get("NewJuggernaut"):Connect(function(p41) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u11
            [3] = u15
        --]]
        u30:newJuggernautEffect(p41.player)
        if p41.player == u11.LocalPlayer then
            u15:dispatch({
                ["type"] = "InventorySelectHotbarItemGroup",
                ["itemGroup"] = "sword"
            })
        end
    end)
end
function u25.mountJuggHud(_) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u24
    --]]
    local v42 = {
        ["appId"] = "JuggHud",
        ["app"] = u24
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v42, {})
end
function u25.useSword(_, p43) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v44 = {
        ["secret"] = p43:GetAttribute("Secret")
    }
    return u21.Client:Get("UseJuggnautSword"):CallServer(v44)
end
function u25.pullSwordAnimation(_, u45, p46) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u23
        [3] = u20
        [4] = u4
        [5] = u17
        [6] = u16
        [7] = u11
        [8] = u15
    --]]
    local v47 = p46:FindFirstChild("Model")
    local u48 = u12.Assets.Effects.SwordInStone:Clone()
    u48.Parent = u45.Character
    if v47 ~= nil then
        v47:Destroy()
    end
    u23:weldCharacterAccessories(u45.Character)
    local v49 = u20.getInventory(u45).hand
    if v49 ~= nil then
        v49.tool:Destroy()
    end
    local v50 = u4:playAnimation(u45, u17:getAssetId(u16.JUGGERNAUT_PULL_SWORD))
    if v50 ~= nil then
        v50.Stopped:Connect(function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u45
                [3] = u11
                [4] = u15
            --]]
            u48:Destroy()
            if u45 == u11.LocalPlayer then
                u15:dispatch({
                    ["type"] = "InventorySelectHotbarItemGroup",
                    ["itemGroup"] = "sword"
                })
            end
        end)
    end
    p46:Destroy()
end
function u25.newJuggernautEffect(_, p51) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u6
        [4] = u22
    --]]
    local v52 = p51.Character
    if v52 ~= nil then
        v52 = v52.PrimaryPart
        if v52 ~= nil then
            v52 = v52.Position
        end
    end
    if not v52 then
        return nil
    end
    local u53 = u12.Assets.Effects.NewJuggernaut:Clone()
    u53.Position = v52
    u53.Parent = u13
    for v54, v55 in u53:GetDescendants() do
        local _ = v54 - 1
        if v55:IsA("ParticleEmitter") then
            v55:Emit(30)
        end
    end
    u6:playSound(u22.JUGGERNAUT_EXPLOSION_1, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.7,
        ["position"] = v52
    })
    task.delay(1, function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        u53:Destroy()
    end)
end
u8.CreateController(u25.new())
return nil