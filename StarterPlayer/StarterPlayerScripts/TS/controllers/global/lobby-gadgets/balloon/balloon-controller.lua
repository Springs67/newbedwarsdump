local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ActionButton
local v6 = v4.ConstantManager
local u7 = v4.DeviceUtil
local u8 = v4.GameQueryUtil
local u9 = v4.GameTheme
local u10 = v4.GamepadAction
local u11 = v4.MobileButton
local u12 = v4.RandomUtil
local u13 = v4.SoundManager
local u14 = v4.WatchCharacter
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v20 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u21 = v20.CollectionService
local u22 = v20.Players
local u23 = v20.ReplicatedStorage
local u24 = v20.RunService
local u25 = v20.TweenService
local u26 = v20.Workspace
local u27 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u28 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u39 = v6.registerConstants(script, {
    ["DragConstant"] = 4.5
})
local u40 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "BalloonController"
    end,
    ["__index"] = u27
})
u40.__index = u40
function u40.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    local v41 = u40
    local v42 = setmetatable({}, v41)
    return v42:constructor(...) or v42
end
function u40.constructor(p43, ...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u17
        [3] = u18
        [4] = u26
    --]]
    u27.constructor(p43, ...)
    p43.Name = "BalloonController"
    p43.maid = u17.new()
    p43.clientBalloonHookFolder = u18("Folder", {
        ["Name"] = "ClientBalloonHooks",
        ["Parent"] = u26
    })
    p43.balloonPhysicsEnabled = false
    p43.balloonPhysicsMaid = u17.new()
    p43.lastTntDrop = 0
    p43.clientBalloonAttachment = {}
    p43.playerBalloonHeartbeatMap = {}
end
function u40.KnitStart(u44) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u26
        [3] = u24
        [4] = u3
        [5] = u2
        [6] = u22
        [7] = u33
        [8] = u35
        [9] = u36
        [10] = u37
        [11] = u31
        [12] = u12
        [13] = u13
        [14] = u25
        [15] = u1
        [16] = u14
        [17] = u21
    --]]
    u27.KnitStart(u44)
    u44.balloonRootsFolder = u26:WaitForChild("BalloonRoots")
    u24.Heartbeat:Connect(function(_) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u44
        --]]
        for _, v45 in u3.keys(u44.clientBalloonAttachment) do
            local v46 = u44.clientBalloonAttachment[v45]
            if v46 then
                if v45.Parent then
                    v46.CFrame = v45.Balloon.CFrame
                else
                    v46:Destroy()
                    u44.clientBalloonAttachment[v45] = nil
                end
            end
        end
    end)
    local v50 = {
        ["action"] = "Attack",
        ["actionId"] = "drop-tnt",
        ["priority"] = 4000,
        ["boundFunction"] = function(_, p47, _) --[[ Name: boundFunction, Line 93 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u33
                [3] = u35
                [4] = u44
            --]]
            if p47 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass
            end
            local v48 = u22.LocalPlayer.Character
            if v48 ~= nil then
                v48 = v48:GetAttribute("InflatedBalloons")
            end
            if (v48 == nil and 0 or v48) == 0 then
                return Enum.ContextActionResult.Pass
            end
            local v49 = u33.getInventory(u22.LocalPlayer).hand
            if v49 ~= nil then
                v49 = v49.itemType
            end
            if v49 ~= u35.TNT then
                return Enum.ContextActionResult.Pass
            end
            u44:dropTNT()
            return Enum.ContextActionResult.Sink
        end
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v50)
    u36.Client:WaitFor("BalloonPopped"):andThen(function(p51) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u37
            [3] = u31
            [4] = u12
            [5] = u13
            [6] = u25
            [7] = u1
            [8] = u44
        --]]
        p51:Connect(function(u52) --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u37
                [3] = u31
                [4] = u12
                [5] = u13
                [6] = u25
                [7] = u1
                [8] = u44
            --]]
            u52.Balloon.PopEffect:Emit(20)
            local v53
            if u52:GetAttribute("BalloonOwner") == u22.LocalPlayer.UserId then
                v53 = nil
            else
                v53 = u52.Balloon.Position
            end
            local v54 = u37.BALLOON_POP
            if u31.BALLOON_POP_SOUNDS and #u31.BALLOON_POP_SOUNDS > 0 then
                local v55 = u12.fromList
                local v56 = u31.BALLOON_POP_SOUNDS
                v54 = v55(unpack(v56))
            end
            u13:playSound(v54, {
                ["position"] = v53
            })
            u25:Create(u52.Balloon, TweenInfo.new(0.3), {
                ["Size"] = Vector3.new(0, 0, 0)
            }):Play()
            u1.Promise.delay(0.1):andThen(function() --[[ Line: 139 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u52
                --]]
                u25:Create(u52.Balloon, TweenInfo.new(0.2), {
                    ["Transparency"] = 1
                }):Play()
            end)
            u25:Create(u52.RopeConstraint, TweenInfo.new(0.3), {
                ["Thickness"] = 0
            }):Play()
            local v57 = u22:GetPlayerByUserId(u52:GetAttribute("BalloonOwner"))
            local v58
            if v57 == nil then
                v58 = v57
            else
                v58 = v57.Character
                if v58 ~= nil then
                    v58 = v58:GetAttribute("InflatedBalloons")
                end
            end
            local v59 = v58 == 1
            if v59 then
                v59 = u52:GetAttribute("DeflatedBalloon")
            end
            if v59 ~= 0 and (v59 == v59 and (v59 ~= "" and v59)) then
                local v60 = u44.playerBalloonHeartbeatMap[v57]
                if v60 ~= nil then
                    v60:Disconnect()
                end
                u44.playerBalloonHeartbeatMap[v57] = nil
            end
        end)
    end)
    u14(function(u61, u62, u63) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u44
            [3] = u22
            [4] = u13
            [5] = u37
        --]]
        u63:GiveTask(u21:GetInstanceAddedSignal("InflatedBalloon:" .. u61.Name):Connect(function(p64) --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u61
                [3] = u63
                [4] = u62
                [5] = u22
                [6] = u13
                [7] = u37
            --]]
            if not u44.playerBalloonHeartbeatMap[u61] then
                u63:GiveTask(u44:enableBalloonAttachment(u61, u62))
            end
            u44:hookBalloon(u61, u44:getBalloonAttachment(u61), p64)
            local v65
            if p64:GetAttribute("BalloonOwner") == u22.LocalPlayer.UserId then
                v65 = nil
            else
                v65 = p64.Balloon.Position
            end
            u13:playSound(u37.BALLOON_INFLATE, {
                ["position"] = v65
            })
        end))
        if u61 == u22.LocalPlayer then
            u62:GetAttributeChangedSignal("InflatedBalloons"):Connect(function() --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u44
                --]]
                local v66 = u62:GetAttribute("InflatedBalloons")
                if v66 > 0 and not u44.balloonPhysicsEnabled then
                    u44:enableBalloonPhysics(u62)
                elseif v66 == 0 and u44.balloonPhysicsEnabled then
                    u44.balloonPhysicsMaid:DoCleaning()
                end
            end)
            u63:GiveTask(function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                u44.balloonPhysicsMaid:DoCleaning()
            end)
        end
    end)
end
function u40.enableBalloonAttachment(u67, u68, u69) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u24
    --]]
    local v70 = u17.new()
    local u71 = u67.balloonRootsFolder:WaitForChild("BalloonRoot:" .. u68.Name)
    u67:getBalloonAttachment(u68)
    u8:setQueryIgnored(u71, true)
    local v72 = u67.playerBalloonHeartbeatMap[u68]
    if v72 then
        v72:Disconnect()
    end
    local v73
    if u69 == nil then
        v73 = u69
    else
        v73 = u69:FindFirstChild("UpperTorso")
        if v73 ~= nil then
            v73 = v73:FindFirstChild("BodyBackAttachment")
        end
    end
    local u74 = v73
    local v76 = u24.Heartbeat:Connect(function(_) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u74
            [2] = u69
            [3] = u71
        --]]
        if not u74 then
            local v75 = u69
            if v75 ~= nil then
                v75 = v75:FindFirstChild("UpperTorso")
                if v75 ~= nil then
                    v75 = v75:FindFirstChild("BodyBackAttachment")
                end
            end
            u74 = v75
        end
        if u74 then
            u71.CFrame = u74.WorldCFrame
        end
    end)
    u67.playerBalloonHeartbeatMap[u68] = v76
    if v70 ~= nil then
        v70:GiveTask(function() --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u68
            --]]
            local v77 = u67.playerBalloonHeartbeatMap[u68]
            if v77 then
                v77:Disconnect()
                u67.playerBalloonHeartbeatMap[u68] = nil
            end
        end)
    end
    return v70
end
function u40.getBalloonAttachment(p78, p79) --[[ Line: 265 ]]
    return p78.balloonRootsFolder:WaitForChild("BalloonRoot:" .. p79.Name):WaitForChild("Attachment")
end
function u40.hookBalloon(p80, p81, p82, p83) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u18
        [3] = u8
    --]]
    local v84 = p83:WaitForChild("RopeConstraint")
    v84.Attachment0 = p82
    if p81 == u22.LocalPlayer then
        v84.Attachment1 = p83.Balloon.Attachment
    else
        local v85 = u18("Part", {
            ["CanCollide"] = false,
            ["Anchored"] = true,
            ["Transparency"] = 1,
            ["Parent"] = p80.clientBalloonHookFolder
        })
        local v86 = u18("Attachment", {
            ["Parent"] = v85
        })
        u8:setQueryIgnored(v85, true)
        p80.clientBalloonAttachment[p83] = v85
        v84.Attachment1 = v86
    end
end
function u40.dropTNT(p87) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    if tick() < p87.lastTntDrop + 0.25 then
        return false
    end
    p87.lastTntDrop = tick()
    u36.Client:Get("DropTnt"):SendToServer()
    return true
end
function u40.enableBalloonPhysics(u88, u89) --[[ Line: 299 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u15
        [3] = u24
        [4] = u39
        [5] = u26
        [6] = u18
        [7] = u22
        [8] = u7
        [9] = u19
        [10] = u32
        [11] = u28
        [12] = u11
        [13] = u2
        [14] = u5
        [15] = u10
        [16] = u9
    --]]
    u88.balloonPhysicsMaid:DoCleaning()
    local v90 = u89:FindFirstChild("Humanoid")
    u88.balloonPhysicsEnabled = true
    u88.balloonPhysicsMaid:GiveTask(function() --[[ Line: 303 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        u88.balloonPhysicsEnabled = false
    end)
    u88.balloonPhysicsMaid:GiveTask(function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u89
        --]]
        if u89.Parent then
            local v91 = u89.PrimaryPart
            if v91 ~= nil then
                v91 = v91:FindFirstChild("BalloonForce")
            end
            if v91 then
                v91:Destroy()
            end
        end
    end)
    local u92 = u17.new()
    u88.balloonPhysicsMaid:GiveTask(v90.StateChanged:Connect(function(_, p93) --[[ Line: 326 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u92
        --]]
        if p93 == Enum.HumanoidStateType.Freefall then
            u92:GiveTask((u15.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["constantSpeedMultiplier"] = 0.65
            })))
        else
            u92:DoCleaning()
        end
    end))
    if v90:GetState() == Enum.HumanoidStateType.Freefall then
        u92:GiveTask((u15.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["constantSpeedMultiplier"] = 0.65
        })))
    end
    u88.balloonPhysicsMaid:GiveTask(function() --[[ Line: 336 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        u92:DoCleaning()
    end)
    local u106 = u24.Stepped:Connect(function(_) --[[ Line: 339 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u39
            [3] = u26
            [4] = u18
        --]]
        local v94 = u89
        if v94 ~= nil then
            v94 = v94.PrimaryPart
        end
        if v94 then
            local v95 = u89:GetAttribute("InflatedBalloons")
            local v96 = v95 >= 4 and 1.2 or (v95 >= 3 and 1.1 or (v95 >= 2 and 0.975 or 0.85))
            local v97 = (u89.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude
            local v98 = math.pow(v97, 2) / 2 * u39.DragConstant
            local v99 = u89.PrimaryPart.AssemblyLinearVelocity.Y
            local v100 = v98 * math.sign(v99) / 13
            local v101 = u89.PrimaryPart.AssemblyMass
            local v102 = (u26.Gravity * v96 - v100) * v101
            local v103 = math.max(0, v102)
            local v104 = Vector3.new(0, v103, 0)
            local v105 = u89.PrimaryPart:FindFirstChild("BalloonForce")
            if v105 then
                v105.Force = v104
            else
                u18("BodyForce", {
                    ["Name"] = "BalloonForce",
                    ["Force"] = v104,
                    ["Parent"] = u89.PrimaryPart
                })
            end
        else
            return nil
        end
    end)
    u88.balloonPhysicsMaid:GiveTask(function() --[[ Line: 375 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        u106:Disconnect()
    end)
    local v107 = u22.LocalPlayer:GetAttribute("BalloonPopDisabled")
    if v107 == 0 or (v107 ~= v107 or (v107 == "" or not v107)) then
        if u7.isMobileControls() then
            local v108 = u19
            local v109 = {}
            local v110 = #v109
            local v111 = {
                ["Image"] = u32.DOWN_MOBILE,
                ["Position"] = u28:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
                ["OnClick"] = function() --[[ Line: 394 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                    --]]
                    u88:deflateBalloon()
                end
            }
            v109[v110 + 1] = u19.createElement(u11, v111)
            local v112 = {
                ["Image"] = u32.EXPLODE_MOBILE,
                ["Position"] = u28:getActionMobileButtonPosition() - UDim2.fromScale(0.04, u7.isSmallScreen() and 0.14 or 0.11),
                ["OnClick"] = function() --[[ Line: 404 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                    --]]
                    u88:dropTNT()
                end
            }
            v109[v110 + 2] = u19.createElement(u11, v112)
            local u113 = v108.mount(u19.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, v109), u22.LocalPlayer:WaitForChild("PlayerGui"))
            u88.balloonPhysicsMaid:GiveTask(function() --[[ Line: 409 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u113
                --]]
                u19.unmount(u113)
            end)
            return
        end
        local v114 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u19.createElement(u5, {
            ["actionName"] = "deflate-balloon",
            ["text"] = "Pop Balloon",
            ["interactionKey"] = Enum.KeyCode.X,
            ["gamepadInteractionKey"] = u10.CloseMenu,
            ["onActivated"] = function() --[[ Name: onActivated, Line 417 ]]
                --[[
                Upvalues:
                    [1] = u88
                --]]
                u88:deflateBalloon()
            end,
            ["LayoutOrder"] = u9.abilityActionBarPriority
        }))
        u88.balloonPhysicsMaid:GiveTask(v114)
    end
end
function u40.inflateBalloon(_) --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u30
        [3] = u15
        [4] = u29
        [5] = u36
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u30.BALLOON) then
        return nil
    end
    u15.Controllers.ViewmodelController:playAnimation(u29.FP_USE_ITEM)
    u36.Client:Get("InflateBalloon"):SendToServer()
end
function u40.deflateBalloon(_) --[[ Line: 434 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u29
        [3] = u36
    --]]
    u15.Controllers.ViewmodelController:playAnimation(u29.FP_USE_ITEM)
    u36.Client:Get("DeflateBalloon"):SendToServer()
end
function u40.isRelevantItem(_, p115) --[[ Line: 438 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v116 = u34(p115.itemType).balloon
    if v116 == nil then
        v116 = false
    end
    return v116
end
function u40.onEnable(u117, _) --[[ Line: 446 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u19
        [4] = u11
        [5] = u32
        [6] = u28
        [7] = u22
    --]]
    local v119 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "inflate-balloon",
        ["boundFunction"] = function(_, p118, _) --[[ Name: boundFunction, Line 452 ]]
            --[[
            Upvalues:
                [1] = u117
            --]]
            if p118 == Enum.UserInputState.Begin then
                u117:inflateBalloon()
            end
        end
    })
    u117.maid:GiveTask(v119)
    if u7.isMobileControls() then
        u117:setupYield(function() --[[ Line: 460 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u11
                [3] = u32
                [4] = u28
                [5] = u117
                [6] = u22
            --]]
            local u120 = u19.mount(u19.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u19.createElement(u11, {
                    ["Image"] = u32.UP_MOBILE,
                    ["Position"] = u28:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 467 ]]
                        --[[
                        Upvalues:
                            [1] = u117
                        --]]
                        u117:inflateBalloon()
                    end
                }) }), u22.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 472 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u120
                --]]
                u19.unmount(u120)
            end
        end)
    end
end
function u40.onDisable(p121) --[[ Line: 478 ]]
    p121.maid:DoCleaning()
end
function u40.inflateBalloonFromCharacter(_, p122) --[[ Line: 481 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u38
        [4] = u31
        [5] = u12
        [6] = u23
        [7] = u26
        [8] = u16
    --]]
    local v123 = u17.new()
    if not p122 then
        return v123
    end
    local v124 = u18("Part", {
        ["Name"] = "BalloonRoot",
        ["Size"] = Vector3.new(0.2, 0.2, 0.2),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Position"] = p122:GetPivot().Position,
        ["Parent"] = p122,
        ["Children"] = { u18("Attachment", {
                ["Name"] = "Attachment"
            }) }
    })
    v123:GiveTask(v124)
    local v125 = "InflatedBalloon"
    local v126
    if u38.isLobbyServer() then
        v126 = u31.BALLOON_SKIN_MODELS_LOBBY
    else
        v126 = u31.BALLOON_SKIN_MODELS
    end
    if v126 and #v126 > 0 then
        v125 = u12.fromList(unpack(v126))
    end
    local v127 = u23:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v125):Clone()
    v127.Balloon:SetAttribute("IgnoreProjectileCollision", true)
    v127.Balloon.CFrame = p122:GetPivot()
    v127.Parent = u26
    local v128 = v127:WaitForChild("RopeConstraint")
    v128.Attachment0 = v124:FindFirstChild("Attachment")
    v128.Attachment1 = v127.Balloon.Attachment
    local v129 = u18
    local v130 = {
        ["Name"] = "BodyForce"
    }
    local v131 = u26.Gravity * v127.Balloon.Mass * 1.3
    v130.Force = Vector3.new(0, v131, 0)
    v130.Parent = v127.Balloon
    v129("BodyForce", v130)
    if v125 == "InflatedBalloon" then
        u18("BodyGyro", {
            ["D"] = 0,
            ["CFrame"] = v127.Balloon.CFrame,
            ["Parent"] = v127.Balloon
        })
    else
        u18("BodyGyro", {
            ["D"] = 1000,
            ["P"] = 10,
            ["CFrame"] = v127.Balloon.CFrame,
            ["Parent"] = v127.Balloon
        })
    end
    local v132 = Color3.fromRGB(216, 50, 53)
    local v133 = u16.keys(u31.BALLOON_SKIN_MODELS_COLORS)
    if table.find(v133, v125) ~= nil then
        v132 = u31.BALLOON_SKIN_MODELS_COLORS[v125]
    end
    v127.Balloon.Color = v132
    v127.Balloon.PopEffect.Color = ColorSequence.new(v132)
    v123:GiveTask(v127)
    return v123
end
u15.CreateController(u40.new())
return {
    ["Constants"] = u39
}