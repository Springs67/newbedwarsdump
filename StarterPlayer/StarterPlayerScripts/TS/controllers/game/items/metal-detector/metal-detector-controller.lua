local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.RunService
local u11 = v7.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "indicator").Indicator
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "MetalDetectorController"
    end,
    ["__index"] = u13
})
u18.__index = u18
function u18.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p21)
    p21.Name = "MetalDetectorController"
end
function u18.KnitStart(p22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p22)
end
function u18.isRelevantItem(_, p23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p23.itemType == u15.METAL_DETECTOR
end
function u18.onEnable(u24, _, _) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u12
        [4] = u17
        [5] = u9
        [6] = u8
        [7] = u10
        [8] = u14
        [9] = u11
        [10] = u4
        [11] = u2
        [12] = u16
    --]]
    u24.maid = u5.new()
    local v25, u26 = u6.createBinding(UDim2.fromScale(0.5, 0.5))
    local v27, u28 = u6.createBinding(0)
    local u29 = u12.new()
    local u30 = u6.createRef()
    u24.maid:GiveTask(u29)
    local u31 = u6.mount(u6.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true
    }, { u6.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            [u6.Ref] = u30
        }), u6.createElement(u17, {
            ["position"] = v25,
            ["rotation"] = v27,
            ["activatedSignal"] = u29
        }) }), u9.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    u24.maid:GiveTask(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u31
        --]]
        u6.unmount(u31)
    end)
    local function u35(p32) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        for _, v33 in u8:GetTagged("hidden-metal") do
            for _, v34 in v33:GetChildren() do
                if v34:IsA("ProximityPrompt") then
                    v34.Enabled = p32
                end
            end
        end
    end
    u35(true)
    u24.maid:GiveTask(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        return u35(false)
    end)
    u24.maid:GiveTask(u10.Heartbeat:Connect(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u24
            [3] = u11
            [4] = u30
            [5] = u26
            [6] = u28
            [7] = u4
            [8] = u2
            [9] = u16
            [10] = u29
            [11] = u8
        --]]
        local v36 = u14:getLocalPlayerEntity()
        local v37
        if v36 == nil then
            v37 = v36
        else
            v37 = v36:getInstance():GetPivot().Position
        end
        if v36 == nil or v37 == nil then
            return nil
        end
        if u24.lastTrackedHiddenMetal then
            if u24.lastTrackedHiddenMetal.model:IsDescendantOf(u11) == false then
                u24.lastTrackedHiddenMetal = nil
                return nil
            end
            local v38 = u24.lastTrackedHiddenMetal.model:GetPivot().Position
            local v39 = (v38 - v37).Magnitude
            local v40 = u30:getValue()
            local v41 = v40.AbsolutePosition
            local v42 = v40.AbsoluteSize
            local v43 = u11.CurrentCamera:WorldToViewportPoint(v38)
            local v44 = Vector2.new(v43.X, v43.Y)
            if v43.Z < 0 then
                v44 = v42 + v41 - v44 + v41
            end
            local v45 = v44 - v41
            local v46 = v45.Y
            local v47 = v45.X
            local v48 = math.atan2(v46, v47)
            local v49 = v41 + Vector2.new(math.cos(v48) * 80, math.sin(v48) * 80)
            u26(UDim2.fromOffset(v49.X, v49.Y))
            u28((math.deg(v48)))
            if u24.lastTrackedHiddenMetal.nextBeep < time() then
                local v50 = {}
                for v51, v52 in u24.lastTrackedHiddenMetal do
                    v50[v51] = v52
                end
                v50.nextBeep = time() + u4(200 - v39, 1, -0.9, 200)
                u24.lastTrackedHiddenMetal = v50
                u2:playSound(u16.METAL_DETECTOR_BEEP, {})
                u29:Fire(u4(200 - v39, 2, 20, 200))
                if v39 > 200 then
                    u24.lastTrackedHiddenMetal = nil
                    return
                end
            end
        else
            for _, v53 in u8:GetTagged("hidden-metal") do
                if (v53:GetPivot().Position - v37).Magnitude < 200 then
                    u24.lastTrackedHiddenMetal = {
                        ["model"] = v53,
                        ["nextBeep"] = time() + 1,
                        ["nextRevealLocation"] = time() + 1
                    }
                end
            end
        end
    end))
end
function u18.onDisable(p54) --[[ Line: 148 ]]
    if p54.maid then
        p54.maid:DoCleaning()
        p54.maid = nil
    end
end
v3.CreateController(u18.new())
return nil