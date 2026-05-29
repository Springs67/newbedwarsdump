local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.RandomUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.RunService
local u19 = v14.Workspace
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u21 = v1.import(script, script.Parent.Parent.Parent, "game", "items", "metal-detector", "indicator").Indicator
local v22 = v1.import(script, script.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u23 = v22.InteractionCategory
local u24 = v22.InteractionPriority
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "MurdererHiddenWoolController"
    end,
    ["__index"] = u25
})
u32.__index = u32
function u32.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u31
    --]]
    u25.constructor(p35)
    p35.registered = false
    p35.sheepSound = {
        u31.MURDER_GAME_SHEEP_1,
        u31.MURDER_GAME_SHEEP_2,
        u31.MURDER_GAME_SHEEP_3,
        u31.MURDER_GAME_SHEEP_4
    }
    p35.Name = "MurdererHiddenWoolController"
    p35.sheepMap = {}
    p35.usingShear = false
end
function u32.KnitStart(u36) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u30
        [3] = u17
        [4] = u19
        [5] = u12
        [6] = u27
        [7] = u26
        [8] = u15
    --]]
    u25.KnitStart(u36)
    u30.Client:Get("SpawnHiddenWool"):Connect(function(p37) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u36
            [3] = u19
            [4] = u12
            [5] = u27
            [6] = u26
            [7] = u15
        --]]
        local v38 = u17.Assets.Effects.WoolSheep:Clone()
        if v38 then
            local v39 = v38.PrimaryPart
            if not v39 then
                return nil
            end
            u36.sheepMap[p37.secret] = v38
            v38:SetAttribute("Secret", p37.secret)
            p37.position = p37.position - Vector3.new(0, 0.5, 0)
            v38.PrimaryPart.CFrame = CFrame.new(p37.position)
            v38.Parent = u19
            local v40 = u12
            local v41 = {
                ["Name"] = "AntiGravity"
            }
            local v42 = v39.AssemblyMass * u19.Gravity
            v41.Force = Vector3.new(0, v42, 0)
            v41.Parent = v39
            v40("BodyForce", v41)
            u27:playAnimation(v38, u26.SHEEP_IDLE, {
                ["looped"] = true
            })
            u36:wander(v38)
            if u36.usingShear then
                u15:AddTag(v38.PrimaryPart, "WoolSheep")
            end
        end
    end)
    u30.Client:Get("DeleteWoolEvent"):Connect(function(p43) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local u44 = u36.sheepMap[p43.secret]
        u36.sheepMap[p43.secret] = nil
        task.delay(0.3, function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u36
            --]]
            if u44 then
                u36:sheepAnimation(u44)
            end
        end)
    end)
end
function u32.isRelevantItem(_, p45) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    return p45.itemType == u29.WOOL_SHEAR
end
function u32.onEnable(u46, _, _) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u20
        [4] = u21
        [5] = u16
        [6] = u18
        [7] = u28
        [8] = u19
        [9] = u10
        [10] = u15
    --]]
    u46.usingShear = true
    if not u46.registered then
        u46:initSheepPrompt()
        u46.registered = true
    end
    u46:enableSheepPrompt()
    u46.maid = u11.new()
    u46:highlightSheep()
    local v47, u48 = u13.createBinding(UDim2.fromScale(0.5, 0.5))
    local v49, u50 = u13.createBinding(0)
    local u51 = u20.new()
    local u52 = u13.createRef()
    u46.maid:GiveTask(u51)
    local u53 = u13.mount(u13.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true
    }, { u13.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            [u13.Ref] = u52
        }), u13.createElement(u21, {
            ["position"] = v47,
            ["rotation"] = v49,
            ["activatedSignal"] = u51
        }) }), u16.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    u46.maid:GiveTask(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u53
        --]]
        u13.unmount(u53)
    end)
    u46.maid:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u46
            [3] = u19
            [4] = u52
            [5] = u48
            [6] = u50
            [7] = u10
            [8] = u51
            [9] = u15
        --]]
        local v54 = u28:getLocalPlayerEntity()
        local v55
        if v54 == nil then
            v55 = v54
        else
            v55 = v54:getInstance():GetPrimaryPartCFrame().Position
        end
        if v54 == nil or v55 == nil then
            return nil
        end
        if u46.lastTrackedHiddenMetal then
            if u46.lastTrackedHiddenMetal.model:IsDescendantOf(u19) == false then
                u46.lastTrackedHiddenMetal = nil
                return nil
            end
            local v56 = u46.lastTrackedHiddenMetal.model.PrimaryPart
            if v56 ~= nil then
                v56 = v56.Position
            end
            if not v56 then
                return nil
            end
            local v57 = (v56 - v55).Magnitude
            local v58 = u52:getValue()
            local v59 = v58.AbsolutePosition
            local v60 = v58.AbsoluteSize
            local v61 = u19.CurrentCamera:WorldToViewportPoint(v56)
            local v62 = Vector2.new(v61.X, v61.Y)
            if v61.Z < 0 then
                v62 = v60 + v59 - v62 + v59
            end
            local v63 = v62 - v59
            local v64 = v63.Y
            local v65 = v63.X
            local v66 = math.atan2(v64, v65)
            local v67 = v59 + Vector2.new(math.cos(v66) * 80, math.sin(v66) * 80)
            u48(UDim2.fromOffset(v67.X, v67.Y))
            u50((math.deg(v66)))
            if u46.lastTrackedHiddenMetal.nextBeep < time() then
                local v68 = {}
                for v69, v70 in u46.lastTrackedHiddenMetal do
                    v68[v69] = v70
                end
                v68.nextBeep = time() + u10(200 - v57, 4, 3, 200)
                u46.lastTrackedHiddenMetal = v68
                u51:Fire(u10(200 - v57, 4, 3, 200))
                if v57 > 200 then
                    u46.lastTrackedHiddenMetal = nil
                    return
                end
            end
        else
            local v71 = 200
            local v72 = nil
            for _, v73 in u15:GetTagged("WoolSheep") do
                local v74 = v73.Parent
                local v75 = (v74:GetPrimaryPartCFrame().Position - v55).Magnitude
                if v75 < v71 then
                    v72 = v74
                    v71 = v75
                end
            end
            if v72 then
                u46.lastTrackedHiddenMetal = {
                    ["model"] = v72,
                    ["nextBeep"] = time() + 2,
                    ["nextRevealLocation"] = time() + 2
                }
            end
        end
    end))
end
function u32.onDisable(p76) --[[ Line: 216 ]]
    p76.usingShear = false
    p76:disableSheepPrompt()
    if p76.maid then
        p76.maid:DoCleaning()
        p76.maid = nil
    end
end
function u32.getWool(_, p77) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v78 = {
        ["secret"] = p77:GetAttribute("Secret")
    }
    return u30.Client:Get("GetWool"):CallServer(v78)
end
function u32.sheepAnimation(_, u79) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u26
    --]]
    u27:playAnimation(u79, u26.SHEEP_JUMP)
    task.delay(0.5, function() --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u79
        --]]
        u79:Destroy()
    end)
end
function u32.initSheepPrompt(u80) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u24
        [4] = u23
        [5] = u16
        [6] = u27
        [7] = u26
        [8] = u28
        [9] = u5
        [10] = u31
    --]]
    u7.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Shear",
        ["interactionObjectText"] = "Get Wool",
        ["interactionTag"] = "WoolSheep",
        ["maxActivationDistance"] = 5,
        ["holdDuration"] = 3,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u3.isMobileControls(),
        ["priority"] = u24.OTHER,
        ["category"] = u23.OTHER,
        ["onInteracted"] = function(p81, p82, p83) --[[ Name: onInteracted, Line 247 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u27
                [3] = u26
                [4] = u28
                [5] = u80
                [6] = u5
                [7] = u31
            --]]
            if p81 == u16.LocalPlayer then
                u27:playAnimation(p81, u26.PUNCH)
                local v84 = u28:getEntity(p81)
                if v84 ~= nil then
                    v84 = v84:isAlive()
                end
                if not v84 then
                    return nil
                end
                local v85 = u80:getWool(p82.Parent)
                p83:Destroy()
                if v85 then
                    u5:playSound(u31.WOOL_BREAK)
                end
            end
        end
    })
end
function u32.enableSheepPrompt(p86) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    for v87, v88 in p86.sheepMap do
        u15:AddTag(({ v87, v88 })[2].PrimaryPart, "WoolSheep")
    end
end
function u32.disableSheepPrompt(p89) --[[ Line: 275 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    for v90, v91 in p89.sheepMap do
        u8.Controllers.InteractionRegistryController:removePrompt(({ v90, v91 })[2].PrimaryPart, "WoolSheep")
    end
end
function u32.wander(_, u92) --[[ Line: 281 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u27
        [3] = u26
        [4] = u4
    --]]
    local u93 = u92.PrimaryPart.Position
    local u94 = {
        u93,
        u93 + Vector3.new(2, 0, 0),
        u93 + Vector3.new(2, 0, 2),
        u93 + Vector3.new(2, 0, -2),
        u93 + Vector3.new(0, 0, 2),
        u93 + Vector3.new(-2, 0, 2),
        u93 + Vector3.new(-2, 0, -2),
        u93 + Vector3.new(0, 0, -2),
        u93 + Vector3.new(-2, 0, 0)
    }
    local u95 = 0
    local u96 = u93
    local u97 = nil
    local u98 = false
    local u99 = nil
    u99 = u18.Heartbeat:Connect(function(p100) --[[ Line: 304 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u99
            [3] = u93
            [4] = u96
            [5] = u98
            [6] = u95
            [7] = u27
            [8] = u26
            [9] = u4
            [10] = u94
            [11] = u97
        --]]
        if not u92.PrimaryPart then
            u99:Disconnect()
            return nil
        end
        local v101 = u92.PrimaryPart.Position
        if (v101 - u93).Magnitude > 20 then
            u99:Disconnect()
        end
        if (v101 - u96).Magnitude == 0 then
            if not u98 then
                u95 = 0
                u98 = true
                u27:playAnimation(u92, u26.SHEEP_IDLE, {
                    ["looped"] = true
                })
                return nil
            end
            if u95 < 4 then
                u95 = u95 + p100
                return nil
            end
            u98 = false
            local v102 = u94
            u96 = u4.fromList(unpack(v102))
            if v101 == u96 then
                return nil
            end
            u27:playAnimation(u92, u26.SHEEP_WALK, {
                ["looped"] = true
            })
            u92.PrimaryPart.CFrame = CFrame.new(v101, u96)
            u97 = (u96 - v101).Unit
        end
        if not u97 then
            return nil
        end
        local v103 = v101 + u97 * p100
        if (v103 - v101).Magnitude > (u96 - v101).Magnitude then
            v103 = u96
        end
        u92.PrimaryPart.Position = v103
    end)
end
function u32.highlightSheep(u104) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
    --]]
    local v105 = u9.values(u104.sheepMap)
    local function v109(p106) --[[ Line: 354 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u104
        --]]
        local v107 = u12("Highlight", {
            ["Enabled"] = true,
            ["FillTransparency"] = 1,
            ["OutlineTransparency"] = 0,
            ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
            ["FillColor"] = Color3.fromRGB(0, 255, 238),
            ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
            ["Parent"] = p106
        })
        local v108 = u104.maid
        if v108 ~= nil then
            v108:GiveTask(v107)
        end
    end
    for v110, v111 in v105 do
        v109(v111, v110 - 1, v105)
    end
end
u7.CreateController(u32.new())
return nil