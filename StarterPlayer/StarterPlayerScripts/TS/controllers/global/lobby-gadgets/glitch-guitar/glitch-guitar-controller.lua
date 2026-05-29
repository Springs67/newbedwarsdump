local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CollectionTagAdded
local u5 = v3.GameQueryUtil
local u6 = v3.MobileButton
local u7 = v3.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Debris
local u15 = v12.Players
local u16 = v12.ReplicatedStorage
local u17 = v12.RunService
local u18 = v12.TweenService
local u19 = v12.UserInputService
local u20 = v12.Workspace
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "glitch-item-balance").GlitchItemBalanceFile
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "GlitchGuitarController"
    end,
    ["__index"] = u21
})
u33.__index = u33
function u33.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u9
    --]]
    u21.constructor(p36)
    p36.Name = "GlitchGuitarController"
    p36.maid = u9.new()
    p36.playingMaid = u9.new()
    p36.lastClickTime = -1
    p36.playing = false
    p36.lastUseTime = -1
end
function u33.KnitStart(p37) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u30
        [3] = u29
        [4] = u15
        [5] = u24
        [6] = u23
        [7] = u31
        [8] = u7
        [9] = u10
        [10] = u20
        [11] = u5
        [12] = u16
        [13] = u9
        [14] = u1
        [15] = u17
        [16] = u18
        [17] = u14
        [18] = u4
        [19] = u8
        [20] = u27
        [21] = u32
        [22] = u13
    --]]
    u21.KnitStart(p37)
    u30.Client:WaitFor("GuitarDamage"):andThen(function(p38) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u15
            [3] = u24
            [4] = u23
            [5] = u31
            [6] = u7
            [7] = u10
            [8] = u20
            [9] = u5
            [10] = u16
            [11] = u9
            [12] = u1
            [13] = u17
            [14] = u18
            [15] = u14
        --]]
        p38:Connect(function(p39) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u15
                [3] = u24
                [4] = u23
                [5] = u31
                [6] = u7
                [7] = u10
                [8] = u20
                [9] = u5
                [10] = u16
                [11] = u9
                [12] = u1
                [13] = u17
                [14] = u18
                [15] = u14
            --]]
            local u40 = p39.targetEntity.PrimaryPart
            if u40 ~= nil then
                u40 = u40:FindFirstChild("RootRigAttachment")
            end
            local u41 = p39.sourceEntity:FindFirstChild(u29.GLITCH_GUITAR)
            if u41 ~= nil then
                u41 = u41:FindFirstChild("Handle")
                if u41 ~= nil then
                    u41 = u41:FindFirstChild("HealBeamAttachment")
                end
            end
            if u40 and u41 then
                local v42 = p39.sourceEntity == u15.LocalPlayer.Character
                if v42 then
                    u24:playAnimation(u15.LocalPlayer, u23.GUITAR_HEAL)
                end
                local v43 = u31.GUITAR_HEAL_1_ROCKSTAR
                if v43 ~= "" and v43 then
                    local v44 = u7
                    local v45 = {}
                    local v46
                    if v42 then
                        v46 = nil
                    else
                        v46 = p39.sourceEntity:GetPrimaryPartCFrame().Position
                    end
                    v45.position = v46
                    v45.volumeMultiplier = v42 and 1 or 1.4
                    v44:playSound(v43, v45)
                end
                local u47 = u10("Part", {
                    ["Size"] = Vector3.new(1, 1, 1),
                    ["Transparency"] = 1,
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["CFrame"] = p39.sourceEntity:GetPrimaryPartCFrame(),
                    ["Parent"] = u20.CurrentCamera
                })
                u5:setQueryIgnored(u47, true)
                local u48 = u16:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarDamage"):Clone()
                u48.Parent = u47
                local u49 = u9.new()
                u49:GiveTask(function() --[[ Line: 103 ]]
                    --[[
                    Upvalues:
                        [1] = u48
                        [2] = u1
                        [3] = u47
                    --]]
                    u48.Enabled = false
                    u1.Promise.delay(3):andThen(function() --[[ Line: 106 ]]
                        --[[
                        Upvalues:
                            [1] = u47
                        --]]
                        u47:Destroy()
                    end)
                end)
                local u50 = tick()
                u49:GiveTask(u17.Heartbeat:Connect(function(_) --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                        [2] = u41
                        [3] = u40
                        [4] = u47
                        [5] = u49
                    --]]
                    local v51 = (tick() - u50) / 0.8
                    local v52 = math.min(1, v51)
                    u47.CFrame = u41.WorldCFrame:Lerp(u40.WorldCFrame, v52)
                    if v52 == 1 then
                        u49:DoCleaning()
                    end
                end))
                local u53 = u10("Beam", {
                    ["TextureSpeed"] = 10,
                    ["Width0"] = 0,
                    ["Width1"] = 0,
                    ["FaceCamera"] = true,
                    ["Attachment0"] = u41,
                    ["Attachment1"] = u40,
                    ["Color"] = u48.Color,
                    ["Parent"] = u20.CurrentCamera
                })
                u18:Create(u53, TweenInfo.new(0.2), {
                    ["Width0"] = 0.35,
                    ["Width1"] = 0.35
                }):Play()
                u1.Promise.defer(function() --[[ Line: 136 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u53
                        [3] = u14
                    --]]
                    task.wait(0.2)
                    u18:Create(u53, TweenInfo.new(0.4), {
                        ["Width0"] = 0,
                        ["Width1"] = 0
                    }):Play()
                    u14:AddItem(u53, 1)
                end)
            end
        end)
    end)
    u4("GlitchGuitarPlaying", function(u54) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
            [3] = u31
            [4] = u8
            [5] = u27
            [6] = u32
            [7] = u7
            [8] = u18
            [9] = u1
            [10] = u13
        --]]
        local u55 = u9.new()
        local v56 = u54 == u15.LocalPlayer.Character
        local v57 = u31.GUITAR_LOOP_ROCKSTAR
        if u8.Controllers.KitSkinController:getKitSkin(u54) == u27.MELODY_ROCKSTAR then
            v57 = u31.GUITAR_LOOP_ROCKSTAR
        end
        if u32.isLobbyServer() and (u15.LocalPlayer:GetAttribute("GlitchGuitarPlayingNearSpawn") and not v56) then
            return nil
        end
        local v58 = u7
        local v59 = {}
        local v60
        if v56 then
            v60 = nil
        else
            v60 = u54:GetPrimaryPartCFrame().Position
        end
        v59.position = v60
        local v61
        if v56 then
            v61 = nil
        else
            v61 = u54.PrimaryPart
        end
        v59.parent = v61
        v59.volumeMultiplier = v56 and 1 or 1.4
        local u62 = v58:playModifiableSound(v57, v59)
        if u62 then
            u62.TimePosition = tick() % u62.TimeLength
            u62.Looped = true
            u55:GiveTask(function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u62
                    [3] = u1
                --]]
                u18:Create(u62, TweenInfo.new(0.4), {
                    ["Volume"] = 0
                }):Play()
                u1.Promise.delay(0.4):andThen(function() --[[ Line: 177 ]]
                    --[[
                    Upvalues:
                        [1] = u62
                    --]]
                    u62:Stop()
                end)
            end)
        end
        u55:GiveTask(u13:GetInstanceRemovedSignal("GlitchGuitarPlaying"):Connect(function(p63) --[[ Line: 183 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
            --]]
            if p63 == u54 then
                u55:DoCleaning()
            end
        end))
    end)
end
function u33.isRelevantItem(_, p64) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    return p64.itemType == u29.GLITCH_GUITAR
end
function u33.onEnable(u65, _) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u33
        [3] = u2
        [4] = u19
        [5] = u11
        [6] = u6
        [7] = u28
        [8] = u22
        [9] = u15
    --]]
    local function u68() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u1
            [3] = u33
        --]]
        if not u65.playing then
            u65:startPlaying()
        end
        local u66 = tick()
        u65.lastClickTime = u66
        local u67 = u1.Promise.delay(u33.CLICK_PLAY_TIME):andThen(function() --[[ Line: 201 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u66
            --]]
            if u65.lastClickTime == u66 then
                u65:stopPlaying()
            end
        end)
        u65.playingMaid:GiveTask(function() --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            u67:cancel()
        end)
        if tick() - u65.lastUseTime > u33.COOLDOWN then
            u65:useAbility()
        end
    end
    local v69 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "glitch-guitar-click",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 218 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            u68()
        end
    })
    u65.maid:GiveTask(v69)
    if u19.TouchEnabled then
        u65:setupYield(function() --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u6
                [3] = u28
                [4] = u22
                [5] = u68
                [6] = u15
            --]]
            local u70 = u11.mount(u11.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u11.createElement(u6, {
                    ["Image"] = u28.GUITAR_MOBILE,
                    ["Position"] = u22:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 231 ]]
                        --[[
                        Upvalues:
                            [1] = u68
                        --]]
                        u68()
                    end
                }) }), u15.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 236 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u70
                --]]
                u11.unmount(u70)
            end
        end)
    end
end
function u33.onDisable(p71) --[[ Line: 242 ]]
    p71:stopPlaying()
    p71.maid:DoCleaning()
end
function u33.startPlaying(p72) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u15
        [3] = u23
    --]]
    p72.playing = true
    local u73 = u24:playAnimation(u15.LocalPlayer, u23.GUITAR_PLAY, {
        ["looped"] = true
    })
    if u73 then
        p72.playingMaid:GiveTask(function() --[[ Line: 252 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73:Stop()
        end)
    end
end
function u33.stopPlaying(p74) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    p74.playing = false
    p74.playingMaid:DoCleaning()
    task.spawn(function() --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.Client:Get("StopPlayingGlitchGuitar"):SendToServer()
    end)
end
function u33.useAbility(p75) --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u26
        [3] = u25
        [4] = u30
    --]]
    p75.lastUseTime = tick()
    if u15.LocalPlayer.Character then
        local v76 = u15.LocalPlayer.Character:GetPrimaryPartCFrame().Position
        local v77 = u26:getEntity(u15.LocalPlayer)
        local v78 = 0
        local v79 = {}
        for v80, v81 in u26:getAliveEntityInstances() do
            local _ = v80 - 1
            if v81 ~= u15.LocalPlayer.Character == true then
                v78 = v78 + 1
                v79[v78] = v81
            end
        end
        local v82 = 0
        local v83 = {}
        for v84, v85 in v79 do
            local _ = v84 - 1
            local v86 = u26:getEntity(v85)
            if v86 ~= nil then
                v82 = v82 + 1
                v83[v82] = v86
            end
        end
        local v87 = 0
        local v88 = {}
        for v89, v90 in v83 do
            local _ = v89 - 1
            local v91 = v90:getInstance().PrimaryPart
            if v91 then
                v91 = (v90:getInstance():GetPrimaryPartCFrame().Position - v76).Magnitude <= u25.GUITAR_RANGE
            end
            if v91 == true then
                v87 = v87 + 1
                v88[v87] = v90
            end
        end
        local v92 = 0
        local v93 = {}
        for v94, v95 in v88 do
            local _ = v94 - 1
            local v96
            if v77 == nil then
                v96 = v77
            else
                v96 = v77:canAttack(v95)
            end
            if v96 == true then
                v92 = v92 + 1
                v93[v92] = v95
            end
        end
        local v97 = 0
        local v98 = {}
        for v99, v100 in v93 do
            local _ = v99 - 1
            if v100:isAlive() == true then
                v97 = v97 + 1
                v98[v97] = v100
            end
        end
        table.sort(v98, function(p101, p102) --[[ Line: 340 ]]
            return p101:getHealth() > p102:getHealth()
        end)
        local v103 = false
        local v104 = 0
        local v105 = {}
        while true do
            if true then
                if v103 then
                    v104 = v104 + 1
                else
                    v103 = true
                end
            end
            if v104 >= 3 or v104 >= #v98 then
                break
            end
            local v106 = v98[v104 + 1]:getInstance()
            table.insert(v105, v106)
        end
        u30.Client:Get("PlayGlitchGuitar"):SendToServer({
            ["targets"] = v105
        })
    end
end
u33.CLICK_PLAY_TIME = 3
u33.COOLDOWN = 2
u8.CreateController(u33.new())
return nil