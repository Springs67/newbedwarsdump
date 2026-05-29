local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u9 = v8.GroupMotor
local u10 = v8.SingleMotor
local u11 = v8.Spring
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.CollectionService
local u18 = v16.Players
local u19 = v16.ReplicatedStorage
local u20 = v16.RunService
local u21 = v16.UserInputService
local u22 = v16.Workspace
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "model-skybox", "model-skybox").ModelBillboard
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "types", "maze").MazeRoleName
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "simple-state-object").SimpleStateObject
local u28 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u29 = v1.import(script, script.Parent, "illuminator-table-ui").IlluminatorTableUi
local u30 = Color3.fromRGB(153, 255, 128)
Color3.fromRGB(173, 71, 41)
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "IlluminatorRoleController"
    end,
    ["__index"] = u28
})
u31.__index = u31
function u31.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u25
        [3] = u13
        [4] = u27
    --]]
    u28.constructor(p34, u25.HALLOWEEN_MAZE)
    p34.Name = "IlluminatorRoleController"
    p34.maid = u13.new()
    p34.proximityPrompts = {}
    p34.bigFlashlightActivated = false
    p34.enabledEnemies = {}
    p34.stateObject = u27.new({
        ["lightOpen"] = nil
    }, true)
    p34.lastSentFlashlightPosition = -1
end
function u31.KnitStart(p35) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.KnitStart(p35)
end
function u31.onSceneLoadingScreenStart(_) --[[ Line: 63 ]] end
function u31.onSceneStart(u36) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
        [3] = u9
        [4] = u24
        [5] = u11
        [6] = u10
        [7] = u2
        [8] = u5
        [9] = u18
        [10] = u12
        [11] = u4
        [12] = u26
        [13] = u15
        [14] = u14
        [15] = u21
        [16] = u20
        [17] = u30
        [18] = u17
    --]]
    u36.bigFlashlight = u19.Assets.Effects.BigFlashlight:Clone()
    u36.bigFlashlight.Parent = u22
    if u36.bigFlashlight.PrimaryPart then
        u36.bigFlashlight.PrimaryPart.CanQuery = false
    end
    u36.maid:GiveTask(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local v37 = u36.bigFlashlight
        if v37 ~= nil then
            v37:Destroy()
        end
        u36.bigFlashlight = nil
    end)
    u36.bigFlashlightPosition = Vector3.new()
    u36.bigFlashlightMotor = u9.new({
        ["x"] = 0,
        ["y"] = 0,
        ["z"] = 0
    })
    local u43 = u36.bigFlashlightMotor:onStep(function(p38) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local v39 = p38.x
        local v40 = p38.y
        local v41 = p38.z
        local v42 = u36.bigFlashlight
        if v42 ~= nil then
            v42:PivotTo(CFrame.new(v39, v40 + 47.5, v41))
        end
    end)
    u36.maid:GiveTask(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local v44 = u36.bigFlashlightMotor
        if v44 ~= nil then
            v44:destroy()
        end
        u36.bigFlashlightMotor = nil
    end)
    u36.maid:GiveTask(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:disconnect()
    end)
    local u45 = {
        ["dampingRatio"] = 0.75,
        ["frequency"] = 2
    }
    u24.Client:OnEvent("ReplicateFlashlightPositionToClient", function(p46) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u11
            [3] = u45
        --]]
        u36.bigFlashlightPosition = p46
        local v47 = u36.bigFlashlightMotor
        if v47 ~= nil then
            v47:setGoal({
                ["x"] = u11.new(p46.X, u45),
                ["y"] = u11.new(p46.Y, u45),
                ["z"] = u11.new(p46.Z, u45)
            })
        end
    end)
    u24.Client:WaitFor("SendFlashlightPositionToServer"):andThen(function(p48) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36.sendFlashlightPositionToServer = p48
    end)
    u36.bigFlashlightActivatedMotor = u10.new(0)
    local u50 = u36.bigFlashlightActivatedMotor:onStep(function(p49) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        if u36.bigFlashlight then
            u36:animateFlashlight(p49, u36.bigFlashlight, 25)
        end
    end)
    u36.maid:GiveTask(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u50
        --]]
        local v51 = u36.bigFlashlightActivatedMotor
        if v51 ~= nil then
            v51:destroy()
        end
        u36.bigFlashlightActivatedMotor = nil
        u50:disconnect()
    end)
    u24.Client:OnEvent("FlashlightActivated", function(p52) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u11
        --]]
        local v53 = u36.bigFlashlightActivatedMotor
        if v53 ~= nil then
            v53:setGoal(u11.new(p52 and 1 or 0, {
                ["dampingRatio"] = 0.75,
                ["frequency"] = 4
            }))
        end
        u36.bigFlashlightActivated = p52
    end)
    u36.maid:GiveTask(u2("MazeInteractionPart", function(p54) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u36
            [3] = u18
            [4] = u12
            [5] = u4
        --]]
        if p54:IsA("BasePart") then
            local v55 = u5.Controllers.ProximityPromptController:createProximityPrompt({
                ["ActionText"] = "Maze",
                ["ObjectText"] = "Open",
                ["HoldDuration"] = 1,
                ["Enabled"] = false,
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 8,
                ["Parent"] = p54
            })
            local v56 = u36.proximityPrompts
            table.insert(v56, v55)
            v55.Triggered:Connect(function(p57) --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u12
                    [3] = u4
                    [4] = u36
                --]]
                if p57 == u18.LocalPlayer then
                    u12.Debug("Proximity prompt triggered")
                    local v58 = u4.Controllers.HalloweenMazeSceneController.smallMaze
                    if v58 ~= nil then
                        local v59 = v58:FindFirstChildWhichIsA("Highlight")
                        if v59 ~= nil then
                            v59:Destroy()
                        end
                    end
                    u36:openLightMap()
                end
            end)
        end
    end))
    task.delay(1, function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u2
            [3] = u5
            [4] = u18
            [5] = u26
            [6] = u19
            [7] = u15
            [8] = u22
        --]]
        u36.maid:GiveTask(u2("ActiveMazeBoss", function(p60) --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u18
                [3] = u26
                [4] = u19
                [5] = u15
                [6] = u22
            --]]
            local v61 = p60:FindFirstAncestorOfClass("Model")
            if v61 and (v61 == u5.Controllers.HalloweenMazeSceneController.smallMaze and p60:IsA("BasePart")) then
                p60.Transparency = 1
                if u18.LocalPlayer:GetAttribute("MazeRole") == u26.ILLUMINATOR then
                    local v62 = u19.Assets.Misc.SkullDeathIndicator:Clone()
                    u15(v62, 0.4)
                    local v63 = p60.CFrame
                    local v64 = CFrame.new(0, 0.3, 0)
                    local v65 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0)
                    v62:PivotTo(v63 * v64 * v65)
                    v62.Parent = u22
                end
            end
        end))
    end)
    if u18.LocalPlayer:GetAttribute("MazeRole") == u26.ILLUMINATOR then
        for _, v66 in u36.proximityPrompts do
            v66.Enabled = true
        end
        u36.maid:GiveTask(function() --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            for _, v67 in u36.proximityPrompts do
                v67.Enabled = false
            end
        end)
    end
    u36.maid:GiveTask(u5.Controllers.HalloweenMazeSceneController.roleChanged:Connect(function(p68) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
            [3] = u36
        --]]
        u12.Debug("Role changed {role}", p68)
        if p68 == u26.ILLUMINATOR then
            for _, v69 in u36.proximityPrompts do
                v69.Enabled = true
            end
            u36.maid:GiveTask(function() --[[ Line: 208 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                for _, v70 in u36.proximityPrompts do
                    v70.Enabled = false
                end
            end)
        end
    end))
    u36.maid:GiveTask(u36.stateObject.changed:Connect(function(p71, p72) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u12
            [3] = u14
            [4] = u22
        --]]
        if p71.lightOpen ~= p72.lightOpen then
            for _, v73 in u36.proximityPrompts do
                v73.Enabled = p71.lightOpen == nil
            end
            if p71.lightOpen == nil and p72.lightOpen ~= nil then
                u12.Debug("destroying flashlight")
                p72.lightOpen.flashlight:Destroy()
                u14.unmount(p72.lightOpen.tree)
                u22.CurrentCamera.CameraType = Enum.CameraType.Custom
                for _, v74 in p72.lightOpen.enemyBillboards do
                    v74:destroy()
                end
                p72.lightOpen.lightMotor:destroy()
            end
        end
    end))
    local u75 = Vector3.new()
    u36.maid:GiveTask(u21.TouchMoved:Connect(function(p76, p77) --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u75
        --]]
        if not p77 then
            u75 = p76.Position
        end
    end))
    u36.maid:GiveTask(u20.Heartbeat:Connect(function() --[[ Line: 238 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u30
            [3] = u17
            [4] = u22
        --]]
        for _, v78 in u36.enabledEnemies do
            v78:SetAttribute("Visible", false)
            local v79 = u36.stateObject:getState().lightOpen
            if v79 then
                local v80 = v79.enemyBillboards[v78]
                if v80 then
                    v80.billboardGui.AlwaysOnTop = false
                    v80.viewportFrame.Ambient = u30
                    v80.viewportFrame.ImageTransparency = 0.5
                end
            end
        end
        table.clear(u36.enabledEnemies)
        if u36.bigFlashlightPosition and u36.bigFlashlightActivated then
            local v81 = OverlapParams.new()
            local v82 = 0
            local v83 = {}
            for v84, v85 in u17:GetTagged("inventory-entity") do
                local _ = v84 - 1
                local v86
                if v85:IsA("Model") then
                    v86 = v85.PrimaryPart
                else
                    v86 = nil
                end
                if v86 ~= nil then
                    v82 = v82 + 1
                    v83[v82] = v86
                end
            end
            v81.FilterDescendantsInstances = v83
            v81.FilterType = Enum.RaycastFilterType.Whitelist
            for _, v87 in u22:GetPartBoundsInRadius(u36.bigFlashlightPosition + Vector3.new(0, 47.5, 0), 25, v81) do
                if v87:IsA("BasePart") then
                    local v88 = v87.Parent
                    local v89
                    if v88 == nil then
                        v89 = v88
                    else
                        v89 = v88:IsA("Model")
                    end
                    if v89 then
                        v89 = u17:HasTag(v88, "entity")
                    end
                    if v89 then
                        v88:SetAttribute("Visible", true)
                        local v90 = u36.enabledEnemies
                        table.insert(v90, v88)
                        local v91 = u36.stateObject:getState().lightOpen
                        if v91 then
                            local v92 = v91.enemyBillboards[v88]
                            if v92 then
                                v92.billboardGui.AlwaysOnTop = true
                                v92.viewportFrame.Ambient = Color3.fromRGB(255, 255, 204)
                                v92.viewportFrame.ImageTransparency = 0
                            end
                        end
                    end
                end
            end
        end
    end))
    u36.maid:GiveTask(function() --[[ Line: 307 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
        --]]
        u22.CurrentCamera.CameraType = Enum.CameraType.Custom
        u22.CurrentCamera.FieldOfView = u5.Controllers.FovController:getBaseFOV()
    end)
    u36.maid:GiveTask(u20.Heartbeat:Connect(function() --[[ Line: 311 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u11
            [3] = u22
            [4] = u21
            [5] = u75
        --]]
        local v93 = u36.stateObject:getState().lightOpen
        if v93 then
            v93.lightMotor:setGoal(u11.new(v93.flashlightActivated and 1 or 0, {
                ["dampingRatio"] = 0.75,
                ["frequency"] = 4
            }))
            local v94 = u22.CurrentCamera
            local v95 = CFrame.lookAt
            local v96 = v93.motor:getValue().x
            local v97 = v93.motor:getValue().y + 2.5
            local v98 = v93.motor:getValue().z + 1
            local v99 = Vector3.new(v96, v97, v98)
            local v100 = v93.motor:getValue().x
            local v101 = v93.motor:getValue().y
            local v102 = v93.motor:getValue().z
            v94.CFrame = v95(v99, (Vector3.new(v100, v101, v102)))
            local v103 = u21:GetMouseLocation() or Vector2.new(u75.X, u75.Y)
            local v104 = u22.CurrentCamera:ViewportPointToRay(v103.X, v103.Y)
            local v105 = RaycastParams.new()
            v105.FilterDescendantsInstances = { v93.lightMapPart }
            v105.FilterType = Enum.RaycastFilterType.Whitelist
            local v106 = u22:Raycast(v104.Origin, v104.Direction * 100, v105)
            u22.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            u22.CurrentCamera.FieldOfView = 60
            if v93.motor:getValue().x == 0 then
                local v107 = {
                    ["dampingRatio"] = 1,
                    ["frequency"] = 4
                }
                v93.motor:setGoal({
                    ["x"] = u11.new(v93.position.X, v107),
                    ["y"] = u11.new(v93.position.Y, v107),
                    ["z"] = u11.new(v93.position.Z, v107)
                })
            end
            local v108
            if v106 == nil then
                v108 = v106
            else
                v108 = v106.Position
            end
            if v108 then
                local v109 = CFrame.new(v93.position)
                if v106 ~= nil then
                    v106 = v106.Position
                end
                local v110 = v109:PointToObjectSpace(v106)
                local v111 = v110.X
                local v112 = -v93.size.X / 2
                local v113 = v93.size.X / 2
                local v114 = math.clamp(v111, v112, v113)
                local v115 = v110.Z
                local v116 = -v93.size.Y / 2
                local v117 = v93.size.Y / 2
                local v118 = math.clamp(v115, v116, v117)
                if os.clock() - u36.lastSentFlashlightPosition > 0.05 and u36.sendFlashlightPositionToServer then
                    u36.lastSentFlashlightPosition = os.clock()
                    u36.sendFlashlightPositionToServer:SendToServer(Vector2.new(v114, v118))
                end
                local v119 = v93.position
                local v120 = Vector3.new(v114, 0, v118)
                local v121 = CFrame.new(v119 + v120) * CFrame.new(0, 0.5, 0)
                local v122 = {
                    ["dampingRatio"] = 1,
                    ["frequency"] = 0.5
                }
                v93.motor:setGoal({
                    ["x"] = u11.new(v121.Position.X, v122),
                    ["y"] = u11.new(v121.Position.Y, v122),
                    ["z"] = u11.new(v121.Position.Z, v122)
                })
            end
        end
    end))
end
function u31.onSceneShutdown(p123) --[[ Line: 374 ]]
    p123.maid:DoCleaning()
end
function u31.openLightMap(u124) --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
        [3] = u19
        [4] = u22
        [5] = u5
        [6] = u18
        [7] = u26
        [8] = u23
        [9] = u9
        [10] = u10
        [11] = u14
        [12] = u29
    --]]
    if u124.stateObject:getState().lightOpen ~= nil then
        u12.Debug("Returning because light already open")
        return nil
    end
    local v125 = u17:GetTagged("MazeInteractionPart")[1]
    if v125 and v125:IsA("BasePart") then
        local u126 = u19.Assets.Effects.Flashlight:Clone()
        u126.Parent = u22
        u12.Debug("Flashlight created")
        local v127 = u5.Controllers.HalloweenMazeSceneController.bigMaze
        if v127 then
            u12.Debug("Setting up billboards")
            for _, u128 in u18:GetPlayers() do
                if u128:GetAttribute("MazeRole") ~= u26.ILLUMINATOR and u128.Character then
                    local u129 = u23.new(u128.Character, v125.Position, v127.PrimaryPart.Position)
                    u129.scale = 1
                    u124.maid:GiveTask(function() --[[ Line: 395 ]]
                        --[[
                        Upvalues:
                            [1] = u129
                        --]]
                        u129:destroy()
                    end)
                    local u130 = 100
                    u128.Character:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 399 ]]
                        --[[
                        Upvalues:
                            [1] = u128
                            [2] = u130
                            [3] = u129
                        --]]
                        local v131 = u128.Character
                        if v131 ~= nil then
                            v131 = v131:GetAttribute("Health")
                        end
                        if v131 < u130 then
                            u130 = v131
                            u129.viewportFrame.ImageColor3 = Color3.fromRGB(255, 0, 0)
                            task.delay(0.3, function() --[[ Line: 408 ]]
                                --[[
                                Upvalues:
                                    [1] = u129
                                --]]
                                u129.viewportFrame.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            end)
                        end
                    end)
                end
            end
            local v132 = u9.new({
                ["x"] = 56.3,
                ["y"] = 52.5,
                ["z"] = 59
            })
            v132:onStep(function(p133) --[[ Line: 420 ]]
                --[[
                Upvalues:
                    [1] = u126
                --]]
                local v134 = p133.x
                local v135 = p133.y
                local v136 = p133.z
                u126:PivotTo(CFrame.new(v134, v135, v136))
            end)
            local v137 = u10.new(1)
            v137:onStep(function(p138) --[[ Line: 427 ]]
                --[[
                Upvalues:
                    [1] = u124
                    [2] = u126
                --]]
                u124:animateFlashlight(p138, u126, 0.25)
            end)
            u124:toggleFlashlight(true)
            local v139 = u124.stateObject
            local v141 = {
                ["flashlightActivated"] = true,
                ["tree"] = u14.mount(u14.createElement(u29, {
                    ["clicked"] = function(p140) --[[ Name: clicked, Line 475 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124:toggleFlashlight(p140)
                    end,
                    ["position"] = v125.Position,
                    ["size"] = Vector2.new(5, 5),
                    ["whitelistParts"] = { v125 }
                }), u18.LocalPlayer:FindFirstChildOfClass("PlayerGui")),
                ["flashlight"] = u126,
                ["motor"] = v132,
                ["enemyBillboards"] = {},
                ["position"] = v125.Position,
                ["lightMotor"] = v137,
                ["size"] = Vector2.new(5, 5),
                ["lightMapPart"] = v125
            }
            v139:set("lightOpen", v141)
        end
    end
end
function u31.animateFlashlight(_, p142, p143, p144) --[[ Line: 494 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v145 = math.clamp(p142, 0, 1)
    local v146 = u7(math.max(0.5, v145) - 0.5, 0, 1, 0.5)
    local v147 = Vector3.new(p144, p144, p144)
    local v148 = p144 / 2
    local v149 = p144 / 2
    local v150 = p144 / 2
    local v151 = Vector3.new(v148, v149, v150) * v145
    p143.Sphere.Size = v147 + v151
    p143.Floor.SurfaceGui.ImageLabel.ImageTransparency = 1 - v146
    if p143.PrimaryPart then
        p143.PrimaryPart.CanQuery = false
    end
    for _, v152 in p143:GetDescendants() do
        if v152.Name ~= "Sphere" then
            if v152:IsA("BasePart") then
                v152.LocalTransparencyModifier = 1 - v146
            elseif v152:IsA("Beam") then
                v152.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(u7(v145, 0.1, 0.7, 1), 0),
                    NumberSequenceKeypoint.new(u7(v145, 0.21, 0.7, 1), 1),
                    NumberSequenceKeypoint.new(1, 1)
                })
            elseif v152:IsA("PointLight") or v152:IsA("SpotLight") then
                v152.Enabled = v145 > 0.7
            end
        end
    end
end
function u31.toggleFlashlight(p153, p154) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u24
    --]]
    local v155 = p153.stateObject:getState()
    if v155 and v155.lightOpen then
        local v156 = u6.copy(v155.lightOpen)
        v156.flashlightActivated = p154
        p153.stateObject:set("lightOpen", v156)
        u24.Client:Get("ToggleFlashlight"):SendToServer(v156.flashlightActivated)
    end
end
u4.CreateController(u31.new())
return nil