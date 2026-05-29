local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = v1.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "SpiritGardenerBuffsStatusEffectController"
    end,
    ["__index"] = u12
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p22)
    p22.Name = "SpiritGardenerBuffsStatusEffectController"
    p22.highlightFlowerMap = {}
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u3
        [4] = u16
        [5] = u18
        [6] = u8
        [7] = u13
        [8] = u9
        [9] = u7
        [10] = u11
        [11] = u17
        [12] = u2
        [13] = u15
    --]]
    u12.KnitStart(u23)
    u14.Client:Get("SpiritGardenerFlowerHighlight"):Connect(function(p24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if p24.removeHighlight then
            local v25 = u23.highlightFlowerMap[p24.flower]
            if v25 ~= nil then
                v25:DoCleaning()
            end
            u23.highlightFlowerMap[p24.flower] = nil
        else
            local v26 = u23:highlightFlower(p24.flower)
            u23.highlightFlowerMap[p24.flower] = v26
        end
    end)
    local v27 = u3.Controllers.StatusEffectController
    local v28 = u16.SPIRIT_GARDENER_SOULVINE_BUFF
    local u29 = u18
    local u30 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 65 ]]
            return "Anonymous"
        end,
        ["__index"] = u29
    })
    u30.__index = u30
    function u30.new(...) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local v31 = u30
        local v32 = setmetatable({}, v31)
        return v32:constructor(...) or v32
    end
    function u30.constructor(p33, ...) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.constructor(p33, ...)
    end
    function u30.onApply(p34, p35, _) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u13
            [4] = u9
            [5] = u7
            [6] = u11
            [7] = u17
            [8] = u2
            [9] = u15
        --]]
        if p35.PrimaryPart == nil then
            return nil
        end
        local v36 = p35 == u8.LocalPlayer.Character
        local v37 = u13[u3.Controllers.KitSkinController:getKitSkin(p35)].grove
        local u38
        if v37 then
            u38 = v37.buffEffect:Clone()
        else
            u38 = u9.Assets.Effects.SoulvineBuffEffect:Clone()
        end
        if not p35 then
            return nil
        end
        local v39 = u38:GetDescendants()
        local function v41(p40) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            if p40:IsA("ParticleEmitter") then
                p40:SetAttribute("FirstPersonVisible", false)
                u7:AddTag(p40, "FirstPersonHidden")
            end
            if p40:IsA("Beam") then
                p40:SetAttribute("FirstPersonVisible", false)
                u7:AddTag(p40, "FirstPersonHidden")
            end
        end
        for v42, v43 in v39 do
            v41(v43, v42 - 1, v39)
        end
        u38.Parent = u11
        u38.Massless = true
        u38.CFrame = p35.HumanoidRootPart.CFrame
        local u44 = u17:weldParts(p35.HumanoidRootPart, u38)
        local v45 = u2
        local v46 = u15.SPIRIT_GARDENER_BUFF_APPLIED
        local v47 = {}
        local v48
        if v36 then
            v48 = nil
        else
            v48 = p35.PrimaryPart.Position
        end
        v47.position = v48
        local v49
        if v36 then
            v49 = nil
        else
            v49 = p35.PrimaryPart
        end
        v47.parent = v49
        local u50 = v45:playSound(v46, v47)
        p34.maid:GiveTask(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u38
                [3] = u44
            --]]
            local v51 = u50
            if v51 ~= nil then
                v51:Stop()
            end
            local v52 = u38
            if v52 ~= nil then
                v52:Destroy()
            end
            local v53 = u44
            if v53 ~= nil then
                v53:Destroy()
            end
        end)
    end
    function u30.onRemove(_, _, _) --[[ Line: 132 ]] end
    v27:setHandler(v28, u30)
    local v54 = u3.Controllers.StatusEffectController
    local v55 = u16.SPIRIT_GARDENER_TEARBLOOM_BUFF
    local u56 = u18
    local u57 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 142 ]]
            return "Anonymous"
        end,
        ["__index"] = u56
    })
    u57.__index = u57
    function u57.new(...) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        local v58 = u57
        local v59 = setmetatable({}, v58)
        return v59:constructor(...) or v59
    end
    function u57.constructor(p60, ...) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56.constructor(p60, ...)
    end
    function u57.onApply(p61, p62, _) --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u7
            [4] = u11
            [5] = u17
            [6] = u15
            [7] = u3
            [8] = u13
            [9] = u2
        --]]
        if p62.PrimaryPart == nil then
            return nil
        end
        local v63 = p62 == u8.LocalPlayer.Character
        local u64 = u9.Assets.Effects.TearbloomBuffEffect:Clone()
        if not p62 then
            return nil
        end
        local v65 = u64:GetDescendants()
        local function v67(p66) --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            if p66:IsA("ParticleEmitter") then
                p66:SetAttribute("FirstPersonVisible", false)
                u7:AddTag(p66, "FirstPersonHidden")
            end
            if p66:IsA("Beam") then
                p66:SetAttribute("FirstPersonVisible", false)
                u7:AddTag(p66, "FirstPersonHidden")
            end
        end
        for v68, v69 in v65 do
            v67(v69, v68 - 1, v65)
        end
        u64.Parent = u11
        u64.Massless = true
        u64.CFrame = p62.HumanoidRootPart.CFrame
        local u70 = u17:weldParts(p62.HumanoidRootPart, u64)
        local v71 = u15.SPIRIT_GARDENER_BUFF_APPLIED
        local v72 = u13[u3.Controllers.KitSkinController:getKitSkin(p62)].grove
        if v72 then
            v71 = v72.buffAppliedSound
        end
        local v73 = u2
        local v74 = {}
        local v75
        if v63 then
            v75 = nil
        else
            v75 = p62.PrimaryPart.Position
        end
        v74.position = v75
        local v76
        if v63 then
            v76 = nil
        else
            v76 = p62.PrimaryPart
        end
        v74.parent = v76
        local u77 = v73:playSound(v71, v74)
        p61.maid:GiveTask(function() --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u64
                [3] = u70
            --]]
            local v78 = u77
            if v78 ~= nil then
                v78:Stop()
            end
            u64:Destroy()
            local v79 = u70
            if v79 ~= nil then
                v79:Destroy()
            end
        end)
    end
    function u57.onRemove(_, _, _) --[[ Line: 205 ]] end
    v54:setHandler(v55, u57)
end
function u19.highlightFlower(_, u80) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u10
    --]]
    local v81 = u80:GetAttribute("CurrentStage")
    local v82
    if v81 == 2 then
        v82 = u80:WaitForChild("stage_2"):WaitForChild("MainPart")
    else
        v82 = nil
    end
    if v81 == 3 then
        v82 = u80:WaitForChild("stage_3"):WaitForChild("MainPart")
    end
    local v83 = u4.new()
    local u84 = u5("Highlight", {
        ["Name"] = "SpiritGardenerFlowerHighlight",
        ["FillTransparency"] = 0.9,
        ["OutlineTransparency"] = 1,
        ["FillColor"] = Color3.fromRGB(164, 7, 255),
        ["OutlineColor"] = Color3.fromRGB(33, 207, 255),
        ["Parent"] = v82,
        ["DepthMode"] = Enum.HighlightDepthMode.Occluded
    })
    u10:Create(u84, TweenInfo.new(1), {
        ["OutlineTransparency"] = 0.4
    }):Play()
    local u85 = u80:GetAttributeChangedSignal("CurrentStage"):Connect(function() --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u84
        --]]
        if u80:GetAttribute("CurrentStage") == 2 then
            u84.Parent = u80:WaitForChild("stage_2"):WaitForChild("MainPart", 5)
        end
        if u80:GetAttribute("CurrentStage") == 3 then
            u84.Parent = u80:WaitForChild("stage_3"):WaitForChild("MainPart", 5)
        end
    end)
    v83:GiveTask(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u84
            [3] = u85
        --]]
        local v86 = u10:Create(u84, TweenInfo.new(1), {
            ["OutlineTransparency"] = 1
        })
        v86:Play()
        v86.Completed:Connect(function() --[[ Line: 245 ]]
            --[[
            Upvalues:
                [1] = u84
            --]]
            u84:Destroy()
        end)
        u85:Disconnect()
    end)
    return v83
end
u3.CreateController(u19.new())
return nil