local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = v1.import(script, script.Parent, "vignette-app").VignetteApp
local u24 = v1.import(script, script.Parent, "vignette-meta").VignetteMeta
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "VignetteController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u6
    --]]
    u16.constructor(p28)
    p28.Name = "VignetteController"
    p28.activeVignetteMaid = {}
    p28.enableOnScreenEffects = true
    p28.maid = u6.new()
end
function u25.KnitStart(u29) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u21
        [4] = u18
        [5] = u19
        [6] = u11
        [7] = u5
        [8] = u24
        [9] = u20
    --]]
    u16.KnitStart(u29)
    u29.maid:GiveTask(u15.SettingChanged:connect(function(p30) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u29
            [3] = u18
        --]]
        if p30.setting == u21.ENABLE_ON_SCREEN_EFFECTS then
            u29.enableOnScreenEffects = u18:getState().Settings.enable_on_screen_effects
            if not u29.enableOnScreenEffects then
                for _, v31 in u29.activeVignetteMaid do
                    v31:Destroy()
                end
                table.clear(u29.activeVignetteMaid)
            end
        end
    end))
    u29.enableOnScreenEffects = u18:getState().Settings.enable_on_screen_effects
    u29.maid:GiveTask(u15.StatusEffectAdded:connect(function(p32) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u5
            [4] = u24
            [5] = u29
        --]]
        local v33 = u19:getPlayerFromEntityInstance(p32.entityInstance)
        if not v33 then
            return nil
        end
        if v33 ~= u11.LocalPlayer then
            return nil
        end
        local v34 = nil
        for v35, v36 in u5.entries(u24) do
            local _ = v35 - 1
            local _ = v36[1]
            local v37 = v36[2].statusEffectType
            if v37 ~= nil then
                local v38 = p32.statusEffect
                v37 = table.find(v37, v38) ~= nil
            end
            if v37 == true then
                v34 = v36
                break
            end
        end
        if v34 ~= nil then
            v34 = v34[1]
        end
        if not v34 then
            return nil
        end
        u29:createVignette(v34)
    end))
    u29.maid:GiveTask(u15.StatusEffectRemoved:connect(function(p39) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u5
            [4] = u24
            [5] = u29
        --]]
        local v40 = u19:getPlayerFromEntityInstance(p39.entityInstance)
        if not v40 then
            return nil
        end
        if v40 ~= u11.LocalPlayer then
            return nil
        end
        local v41 = nil
        for v42, v43 in u5.entries(u24) do
            local _ = v42 - 1
            local _ = v43[1]
            local v44 = v43[2].statusEffectType
            if v44 ~= nil then
                local v45 = p39.statusEffect
                v44 = table.find(v44, v45) ~= nil
            end
            if v44 == true then
                v41 = v43
                break
            end
        end
        if v41 ~= nil then
            v41 = v41[1]
        end
        if not v41 then
            return nil
        end
        u29:destroyVignette(v41)
    end))
    u29.maid:GiveTask(function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        for _, v46 in u29.activeVignetteMaid do
            v46:Destroy()
        end
        table.clear(u29.activeVignetteMaid)
    end)
    u29.maid:GiveTask(u20.Client:Get("CreateVignette"):Connect(function(p47) --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v48 = p47.vignetteType
        if not v48 then
            return nil
        end
        u29:createVignette(v48)
    end))
    u29.maid:GiveTask(u20.Client:Get("DestroyVignette"):Connect(function(p49) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v50 = p49.vignetteType
        if not v50 then
            return nil
        end
        u29:destroyVignette(v50)
    end))
end
function u25.createVignette(p51, p52, p53) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u6
        [3] = u3
    --]]
    if not p51.enableOnScreenEffects then
        return nil
    end
    local v54 = u24[p52]
    if not v54 then
        return nil
    end
    if p51.activeVignetteMaid[p52] ~= nil then
        return nil
    end
    local v55 = u6.new()
    if v54.particle then
        local u56 = {}
        local v57 = v54.particle.emitters
        local function v63(p58) --[[ Line: 183 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            if p58:IsA("ParticleEmitter") then
                local v59 = u56
                table.insert(v59, p58)
            elseif p58:IsA("Folder") then
                for v60, v61 in p58:GetChildren() do
                    local _ = v60 - 1
                    if v61:IsA("ParticleEmitter") then
                        local v62 = u56
                        table.insert(v62, v61)
                    end
                end
            end
        end
        for v64, v65 in v57 do
            v63(v65, v64 - 1, v57)
        end
        local v66 = u3.Controllers.VignetteController
        local v67 = {
            ["particleEmitters"] = u56,
            ["offset"] = v54.particle.offset,
            ["fadeOutDuration"] = v54.particle.fadeOutDuration,
            ["fadeInDuration"] = v54.particle.fadeInDuration,
            ["shouldShow"] = v54.particle.shouldShow
        }
        local v68
        if p53 == nil then
            v68 = p53
        else
            v68 = p53.transparencyMultiplier
        end
        v67.transparencyMultiplier = v68
        local v69 = {}
        if p53 ~= nil then
            p53 = p53.maxRate
        end
        v69.Rate = p53
        v67.config = v69
        v55:GiveTask(v66:createParticlesVignette(v67))
    end
    if v54.vignette then
        local v70 = u3.Controllers.VignetteController
        local v71 = {}
        for v72, v73 in v54.vignette do
            v71[v72] = v73
        end
        v71.fadeOutDuration = v54.vignette.fadeOutDuration
        v71.fadeInDuration = v54.vignette.fadeInDuration
        v55:GiveTask(v70:createRadialVignette(v71))
    end
    p51.activeVignetteMaid[p52] = v55
end
function u25.destroyVignette(p74, p75) --[[ Line: 246 ]]
    local v76 = p74.activeVignetteMaid[p75]
    if v76 ~= nil then
        v76:Destroy()
    end
    p74.activeVignetteMaid[p75] = nil
end
function u25.createRadialVignette(_, u77) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u8
        [4] = u23
        [5] = u11
    --]]
    local u78 = u6.new()
    local u79 = u14.new()
    u78:GiveTask(u79)
    local v80 = u8
    local v81 = {}
    for v82, v83 in u77 do
        v81[v82] = v83
    end
    v81.signalDestroy = u79
    local u84 = v80.mount(u8.createElement(u23, v81), u11.LocalPlayer:WaitForChild("PlayerGui"))
    u78:GiveTask(function() --[[ Line: 268 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u84
        --]]
        u8.unmount(u84)
    end)
    local v85 = u6.new()
    v85:GiveTask(function() --[[ Line: 272 ]]
        --[[
        Upvalues:
            [1] = u78
            [2] = u79
            [3] = u77
        --]]
        if u78 then
            u79:Fire()
            local v86 = u77.fadeOutDuration
            if v86 ~= 0 and (v86 == v86 and v86) then
                v86 = u77.fadeOutDuration > 0
            end
            if v86 == 0 or (v86 ~= v86 or not v86) then
                u78:Destroy()
            else
                task.delay(u77.fadeOutDuration, function() --[[ Line: 282 ]]
                    --[[
                    Upvalues:
                        [1] = u78
                    --]]
                    u78:Destroy()
                end)
            end
        else
            return nil
        end
    end)
    return v85
end
function u25.createParticlesVignette(p87, u88) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u12
        [4] = u22
        [5] = u17
        [6] = u4
    --]]
    local u89 = p87:createVignettePart()
    p87:initializeParticles(u89, u88.particleEmitters, Enum.NormalId.Left, u88.config, u88.fadeInDuration, u88.disableCloning)
    u89.Parent = u13.CurrentCamera
    local u90 = p87:createVignettePart()
    p87:initializeParticles(u90, u88.particleEmitters, Enum.NormalId.Right, u88.config, u88.fadeInDuration, u88.disableCloning)
    u90.Parent = u13.CurrentCamera
    local u91 = p87:createVignettePart()
    p87:initializeParticles(u91, u88.particleEmitters, Enum.NormalId.Bottom, u88.config, u88.fadeInDuration, u88.disableCloning)
    u91.Parent = u13.CurrentCamera
    local u92 = p87:createVignettePart()
    p87:initializeParticles(u92, u88.particleEmitters, Enum.NormalId.Top, u88.config, u88.fadeInDuration, u88.disableCloning)
    u92.Parent = u13.CurrentCamera
    local u93 = u6.new()
    local u94 = 0
    local u95 = 0
    u93:GiveTask(u12.RenderStepped:Connect(function(p96) --[[ Line: 308 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u89
            [3] = u90
            [4] = u91
            [5] = u92
            [6] = u94
            [7] = u95
            [8] = u22
            [9] = u17
            [10] = u4
            [11] = u13
        --]]
        if u88.shouldShow and u88.shouldShow() == false then
            u89.CFrame = CFrame.new((1 / 0), 0, 0)
            u90.CFrame = CFrame.new((1 / 0), 0, 0)
            u91.CFrame = CFrame.new((1 / 0), 0, 0)
            u92.CFrame = CFrame.new((1 / 0), 0, 0)
            return nil
        end
        u94 = u94 + p96
        if u88.transparencyMultiplier and u94 > 0.3 then
            u94 = 0
            local v97 = u88.transparencyMultiplier()
            if v97 ~= u95 then
                u95 = v97
                u22:setEffectTransparencyStrength({
                    u89,
                    u90,
                    u91,
                    u92
                }, v97)
            end
        end
        local v98 = u17.ScreenHeightToWorldHeight(u17.ViewSizeY(), -4, u4.Controllers.FovController:getBaseFOV()) * 1.2
        local v99 = Vector3.new(1, v98, 1)
        local v100 = u17.ScreenWidthToWorldWidth(u17.ViewSizeX(), -4, u4.Controllers.FovController:getBaseFOV()) * 1.2
        local v101 = Vector3.new(v100, 1, 1)
        local v102 = u13.CurrentCamera.CFrame
        local v103 = u17.ScreenWidthToWorldWidth(-u17.ViewSizeX() / 2, -4)
        local v104 = u88.offset
        local v105 = v104 == nil and 0 or v104
        u89.CFrame = v102 * CFrame.new(v103, 0, -4.5 - v105)
        local v106 = u13.CurrentCamera.CFrame
        local v107 = u17.ScreenWidthToWorldWidth(u17.ViewSizeX() / 2, -4)
        local v108 = u88.offset
        local v109 = v108 == nil and 0 or v108
        u90.CFrame = v106 * CFrame.new(v107, 0, -4.5 - v109)
        local v110 = u13.CurrentCamera.CFrame
        local v111 = u17.ScreenHeightToWorldHeight(-u17.ViewSizeY() / 2, -4)
        local v112 = u88.offset
        local v113 = v112 == nil and 0 or v112
        u91.CFrame = v110 * CFrame.new(0, v111, -4.5 - v113)
        local v114 = u13.CurrentCamera.CFrame
        local v115 = u17.ScreenHeightToWorldHeight(u17.ViewSizeY() / 2, -4)
        local v116 = u88.offset
        local v117 = v116 == nil and 0 or v116
        u92.CFrame = v114 * CFrame.new(0, v115, -4.5 - v117)
        u89.Size = v99
        u90.Size = v99
        u91.Size = v101
        u92.Size = v101
    end))
    u93:GiveTask(u89)
    u93:GiveTask(u90)
    u93:GiveTask(u91)
    u93:GiveTask(u92)
    local u118 = {
        u89,
        u90,
        u91,
        u92
    }
    local v119 = u6.new()
    v119:GiveTask(function() --[[ Line: 375 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u22
            [3] = u118
            [4] = u93
        --]]
        local v120 = u88.fadeOutDuration
        if v120 ~= 0 and (v120 == v120 and v120) then
            v120 = u88.fadeOutDuration > 0
        end
        if v120 == 0 or (v120 ~= v120 or not v120) then
            u93:Destroy()
        else
            for v121, v122 in u118 do
                local _ = v121 - 1
                u22:toggleEffects(v122, false, u88.fadeOutDuration)
            end
            task.delay(u88.fadeOutDuration, function() --[[ Line: 387 ]]
                --[[
                Upvalues:
                    [1] = u93
                --]]
                u93:Destroy()
            end)
        end
    end)
    return v119
end
function u25.createVignettePart(_) --[[ Line: 396 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
    --]]
    return u7("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["Parent"] = u13.CurrentCamera
    })
end
function u25.initializeParticles(_, p123, p124, p125, p126, p127, p128) --[[ Line: 405 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u22
    --]]
    for _, v130 in p124 do
        if not p128 then
            local v130 = v130:Clone()
        end
        v130.LockedToPart = true
        v130.ZOffset = 3
        if p126 then
            u5.assign(v130, p126)
        end
        v130.EmissionDirection = p125
        if v130:HasTag("visualizer_hidden_in_first") then
            u10:RemoveTag(v130, "visualizer_hidden_in_first")
        end
        local v131 = v130:GetAttribute("FirstPersonHidden")
        if v131 ~= 0 and (v131 == v131 and (v131 ~= "" and v131)) then
            v130:SetAttribute("FirstPersonHidden", nil)
        end
        v130.Parent = p123
    end
    local v132
    if p127 == 0 or (p127 ~= p127 or not p127) then
        v132 = p127
    else
        v132 = p127 > 0
    end
    if v132 ~= 0 and (v132 == v132 and v132) then
        u22:toggleEffects(p123, true, p127)
    end
end
u3.CreateController(u25.new())
return nil