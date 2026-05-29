local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.MobileTouchType
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v3.WatchPlayer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "KaidaClawLobbyGadgetController"
    end,
    ["__index"] = u17
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
        [1] = u17
        [2] = u10
    --]]
    u17.constructor(p28)
    p28.Name = "KaidaClawLobbyGadgetController"
    p28.maid = u10.new()
    p28.lastAttackTime = 0
    p28.enableTime = 0
    p28.playerCastingDataMap = {}
    p28.clawColors = {
        Color3.fromRGB(75, 75, 75),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(43, 229, 229),
        Color3.fromRGB(49, 229, 94)
    }
end
function u25.KnitStart(u29) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u24
        [3] = u8
        [4] = u12
        [5] = u21
        [6] = u22
    --]]
    u17.KnitStart(u29)
    if not u24.isLobbyServer() then
        return nil
    end
    u8(function(u30, p31) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u21
            [3] = u29
        --]]
        if u30 ~= u12.LocalPlayer then
            return nil
        end
        if u30:GetAttribute("LobbyGadgetType") == u21.KAIDA_CLAW then
            u29:equip()
        else
            u29:unequip()
        end
        p31:GiveTask(u30:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u21
                [3] = u29
            --]]
            if u30:GetAttribute("LobbyGadgetType") == u21.KAIDA_CLAW then
                u29:equip()
            else
                u29:unequip()
            end
        end))
    end)
    u22.Client:Get("SummonerClawAttackFromServer"):Connect(function(p32, p33, p34) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u29
        --]]
        if p32 ~= u12.LocalPlayer then
            u29:clawAttack(p32, p33, p34)
        end
    end)
end
function u25.equip(u35) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u5
        [4] = u16
    --]]
    u35.enableTime = u15:GetServerTimeNow()
    local v36 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v38 = {
        ["action"] = "Attack",
        ["actionId"] = "Summoner Claw Attack",
        ["boundFunction"] = function(_, p37, _) --[[ Name: boundFunction, Line 87 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            if p37 == Enum.UserInputState.Begin then
                u35:attack()
            end
        end,
        ["mobile"] = {
            ["touchType"] = u5.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 94 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                u35:attack()
            end
        }
    }
    local v39 = v36:bindAction(v38)
    u35.maid:GiveTask(v39)
    u35.maid:GiveTask(u16.MobileSwordButtonPressed:connect(function(_) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:attack()
    end))
end
function u25.unequip(p40) --[[ Line: 105 ]]
    p40.maid:DoCleaning()
end
function u25.attack(u41) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u24
        [3] = u12
        [4] = u21
        [5] = u22
    --]]
    if u15:GetServerTimeNow() - u41.enableTime < 0.1 then
        return nil
    end
    if not u24.isLobbyServer() then
        return nil
    end
    if u12.LocalPlayer:GetAttribute("LobbyGadgetType") ~= u21.KAIDA_CLAW then
        return nil
    end
    if u15:GetServerTimeNow() - u41.lastAttackTime < 1 then
        return nil
    end
    u41.lastAttackTime = u15:GetServerTimeNow()
    local u42 = u15.CurrentCamera.CFrame.LookVector
    local u43 = u12.LocalPlayer.Character.PrimaryPart.Position
    task.spawn(function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u12
            [3] = u43
            [4] = u42
        --]]
        u41:clawAttack(u12.LocalPlayer, u43, u42)
    end)
    u22.Client:Get("SummonerClawAttackRequest"):SendToServer({
        ["position"] = u43,
        ["direction"] = u42,
        ["clientTime"] = u15:GetServerTimeNow()
    })
end
function u25.clawAttack(_, p44, _, p45) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u20
        [4] = u13
        [5] = u15
        [6] = u12
        [7] = u6
        [8] = u23
        [9] = u7
        [10] = u4
        [11] = u19
        [12] = u18
        [13] = u14
    --]]
    local v46 = p44.Character
    if not v46 then
        return nil
    end
    local v47 = v46.PrimaryPart
    if not v47 then
        return nil
    end
    local u48 = u10.new()
    local v49 = u20[u9.Controllers.KitSkinController:getKitSkin(v46)]
    local v50 = u13.Assets.Misc.Kaida.Summoner_DragonClaw
    local v51 = v49.kaida
    if v51 ~= nil then
        v51 = v51.dragon_claw
    end
    if v51 then
        v50 = v49.kaida.dragon_claw
    end
    local u52 = v50:Clone()
    u52.Parent = u15
    local v53 = 0
    local u54 = {}
    for v55, v56 in u52:GetChildren() do
        local _ = v55 - 1
        if v56:IsA("MeshPart") == true then
            v53 = v53 + 1
            u54[v53] = v56
        end
    end
    local v57 = u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
    if p44 == u12.LocalPlayer and v57 then
        for v58, v59 in u54 do
            local _ = v58 - 1
            v59.Transparency = 0.6
        end
    end
    local v60 = Color3.fromRGB(49, 229, 94)
    u52.dragon_claw_nail_mesh.Color = v60
    u7:playSound(u6.fromList(u23.SUMMONER_CLAW_ATTACK_1, u23.SUMMONER_CLAW_ATTACK_2, u23.SUMMONER_CLAW_ATTACK_3, u23.SUMMONER_CLAW_ATTACK_4), {
        ["position"] = v47.Position
    })
    if p44 == u12.LocalPlayer then
        u4:playAnimation(p44, u19:getAssetId(u18.SUMMONER_CHARACTER_SWIPE), {
            ["looped"] = false
        })
    end
    local v61 = p45.X
    local v62 = p45.Z
    local v63 = Vector3.new(v61, 0, v62).Unit
    local v64 = v63:Cross(Vector3.new(0, 1, 0)).Unit * -1
    local v65 = v47.Position + v64 * 5 + v63 * 6
    local v66 = (v65 + p45 * 13 - v65).Unit
    u52:PivotTo((CFrame.new(v65, v65 + v66)))
    u52.PrimaryPart.Anchored = true
    local u71 = u14.Heartbeat:Connect(function() --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        local v67 = u52.RootPart.root.fore_arm.TransformedWorldCFrame
        local v68 = u52.Portal1
        if v68 ~= nil then
            v68:PivotTo(v67)
        end
        local v69 = v67 * CFrame.Angles(3.141592653589793, 0, 0)
        local v70 = u52.Portal2
        if v70 ~= nil then
            v70:PivotTo(v69)
        end
    end)
    u4:playAnimation(u52.AnimationController.Animator, u19:getAssetId(u18.SUMMONER_CLAW_ATTACK), {
        ["looped"] = false,
        ["speed"] = 1
    })
    task.wait(0.5)
    local u72 = 0
    local u73 = v57 and 0.6 or 0
    local u80 = u14.Heartbeat:Connect(function(p74) --[[ Line: 250 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u73
            [3] = u54
        --]]
        u72 = u72 + p74
        local v75 = u72 / 0.25
        local v76 = u73
        local v77 = math.clamp(v75, v76, 1)
        for v78, v79 in u54 do
            local _ = v78 - 1
            v79.Transparency = v77
        end
    end)
    task.delay(0.25, function() --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u80
            [3] = u71
            [4] = u52
        --]]
        u48:DoCleaning()
        u80:Disconnect()
        u71:Disconnect()
        u52:Destroy()
    end)
end
u9.CreateController(u25.new())
return nil