local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent, "radioactive-plant-billboard").RadioactivePlantBillboard
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "RadioactivePlantController"
    end,
    ["__index"] = u13
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23, ...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p23, ...)
    p23.Name = "RadioactivePlantController"
    p23.radioactivePlantTargets = {}
    p23.lastEffectReconcileTime = {}
    p23.billboardMap = {}
    p23.originalNeonPartColors = {}
end
function u20.KnitStart(u24) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u10
        [4] = u8
        [5] = u19
    --]]
    u13.KnitStart(u24)
    u17.Client:OnEvent("RadioactivePlantTargetsChanged", function(p25) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        local v26 = u24
        local v27 = p25.radioactivePlant
        local v28 = {}
        for _, v29 in p25.targets do
            v28[v29] = true
        end
        v26:reconcileEffects(v27, v28)
    end)
    for v30, v31 in u10:GetTagged("radioactive-plant") do
        local _ = v30 - 1
        u24:updateTeamIndicator(v31)
    end
    u10:GetInstanceAddedSignal("radioactive-plant"):Connect(function(u32) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u8
            [3] = u19
        --]]
        u24:updateTeamIndicator(u32)
        local v33 = u32:GetAttribute("Enabled")
        if v33 ~= nil then
            u24:handleEnabledEffects(u32, v33)
        end
        local v34 = u8.mount(u8.createElement(u19, {
            ["radioactivePlantInstance"] = u32
        }), u32)
        u24.billboardMap[u32] = v34
        u32:GetAttributeChangedSignal("Enabled"):Connect(function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u24
            --]]
            local v35 = u32:GetAttribute("Enabled")
            if v35 ~= nil then
                u24:handleEnabledEffects(u32, v35)
            end
        end)
        u32:GetAttributeChangedSignal("IronDeposits"):Connect(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u32
            --]]
            u24:updateGroundSize(u32)
        end)
        u32:GetAttributeChangedSignal("DiamondDeposits"):Connect(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u32
            --]]
            u24:updateGroundSize(u32)
        end)
    end)
    u10:GetInstanceRemovedSignal("radioactive-plant"):Connect(function(p36) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u8
        --]]
        local v37 = u24.radioactivePlantTargets[p36]
        if v37 == nil then
            return nil
        end
        for _, v38 in v37 do
            v38:DoCleaning()
        end
        local v39 = u24.billboardMap[p36]
        if v39 then
            u8.unmount(v39)
            u24.billboardMap[p36] = nil
        end
        u24.radioactivePlantTargets[p36] = nil
    end)
end
function u20.handleEnabledEffects(u40, p41, u42) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
    --]]
    local v43 = 0
    local v44 = {}
    for v45, v46 in p41:WaitForChild("NeonParts", 3):GetDescendants() do
        local _ = v45 - 1
        if v46:IsA("MeshPart") == true then
            v43 = v43 + 1
            v44[v43] = v46
        end
    end
    local v47 = p41:FindFirstChild("Ground")
    if v47 ~= nil then
        for v48, v49 in v47:GetDescendants() do
            local _ = v48 - 1
            if v49:IsA("ParticleEmitter") then
                v49.Enabled = u42
            end
        end
        v47 = nil
    end
    local function v55(p50) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u42
            [3] = u3
            [4] = u12
        --]]
        if not u40.originalNeonPartColors[p50] then
            u40.originalNeonPartColors[p50] = p50.Color
        end
        if u42 then
            local v51 = u40.originalNeonPartColors[p50]
            if v51 ~= nil then
                local v52 = u3.brighten(v51, 0.05)
                u12:Create(p50, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["Color"] = v52
                }):Play()
                p50.Color = v52
                return
            end
        else
            local v53 = u40.originalNeonPartColors[p50]
            if v53 ~= nil then
                local v54 = u3.darken(v53, 0.85)
                u12:Create(p50, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["Color"] = v54
                }):Play()
                p50.Color = v54
            end
        end
    end
    for v56, v57 in v44 do
        v55(v57, v56 - 1, v44)
    end
end
u20.updateTeamIndicator = v1.async(function(_, p58) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v59 = p58:WaitForChild("TeamIndicator", 3)
    if v59 == nil then
        return nil
    end
    local v60 = u14(p58)
    if v60 then
        v59.Color = v60.color
    end
end)
function u20.updateGroundSize(_, p61) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v62 = p61:FindFirstChild("Ground")
    local v63 = p61:GetAttribute("CurrentRange")
    local v64
    if v63 == 0 or (v63 ~= v63 or not v63) then
        v64 = u15.RADIOACTIVE_PLANT_IRON_AOE_RANGE
    else
        v64 = p61:GetAttribute("CurrentRange")
    end
    local v65 = v62.Size.Y
    v62.Size = Vector3.new(v64, v65, v64)
end
function u20.reconcileEffects(u66, u67, p68) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u15
        [3] = u16
    --]]
    local u69 = os.clock()
    u66.lastEffectReconcileTime[u67] = u69
    local v70 = u66.radioactivePlantTargets[u67]
    local v71 = v70 == nil and {} or v70
    for v72, v73 in v71 do
        if p68[v72] == nil then
            v73:DoCleaning()
            v71[v72] = nil
        end
    end
    local v74 = u6.copy(v71)
    for v75 in p68 do
        if v71[v75] == nil then
            local v76 = u67:GetAttribute("CurrentRange")
            local v77
            if v76 == 0 or (v76 ~= v76 or not v76) then
                v77 = u15.RADIOACTIVE_PLANT_IRON_AOE_RANGE
            else
                v77 = u67:GetAttribute("CurrentRange")
            end
            local v78 = v75.PrimaryPart
            if v78 ~= nil then
                v78 = (v78.Position - u67.Position).Magnitude
            end
            if v77 >= (v78 == nil and 100 or v78) then
                local v79 = u16:getEntity(v75)
                if v79 ~= nil then
                    v79 = v79:isAlive()
                end
                if v79 then
                    v74[v75] = u66:createRadioactivePlantEffect(u67, v75)
                end
            end
        end
    end
    u66.radioactivePlantTargets[u67] = v74
    task.delay(1, function() --[[ Line: 241 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u67
            [3] = u69
        --]]
        if u66.lastEffectReconcileTime[u67] == u69 then
            u66:reconcileEffects(u67, {})
        end
    end)
end
function u20.createRadioactivePlantEffect(_, p80, p81) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u4
        [4] = u18
    --]]
    local v82 = u7.new()
    local v83 = p81 == u11.LocalPlayer.Character
    local v84 = u4
    local v85 = u18.RADIOACTIVE_PLANT_AOE_LOOP
    local v86 = {
        ["volumeMultiplier"] = 1.2,
        ["looped"] = true
    }
    local v87
    if v83 then
        v87 = nil
    else
        v87 = p80.Position
    end
    v86.position = v87
    local u88 = v84:playSound(v85, v86)
    if u88 then
        v82:GiveTask(function() --[[ Line: 258 ]]
            --[[
            Upvalues:
                [1] = u88
            --]]
            local v89 = u88
            if v89 ~= nil then
                v89:Stop()
            end
        end)
    end
    return v82
end
v5.CreateController(u20.new())
return nil