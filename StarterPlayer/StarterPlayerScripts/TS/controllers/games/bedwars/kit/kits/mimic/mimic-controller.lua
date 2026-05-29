local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.DeviceUtil
local u7 = v5.RandomUtil
local u8 = v5.SoundManager
local u9 = v5.TimedProgressBar
local u10 = v5.WatchCharacter
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u12 = v11.KnitClient
local u13 = v11.KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.CollectionService
local u18 = v16.Players
local u19 = v16.ReplicatedStorage
local u20 = v16.UserInputService
local u21 = v16.Workspace
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u24 = v23.InteractionCategory
local u25 = v23.InteractionPriority
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "mimic-balance-file").MimicBalance
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u40 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u41 = v1.import(script, script.Parent, "ui", "mimic-block-face").MimicBlockFace
local u42 = { u37.MIMIC_PICKPOCKET_1, u37.MIMIC_PICKPOCKET_2, u37.MIMIC_PICKPOCKET_3 }
local u43 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "MimicController"
    end,
    ["__index"] = u40
})
u43.__index = u43
function u43.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u43
    --]]
    local v44 = u43
    local v45 = setmetatable({}, v44)
    return v45:constructor(...) or v45
end
function u43.constructor(p46) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u37
        [3] = u42
        [4] = u34
        [5] = u40
    --]]
    local v47 = u33.MIMIC
    local v48 = {}
    local v49 = { u37.GENERIC_BLOCK_PLACE, u37.MIMIC_HIDE, u37.MIMIC_REVEAL }
    local v50 = #v49
    table.move(u42, 1, #u42, v50 + 1, v49)
    v48.sounds = v49
    v48.imageIds = { u34.MIMIC_BLOCK }
    u40.constructor(p46, v47, v48)
    p46.Name = "MimicController"
    p46.playerMimicMap = {}
end
function u43.onKitLocalActivated(u51, p52) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u29
        [3] = u6
        [4] = u25
        [5] = u24
        [6] = u18
        [7] = u31
        [8] = u28
        [9] = u27
        [10] = u38
        [11] = u36
        [12] = u7
        [13] = u42
        [14] = u8
    --]]
    p52:GiveTask(u12.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Pickpocket!",
        ["interactionObjectText"] = "Pickpocket",
        ["interactionTag"] = "MimicBLockPickPocketPlayer",
        ["instantActivation"] = true,
        ["removePromptOnInteract"] = true,
        ["maxActivationDistance"] = u29.MIMIC_PICKPOCKET_RADIUS,
        ["clickablePrompt"] = u6.isMobileControls(),
        ["priority"] = u25.ABILITY,
        ["category"] = u24.ABILITY,
        ["onInteracted"] = function(p53, p54, _) --[[ Name: onInteracted, Line 82 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u31
                [3] = u28
                [4] = u27
                [5] = u38
                [6] = u36
                [7] = u51
                [8] = u7
                [9] = u42
                [10] = u8
            --]]
            if not p54:IsA("Model") then
                return nil
            end
            if not u18:GetPlayerFromCharacter(p54) then
                return nil
            end
            local v55 = u31:getEntity(p53)
            if v55 ~= nil then
                v55 = v55:getInstance()
            end
            if not v55 then
                return nil
            end
            for _, v56 in u28[u27.MIMIC_BLOCK_PICKPOCKET].blockingStatusEffects or {} do
                if u38:isActive(v55, v56) then
                    return nil
                end
            end
            local v57 = u18:GetPlayerFromCharacter(p54)
            if not v57 then
                return nil
            end
            if u36.Client:Get("MimicBlockPickPocketPlayer"):CallServer(v57) then
                u51:hidePromptsFromPlayer(p53)
                local v58 = p53.Character
                if v58 ~= nil then
                    v58 = v58.PrimaryPart
                    if v58 ~= nil then
                        v58 = v58.Position
                    end
                end
                if v58 then
                    local v59 = u42
                    u8:playSound(u7.fromList(unpack(v59)), {
                        ["playbackSpeedMultiplier"] = 1.27,
                        ["position"] = v58
                    })
                end
            end
        end
    }))
end
function u43.onKitLocalDeactivated(_) --[[ Line: 128 ]] end
function u43.onKitReplicationActivated(u60, u61) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u18
        [3] = u36
        [4] = u12
        [5] = u10
        [6] = u33
        [7] = u2
        [8] = u15
        [9] = u9
        [10] = u29
        [11] = u8
        [12] = u37
        [13] = u14
        [14] = u22
        [15] = u27
        [16] = u31
    --]]
    u61:GiveTask(task.spawn(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u21
            [3] = u18
            [4] = u36
            [5] = u12
        --]]
        while true do
            local v62 = task.wait(0.25)
            if v62 == 0 or (v62 ~= v62 or not v62) then
                break
            end
            for v63, v64 in u60.playerMimicMap do
                local v65 = v63.Character
                if v65 ~= nil then
                    v65 = v65:FindFirstChildWhichIsA("Humanoid")
                end
                if v65 then
                    if u21:GetServerTimeNow() - v64.lastMoveTime >= 1 and (v65.MoveDirection.Magnitude == 0 and (v65:GetState() ~= Enum.HumanoidStateType.Freefall and v65:GetState() ~= Enum.HumanoidStateType.Jumping)) then
                        if v64.inMovement then
                            v64.inMovement = false
                            if u18.LocalPlayer == v63 then
                                if u60.lastSnapRequestThread then
                                    task.cancel(u60.lastSnapRequestThread)
                                    u60.lastSnapRequestThread = nil
                                end
                                u60.lastSnapRequestThread = task.spawn(function() --[[ Line: 159 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u36
                                    --]]
                                    u36.Client:Get("MimicBlockSnapToGrid"):SendToServer()
                                end)
                            end
                        end
                    elseif not v64.inMovement then
                        v64.inMovement = true
                        u12.Controllers.BlockDisguiseController:disguisePlayerAsBlock(v63, v64.selectedBlock)
                    end
                end
            end
        end
    end))
    u61:GiveTask(u10(function(u66, p67) --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u33
            [3] = u60
            [4] = u21
        --]]
        if not u12.Controllers.KitController:isUsingKit(u66, u33.MIMIC) then
            return nil
        end
        p67:WaitForChild("Humanoid"):GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u66
                [3] = u21
            --]]
            local v68 = u60.playerMimicMap[u66]
            if v68 then
                v68.lastMoveTime = u21:GetServerTimeNow()
            end
        end)
    end))
    u36.Client:OnEvent("ValidatedMimicBlock", function(p69) --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u60
            [3] = u21
            [4] = u18
            [5] = u2
            [6] = u15
            [7] = u9
            [8] = u29
        --]]
        local v70 = p69.player
        local v71 = p69.blockType ~= nil
        if v71 then
            u12.Controllers.BlockDisguiseController:hidePlayer(v70)
            u12.Controllers.BlockDisguiseController:disguisePlayerAsBlock(v70, p69.blockType)
            u60.playerMimicMap[v70] = {
                ["inMovement"] = false,
                ["selectedBlock"] = p69.blockType,
                ["lastMoveTime"] = u21:GetServerTimeNow()
            }
            if v70 == u18.LocalPlayer then
                local v72 = u60.cooldownBar
                if v72 ~= nil then
                    v72:Destroy()
                end
                u60.cooldownBar = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u15.createElement(u9, {
                    ["Size"] = UDim2.fromScale(1, 0.05),
                    ["EndTime"] = u21:GetServerTimeNow() + u29.MIMIC_BUFFS_APPLY_DELAY,
                    ["ProgressBarConfig"] = {
                        ["GradientRotation"] = 0,
                        ["Title"] = {
                            ["text"] = "Shield & Speed buff on reveal"
                        },
                        ["BarGradient"] = ColorSequence.new(Color3.fromRGB(43, 255, 28), Color3.fromRGB(112, 255, 143))
                    }
                }))
            end
        else
            u60.playerMimicMap[v70] = nil
            u12.Controllers.BlockDisguiseController:undisguisePlayer(v70)
            if v70 == u18.LocalPlayer then
                u60:hidePromptsFromPlayer(v70)
                local v73 = u60.cooldownBar
                if v73 ~= nil then
                    v73:Destroy()
                end
            end
        end
        u60:playEffect(v70, v71)
    end):andThen(function(p74) --[[ Line: 228 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        u61:GiveTask(p74)
    end)
    u61:GiveTask(u36.Client:Get("ValidatedMimicBlockSnapToGrid"):Connect(function(p75) --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u12
            [3] = u18
            [4] = u8
            [5] = u37
        --]]
        local v76 = u60.playerMimicMap[p75.player]
        if v76 ~= nil then
            v76 = v76.inMovement
        end
        if v76 then
            return nil
        end
        if not u12.Controllers.BlockDisguiseController:anchorBlockModel(p75.player) then
            return nil
        end
        if u18.LocalPlayer == p75.player then
            local v77 = p75.player.Character
            if v77 ~= nil then
                v77 = v77.PrimaryPart
                if v77 ~= nil then
                    v77 = v77.Position
                end
            end
            if v77 then
                u8:playSound(u37.GENERIC_BLOCK_PLACE, {
                    ["playbackSpeedMultiplier"] = 1.27,
                    ["position"] = v77
                })
            end
        end
    end))
    u61:GiveTask(u36.Client:Get("MimicBlockPickPocketReady"):Connect(function(p78) --[[ Line: 263 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u60
        --]]
        if p78.player == u18.LocalPlayer then
            if p78.ready then
                u60:showPromptsForPlayer(p78.player)
            else
                u60:hidePromptsFromPlayer(p78.player)
            end
        else
            return nil
        end
    end))
    u61:GiveTask(u36.Client:Get("MimicBlockRevealed"):Connect(function() --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u29
            [3] = u60
            [4] = u14
        --]]
        local v79 = u12.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = u29.MIMIC_BUFFS_SPEED_MULTIPLIER
        })
        local v80 = u60.speedMaid
        if v80 ~= nil then
            v80:Destroy()
        end
        if u60.speedThread then
            task.cancel(u60.speedThread)
            u60.speedThread = nil
        end
        u60.speedMaid = u14.new()
        u60.speedMaid:GiveTask(v79)
        u60.speedThread = task.delay(u29.MIMIC_BUFFS_DURATION, function() --[[ Line: 287 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            local v81 = u60.speedMaid
            if v81 ~= nil then
                v81:Destroy()
            end
        end)
    end))
    u61:GiveTask(u22.CanUseLocalAbility:connect(function(p82) --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u31
        --]]
        if p82.ability ~= u27.MIMIC_BLOCK then
            return nil
        end
        local v83 = u31:getEntity(p82.userCharacter)
        if v83 ~= nil then
            v83 = v83:isAlive()
        end
        if not v83 then
            p82:setCancelled(true)
        end
    end))
end
function u43.onKitReplicationDeactivated(_) --[[ Line: 308 ]] end
function u43.onInnateAbilityEnabled(_, _, _) --[[ Line: 310 ]] end
function u43.onAbilityUsed(p84, _, p85) --[[ Line: 312 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u18
        [3] = u36
    --]]
    if p85:isCancelled() then
        return nil
    end
    if p85.ability ~= u27.MIMIC_BLOCK then
        return nil
    end
    local v86 = u18:GetPlayerFromCharacter(p85.userCharacter)
    if not v86 then
        return nil
    end
    if v86 ~= u18.LocalPlayer then
        return nil
    end
    local u87 = p84:getSelectedBlockFromPlayer(v86)
    task.spawn(function() --[[ Line: 327 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u87
        --]]
        local v88 = {
            ["data"] = {
                ["blockType"] = u87
            }
        }
        u36.Client:Get("MimicBlock"):SendToServer(v88)
    end)
end
function u43.playEffect(_, p89, p90) --[[ Line: 335 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u37
        [3] = u12
        [4] = u32
        [5] = u19
        [6] = u21
        [7] = u39
        [8] = u15
        [9] = u41
        [10] = u8
    --]]
    local v91 = p89.Character
    if v91 ~= nil then
        v91 = v91.PrimaryPart
        if v91 ~= nil then
            v91 = v91.Position
        end
    end
    if not v91 then
        return nil
    end
    local v92 = u31:getEntity(p89)
    local v93
    if p90 then
        v93 = u37.MIMIC_HIDE
    else
        v93 = u37.MIMIC_REVEAL
    end
    if v92 then
        local v94 = u32[u12.Controllers.KitSkinController:getKitSkin(v92:getInstance())]
        local v95 = u19.Assets.Effects.MimicBlockEffect:Clone()
        local v96 = v94.milo
        if v96 ~= nil then
            v96 = v96.blockEffect
        end
        if v96 then
            v95 = v94.milo.blockEffect:Clone()
        end
        v95.Parent = u21
        v95.Position = v91
        u39:playEffects({ v95 }, nil, {
            ["destroyAfterSec"] = 1
        })
        if v94.milo then
            if p90 then
                v93 = v94.milo.disguiseSound
            else
                v93 = v94.milo.revealSound
            end
        end
    end
    if p90 then
        local v97 = u12.Controllers.BlockDisguiseController:getPlayerBlockModel(p89)
        if v97 then
            local u98 = {}
            for _, v99 in Enum.NormalId:GetEnumItems() do
                local v100 = u15.mount(u15.createElement(u41, {
                    ["face"] = v99
                }), v97:FindFirstChild("Handle"))
                table.insert(u98, v100)
            end
            task.delay(2, function() --[[ Line: 386 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u98
                --]]
                for v101, v102 in u98 do
                    local _ = v101 - 1
                    u15.unmount(v102)
                end
            end)
        end
    end
    u8:playSound(v93, {
        ["volumeMultiplier"] = 0.25,
        ["position"] = v91
    })
end
function u43.showPromptsForPlayer(_, u103) --[[ Line: 401 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u12
        [3] = u17
    --]]
    local v104 = u18:GetPlayers()
    local function v106(p105) --[[ Line: 403 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u12
            [3] = u17
        --]]
        if p105 == u103 then
            return nil
        end
        if u12.Controllers.TeamController:getPlayerTeam(p105) == u12.Controllers.TeamController:getPlayerTeam(u103) then
            return nil
        end
        if not p105.Character then
            return nil
        end
        if p105:HasTag("PlayerHidden") then
            return nil
        end
        u17:AddTag(p105.Character, "MimicBLockPickPocketPlayer")
    end
    for v107, v108 in v104 do
        v106(v108, v107 - 1, v104)
    end
end
function u43.hidePromptsFromPlayer(_, p109) --[[ Line: 422 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u13
    --]]
    for v110, v111 in u18:GetPlayers() do
        local _ = v110 - 1
        if v111 ~= p109 then
            if v111.Character then
                if u17:HasTag(v111.Character, "MimicBLockPickPocketPlayer") then
                    u13.Controllers.InteractionRegistryController:removePrompt(v111.Character, "MimicBLockPickPocketPlayer")
                end
            end
        end
    end
end
function u43.getSelectedBlockFromPlayer(_, p112) --[[ Line: 440 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u3
        [3] = u35
        [4] = u6
        [5] = u20
        [6] = u26
        [7] = u4
    --]]
    local v113 = p112.Character
    if not v113 then
        return nil
    end
    local v114 = v113:FindFirstChildWhichIsA("Humanoid")
    if not v114 then
        return nil
    end
    local v115 = v113.PrimaryPart
    if not v115 then
        return nil
    end
    local v116 = v115.Size.Y / 2 + v114.HipHeight + 0.25 * u30
    local v117 = v115.Position - Vector3.new(0, v116, 0)
    local v118 = u3:getStore():getBlockAt(u3:getBlockPosition(v117))
    local v119
    if v118 and u35[v118.Name] ~= nil then
        v119 = v118.Name
    else
        v119 = nil
    end
    if not u6.isMobileControls() and (not u6.isGamepadControls() and #u20:GetConnectedGamepads() == 0) then
        local v120 = u26:getBlockSelector():getMouseInfo(u4.SELECT)
        if v120 ~= nil then
            v120 = v120.target
        end
        if v120 ~= nil then
            v120 = v120.blockInstance.Name
        end
        if v120 ~= nil then
            v119 = v120
        end
    end
    return v119
end
u12.CreateController(u43.new())
return nil