local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ExpireList
local u6 = v3.preloadImages
local u7 = v3.SoundManager
local u8 = v3.WatchPlayer
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.ContentProvider
local u18 = v16.Players
local u19 = v16.RunService
local u20 = v16.UserInputService
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-display-meta").EmoteDisplayMeta
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u35 = v1.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "EmoteController"
    end,
    ["__index"] = u23
})
u36.__index = u36
function u36.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u5
    --]]
    u23.constructor(p39)
    p39.Name = "EmoteController"
    p39.emoteSoundMaid = {}
    p39.joinEmotePromptMaid = {}
    p39.joinEmotePromptMap = {}
    p39.emoteCooldowns = u5.new(2)
    p39.emoteHandItemMaid = {}
    p39.emoteMaids = {}
    p39.emoteSoundMap = {}
    p39.emoteAllowed = true
end
function u36.KnitStart(u40) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u18
        [3] = u30
        [4] = u2
        [5] = u21
        [6] = u12
        [7] = u31
        [8] = u15
        [9] = u35
        [10] = u10
        [11] = u24
        [12] = u6
        [13] = u27
        [14] = u32
        [15] = u25
    --]]
    u8(function(p41) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u40
            [3] = u30
        --]]
        if p41.UserId ~= u18.LocalPlayer.UserId then
            return nil
        end
        for v42, v43 in u18:GetPlayers() do
            local _ = v42 - 1
            local v44 = u40:getPlayingEmote(v43)
            if v44 then
                if u30[v44].joinable and v43 ~= u18.LocalPlayer then
                    u40:setupEmoteJoinPrompt(v43, v44)
                end
            end
        end
    end)
    local v59 = {
        ["actionId"] = "spray-keyboard",
        ["action"] = "Emote",
        ["boundFunction"] = function(_, p45, p46) --[[ Name: boundFunction, Line 89 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u18
                [3] = u21
                [4] = u12
                [5] = u31
                [6] = u15
                [7] = u35
                [8] = u30
                [9] = u10
            --]]
            if not u40:canEmote() then
                return nil
            end
            if p45 == Enum.UserInputState.Begin then
                local v47 = {}
                for v48, u49 in u18.LocalPlayer:GetAttributes() do
                    if u21.startsWith(v48, "EmoteTypeSlot") and table.find(u12.values(u31), u49) ~= nil then
                        local v50 = u21.slice
                        local v51 = #v48 - 1
                        v47[tonumber(v50(v48, v51))] = {
                            ["element"] = u15.createElement(u35, {
                                ["Emote"] = u49
                            }),
                            ["title"] = u30[u49].name,
                            ["onSelect"] = function() --[[ Name: onSelect, Line 113 ]]
                                --[[
                                Upvalues:
                                    [1] = u40
                                    [2] = u49
                                    [3] = u10
                                --]]
                                u40:emote(u49)
                                u10.Controllers.RadialWheelController:closeRadialWheel()
                            end
                        }
                    end
                end
                local v52 = false
                local v53 = 1
                while true do
                    if true then
                        if v52 then
                            v53 = v53 + 1
                        else
                            v52 = true
                        end
                    end
                    if v53 > 8 then
                        break
                    end
                    if v47[v53] == nil then
                        v47[v53] = {
                            ["title"] = "",
                            ["element"] = u15.createElement(u35, {
                                ["Emote"] = u31.NONE
                            }),
                            ["onSelect"] = function() --[[ Name: onSelect, Line 140 ]]
                                --[[
                                Upvalues:
                                    [1] = u10
                                --]]
                                u10.Controllers.RadialWheelController:closeRadialWheel()
                            end
                        }
                    end
                end
                local v54 = u10.Controllers.RadialWheelController
                local v55 = u12.values(v47)
                local v56 = UDim2
                local v57
                if p46 == nil then
                    v57 = p46
                else
                    v57 = p46.Position.X
                end
                local v58
                if p46 == nil then
                    v58 = p46
                else
                    v58 = p46.Position.Y
                end
                v54:openRadialWheel(v55, 8, p46, true, v56.fromOffset(v57, v58), nil)
            end
        end
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v59)
    u40:preloadEmote()
    u24.changed:connect(function(p60, p61) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u12
            [3] = u31
            [4] = u6
            [5] = u27
        --]]
        if p60.Locker.selectedEmotes ~= p61.Locker.selectedEmotes then
            u40:preloadEmote()
            local v62 = u12.values(p60.Locker.selectedEmotes)
            local v63 = u31.ROCK_PAPER_SCISSORS
            if table.find(v62, v63) ~= nil then
                u6({ u27.HAND_FIST_ICON, u27.HAND_SCISSOR_ICON, u27.HAND_STOP_ICON })
            end
            local v64 = u12.values(p60.Locker.selectedEmotes)
            local v65 = u31.COIN_TOSS
            if table.find(v64, v65) ~= nil then
                u6({ u27.COIN_TOSS_SKULL, u27.COIN_TOSS_BONES })
            end
        end
    end)
    u32.Client:OnEvent("EmotePlaying", function(p66, p67, p68, p69) --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u40
            [3] = u30
            [4] = u25
        --]]
        if u18.LocalPlayer == p66 or not p68 then
            u40:playEmoteBeginSounds(p67, p66, p69)
        end
        local v70 = u30[p67]
        if v70.joinable then
            if p66 == u18.LocalPlayer then
                u40:disableSameEmotePrompts(p66, p67)
            else
                u40:setupEmoteJoinPrompt(p66, p67)
            end
            if p69 then
                local v71 = v70.animation
                if v71 ~= nil then
                    v71 = v71.type
                end
                if v71 == 0 or (v71 ~= v71 or not v71) then
                    return nil
                end
                local v72 = u25:getAssetId(v71)
                local v73 = false
                local v74 = 0
                while true do
                    if true then
                        if v73 then
                            v74 = v74 + 1
                        else
                            v73 = true
                        end
                    end
                    if v74 >= 5 or u40:syncAnimations(v72, p69, p66) then
                        break
                    end
                    task.wait(0.1)
                end
            end
        end
    end)
    u32.Client:OnEvent("EmoteEnding", function(p75, p76, p77) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u18
        --]]
        local v78 = u40.emoteSoundMaid[p75.UserId]
        if v78 ~= nil then
            v78:DoCleaning()
        end
        local v79 = u40.joinEmotePromptMaid[p75.UserId]
        if v79 ~= nil then
            v79:DoCleaning()
        end
        if p75 == u18.LocalPlayer then
            for _, v80 in u40.joinEmotePromptMap do
                v80.Enabled = true
            end
        end
        if not p77 then
            u40:playEmoteEndSounds(p76, p75)
        end
    end)
end
function u36.syncAnimations(_, p81, p82, p83) --[[ Line: 258 ]]
    if p82 ~= nil then
        p82 = p82.Character
        if p82 ~= nil then
            p82 = p82:FindFirstChildWhichIsA("Humanoid")
            if p82 ~= nil then
                p82 = p82:FindFirstChildWhichIsA("Animator")
            end
        end
    end
    local v84
    if p82 then
        v84 = nil
        for v85, v86 in p82:GetPlayingAnimationTracks() do
            local _ = v85 - 1
            local v87 = v86.Animation
            if v87 ~= nil then
                v87 = v87.AnimationId
            end
            if v87 == p81 == true then
                v84 = v86
                break
            end
        end
    else
        v84 = nil
    end
    if p83 ~= nil then
        p83 = p83.Character
        if p83 ~= nil then
            p83 = p83:FindFirstChildWhichIsA("Humanoid")
            if p83 ~= nil then
                p83 = p83:FindFirstChildWhichIsA("Animator")
            end
        end
    end
    local v88
    if p83 then
        v88 = nil
        for v89, v90 in p83:GetPlayingAnimationTracks() do
            local _ = v89 - 1
            local v91 = v90.Animation
            if v91 ~= nil then
                v91 = v91.AnimationId
            end
            if v91 == p81 == true then
                v88 = v90
                break
            end
        end
    else
        v88 = nil
    end
    if not (v84 and v88) then
        return false
    end
    v88.TimePosition = v84.TimePosition
    return true
end
function u36.emote(u92, u93, p94) --[[ Line: 329 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u14
        [3] = u18
        [4] = u30
        [5] = u32
        [6] = u29
        [7] = u25
        [8] = u22
        [9] = u19
        [10] = u13
        [11] = u20
    --]]
    if u93 == u31.NONE then
        return nil
    end
    if not u92:canEmote() then
        return nil
    end
    local u95 = u14.new()
    local u96 = u18.LocalPlayer
    local u97 = u30[u93]
    if u92.emoteCooldowns:has(u96.UserId) then
        return nil
    end
    u92.emoteCooldowns:add(u96.UserId)
    local v98 = u92.emoteMaids[u96.UserId]
    if v98 ~= nil then
        v98:DoCleaning()
    end
    u32.Client:Get("Emote"):CallServer({
        ["emoteType"] = u93,
        ["referencePlayer"] = p94
    })
    local v99 = u97.animation
    if u97.emoteDisplayType ~= nil and not v99 then
        v99 = u29[u97.emoteDisplayType].animation
    end
    if v99 then
        local v100 = u25:getAssetId(v99.type)
        if p94 ~= nil then
            p94 = p94.Character
            if p94 ~= nil then
                p94 = p94:FindFirstChildWhichIsA("Humanoid")
                if p94 ~= nil then
                    p94 = p94:FindFirstChildWhichIsA("Animator")
                end
            end
        end
        local v101
        if p94 then
            v101 = nil
            for v102, v103 in p94:GetPlayingAnimationTracks() do
                local _ = v102 - 1
                local v104 = v103.Animation
                if v104 ~= nil then
                    v104 = v104.AnimationId
                end
                if v104 == v100 == true then
                    v101 = v103
                    break
                end
            end
        else
            v101 = nil
        end
        local v105 = u96.Character
        if v105 then
            local v106 = u96.UserId
            if v101 ~= nil then
                v101 = v101.TimePosition
            end
            u95:GiveTask((u92:playEmoteAnimation(v106, v105, v99, u93, v101)))
            u92.emoteMaids[u96.UserId] = u95
            u95:GiveTask(function() --[[ Line: 410 ]]
                --[[
                Upvalues:
                    [1] = u92
                    [2] = u96
                --]]
                u92.emoteMaids[u96.UserId] = nil
            end)
        end
    end
    u95:GiveTask(function() --[[ Line: 418 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u32
            [3] = u93
        --]]
        u22.CancelEmoteEvent:fire()
        local v107 = {
            ["emoteType"] = u93
        }
        u32.Client:Get("EmoteCancelled"):CallServer(v107)
    end)
    local u108 = u96.Character
    if u108 ~= nil then
        u108 = u108.PrimaryPart
    end
    local u109
    if u108 == nil then
        u109 = u108
    else
        u109 = u108.Position
    end
    u95:GiveTask(u19.Heartbeat:Connect(function() --[[ Line: 434 ]]
        --[[
        Upvalues:
            [1] = u97
            [2] = u108
            [3] = u95
            [4] = u109
        --]]
        if u97.allowMovement then
            return nil
        end
        local v110 = u108
        if v110 ~= nil then
            v110 = v110.Parent
        end
        if not v110 then
            u95:DoCleaning()
            return nil
        end
        if not u109 or (u108.Position - u109).Magnitude > 0.6 then
            u95:DoCleaning()
        end
    end))
    if u97.allowMovement then
        u95:GiveTask(u22.SwordSwing:connect(function(_) --[[ Line: 451 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:DoCleaning()
        end))
        u95:GiveTask(u22.SwordChargedSwing:connect(function(_) --[[ Line: 454 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:DoCleaning()
        end))
        u95:GiveTask(u22.AbilityUsed:setPriority(u13.HIGHEST):connect(function(p111) --[[ Line: 457 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u95
            --]]
            if p111.userCharacter ~= u18.LocalPlayer.Character then
                return nil
            end
            u95:DoCleaning()
        end))
        u95:GiveTask(u22.BeginProjectileTargeting:connect(function(_) --[[ Line: 463 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:DoCleaning()
        end))
        u95:GiveTask(u20.JumpRequest:Connect(function() --[[ Line: 466 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:DoCleaning()
        end))
    end
end
function u36.getPlayingEmote(_, p112) --[[ Line: 471 ]]
    local v113 = p112.Character
    if v113 then
        return v113:GetAttribute("PlayingEmote")
    end
end
function u36.disableSameEmotePrompts(p114, _, p115) --[[ Line: 477 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    for v116, v117 in p114.joinEmotePromptMap do
        local v118 = u18:GetPlayerByUserId(v116)
        if v118 then
            if p114:getPlayingEmote(v118) == p115 then
                v117.Enabled = false
            end
        end
    end
end
function u36.setupEmoteJoinPrompt(u119, u120, u121) --[[ Line: 493 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u30
        [4] = u10
        [5] = u28
        [6] = u11
        [7] = u4
    --]]
    local u122
    if u120 then
        u122 = u120.UserId
    else
        u122 = u18.LocalPlayer.UserId
    end
    local v123 = u119.joinEmotePromptMaid[u122] or u14.new()
    v123:DoCleaning()
    local v124 = u30[u121]
    local v125 = u10.Controllers.KeybindLoadController:getKeybinds()
    local v126
    if v125 == nil then
        v126 = v125
    else
        v126 = v125.keyboard
        if v126 ~= nil then
            v126 = v126.controlActions.Emote
        end
    end
    local v127 = v126 or u28.KEYBOARD_KEYBINDS.controlActions.Interact
    if v125 ~= nil then
        v125 = v125.gamepad
        if v125 ~= nil then
            v125 = v125.controlActions.Emote
        end
    end
    local v128 = v125 or u28.GAMEPAD_KEYBINDS.controlActions.Emote
    local v129 = u11.Controllers.ProximityPromptController:createProximityPrompt({
        ["ObjectText"] = "Join!",
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 10,
        ["HoldDuration"] = 0.2,
        ["Parent"] = u120.Character,
        ["ActionText"] = v124.name,
        ["ClickablePrompt"] = u4.isMobileControls(),
        ["KeyboardKeyCode"] = v127,
        ["GamepadKeyCode"] = v128
    })
    v123:GiveTask(v129)
    u119.joinEmotePromptMap[u122] = v129
    v123:GiveTask(function() --[[ Line: 536 ]]
        --[[
        Upvalues:
            [1] = u119
            [2] = u122
        --]]
        u119.joinEmotePromptMap[u122] = nil
    end)
    local v130 = v129.Triggered:Connect(function(_) --[[ Line: 539 ]]
        --[[
        Upvalues:
            [1] = u119
            [2] = u121
            [3] = u120
        --]]
        u119:emote(u121, u120)
    end)
    if u119:getPlayingEmote(u18.LocalPlayer) == u121 then
        v129.Enabled = false
    end
    v123:GiveTask(v130)
    u119.joinEmotePromptMaid[u122] = v123
end
function u36.playEmoteAnimation(u131, u132, p133, p134, u135, p136) --[[ Line: 550 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u25
        [3] = u18
        [4] = u32
    --]]
    local u137 = u14.new()
    local u138
    if p134.noAutoPlayAnimation then
        u138 = nil
    else
        local v139 = u25
        local v140 = p134.type
        local v141 = {}
        local v142 = p134.looped
        if v142 == nil then
            v142 = false
        end
        v141.looped = v142
        local v143 = p134.speed
        v141.speed = v143 == nil and 1 or v143
        u138 = v139:playAnimation(p133, v140, v141)
        local v144 = u138 and p136
        if v144 ~= 0 and (v144 == v144 and v144) then
            u138.TimePosition = p136
        end
    end
    local v145 = p134.hideItemInHand and u132 ~= -1 and u18:GetPlayerByUserId(u132)
    if v145 then
        u131:hideItemInHand(v145)
    end
    u137:GiveTask(function() --[[ Line: 582 ]]
        --[[
        Upvalues:
            [1] = u138
            [2] = u131
            [3] = u132
            [4] = u32
            [5] = u135
        --]]
        local v146 = u138
        if v146 ~= nil then
            v146:Stop()
        end
        local v147 = u138
        if v147 ~= nil then
            v147:Destroy()
        end
        local v148 = u131.emoteHandItemMaid[u132]
        if v148 ~= nil then
            v148:DoCleaning()
        end
        local v149 = {
            ["emoteType"] = u135
        }
        u32.Client:Get("EmoteCancelled"):CallServer(v149)
        local v150 = u131.emoteMaids[u132]
        if v150 ~= nil then
            v150:DoCleaning()
        end
        u131.emoteMaids[u132] = nil
    end)
    if u138 ~= nil then
        local v151 = u138.Looped
    end
    local v152 = not v151
    if v152 then
        v152 = p134.disableCleanupOnAnimationEnd
    end
    if v152 then
        local u153 = nil
        if u138 ~= nil then
            u138 = u138.Stopped:Connect(function() --[[ Line: 623 ]]
                --[[
                Upvalues:
                    [1] = u137
                    [2] = u153
                --]]
                u137:DoCleaning()
                local v154 = u153
                if v154 ~= nil then
                    v154:Disconnect()
                end
            end)
        end
    end
    return u137
end
function u36.playEmoteBeginSounds(u155, p156, u157, u158) --[[ Line: 635 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u29
        [3] = u24
        [4] = u7
        [5] = u18
        [6] = u14
        [7] = u22
        [8] = u33
    --]]
    local v159 = u30[p156]
    local u160
    if u157 == nil then
        u160 = u157
    else
        u160 = u157.Character
    end
    if u157 then
        local v161 = u155.emoteSoundMaid
        local v162
        if u157 == nil then
            v162 = u157
        else
            v162 = u157.UserId
        end
        local v163 = v161[v162]
        if v163 ~= nil then
            v163:DoCleaning()
        end
    end
    local v164 = v159.soundsOnBegin or {}
    local v165
    if v159.emoteDisplayType == nil then
        v165 = v164
    else
        local v166 = u29[v159.emoteDisplayType].soundsOnBegin
        if v166 then
            v165 = {}
            local v167 = #v165
            local v168 = #v164
            table.move(v164, 1, v168, v167 + 1, v165)
            local v169 = v167 + v168
            table.move(v166, 1, #v166, v169 + 1, v165)
        else
            v165 = v164
        end
    end
    local u170 = u24:getState().Settings.emote_volume
    local function v182(p171) --[[ Line: 669 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u160
            [3] = u170
            [4] = u157
            [5] = u155
            [6] = u158
        --]]
        local v172 = u7
        local v173 = p171.sound
        local v174 = {
            ["rollOffMaxDistance"] = 30
        }
        local v175
        if u160 then
            v175 = u160:GetPivot().Position
        else
            v175 = nil
        end
        v174.position = v175
        local v176
        if u160 then
            v176 = u160.PrimaryPart
        else
            v176 = nil
        end
        v174.parent = v176
        v174.volumeMultiplier = 0.5 * u170
        local v177 = p171.config
        if type(v177) == "table" then
            for v178, v179 in v177 do
                v174[v178] = v179
            end
        end
        local v180 = v172:playModifiableSound(v173, v174)
        if u157 then
            u155.emoteSoundMap[u157] = v180
            if u158 then
                local v181 = u155.emoteSoundMap[u158]
                if v181 ~= nil then
                    v181 = v181.TimePosition
                end
                if v181 ~= 0 and (v181 == v181 and v181) then
                    v180.TimePosition = v181
                end
            end
        end
        return v180
    end
    local v183 = 0
    local u184 = {}
    for v185, v186 in v165 do
        local v187 = v182(v186, v185 - 1, v165)
        if v187 ~= nil then
            v183 = v183 + 1
            u184[v183] = v187
        end
    end
    if u184 then
        local v188
        if u157 then
            v188 = u157.UserId
        else
            v188 = u18.LocalPlayer.UserId
        end
        local v189 = u14.new()
        v189:GiveTask(function() --[[ Line: 719 ]]
            --[[
            Upvalues:
                [1] = u184
            --]]
            for v190, v191 in u184 do
                local _ = v190 - 1
                v191:Stop()
                v191:Destroy()
            end
        end)
        u155.emoteSoundMaid[v188] = v189
        v189:GiveTask(u22.SettingChanged:connect(function(p192) --[[ Line: 729 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u24
                [3] = u184
            --]]
            if p192.setting == u33.EMOTE_VOLUME then
                local v193 = u24:getState().Settings.emote_volume
                for v194, v195 in u184 do
                    local _ = v194 - 1
                    v195.Volume = 0.5 * v193
                end
            end
        end))
    end
    return u184
end
function u36.playEmoteEndSounds(_, p196, p197) --[[ Line: 743 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u29
        [3] = u24
        [4] = u7
    --]]
    local v198 = u30[p196]
    local u199 = p197.Character
    if not u199 then
        return nil
    end
    local v200 = v198.soundsOnEnd or {}
    local v201
    if v198.emoteDisplayType == nil then
        v201 = v200
    else
        local v202 = u29[v198.emoteDisplayType].soundsOnEnd
        if v202 then
            v201 = {}
            local v203 = #v201
            local v204 = #v200
            table.move(v200, 1, v204, v203 + 1, v201)
            local v205 = v203 + v204
            table.move(v202, 1, #v202, v205 + 1, v201)
        else
            v201 = v200
        end
    end
    local function v208(p206) --[[ Line: 764 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u7
            [3] = u199
        --]]
        if p206.sound == "" then
            return nil
        end
        local v207 = u24:getState().Settings.emote_volume
        return u7:playModifiableSound(p206.sound, {
            ["rollOffMaxDistance"] = 30,
            ["position"] = u199:GetPivot().Position,
            ["parent"] = u199.PrimaryPart,
            ["volumeMultiplier"] = 0.5 * v207
        })
    end
    local v209 = 0
    local v210 = {}
    for v211, v212 in v201 do
        local v213 = v208(v212, v211 - 1, v201)
        if v213 ~= nil then
            v209 = v209 + 1
            v210[v209] = v213
        end
    end
    return v210
end
function u36.preloadEmote(_) --[[ Line: 790 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u12
        [3] = u30
        [4] = u6
        [5] = u17
        [6] = u25
    --]]
    local v214 = u24:getState().Locker.selectedEmotes
    local v215 = u12.values(v214)
    local function v218(p216) --[[ Line: 793 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u6
            [3] = u17
            [4] = u25
        --]]
        local u217 = u30[p216]
        if not u217 then
            return nil
        end
        if u217.image ~= nil then
            u6({ u217.image })
        end
        task.spawn(function() --[[ Line: 801 ]]
            --[[
            Upvalues:
                [1] = u217
                [2] = u17
                [3] = u25
            --]]
            if u217.animation then
                u17:PreloadAsync({ u25:getAnimation(u217.animation.type) })
            end
        end)
    end
    for v219, v220 in v215 do
        v218(v220, v219 - 1, v215)
    end
end
function u36.playEmoteShowcase(p221, p222) --[[ Line: 811 ]]
    p221.activeEmoteShowcaseSounds = p221:playEmoteBeginSounds(p222)
end
function u36.stopEmoteShowcase(p223) --[[ Line: 814 ]]
    local v224 = p223.activeEmoteShowcaseSounds
    if v224 then
        for v225, v226 in v224 do
            local _ = v225 - 1
            v226:Stop()
            v226:Destroy()
        end
        p223.activeEmoteShowcaseSounds = nil
    end
end
function u36.hideItemInHand(p227, p228) --[[ Line: 827 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u26
    --]]
    local v229 = u14.new()
    local u230 = u26:getEntity(p228)
    if u230 ~= nil then
        u230 = u230:getHandItemInstanceFromCharacter()
    end
    local u231 = {}
    local v232 = 0
    for _ in u231 do
        v232 = v232 + 1
    end
    if v232 == 0 and u230 ~= nil then
        for v233, v234 in u230:GetDescendants() do
            local _ = v233 - 1
            if v234:IsA("BasePart") or v234:IsA("Decal") then
                u231[v234] = v234.Transparency
                v234.Transparency = 1
            end
        end
    end
    v229:GiveTask(function() --[[ Line: 859 ]]
        --[[
        Upvalues:
            [1] = u230
            [2] = u231
        --]]
        local v235 = u230
        if v235 ~= nil then
            for v236, v237 in v235:GetDescendants() do
                local _ = v236 - 1
                if v237:IsA("BasePart") or v237:IsA("Decal") then
                    local v238 = u231[v237]
                    if v238 ~= nil then
                        v237.Transparency = v238
                    end
                end
            end
        end
        table.clear(u231)
    end)
    p227.emoteHandItemMaid[p228.UserId] = v229
end
function u36.canEmote(p239) --[[ Line: 882 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u10
    --]]
    if not u34.isLobbyServer() then
        local v240 = u10.Controllers.MatchController:getQueueMeta()
        if v240 and v240.disableEmotes == true then
            return false
        end
    end
    return p239.emoteAllowed
end
function u36.setCanEmote(p241, p242) --[[ Line: 893 ]]
    p241.emoteAllowed = p242
end
u10.CreateController(u36.new())
return nil