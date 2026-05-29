local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchPlayerCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "BaseTutorialController"
    end,
    ["__index"] = u12
})
v17.__index = v17
function v17.constructor(p18, p19) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p18)
    p18.Name = "BaseTutorialController"
    p18.sectionMaids = {}
    p18.taskMaids = {}
    p18.assigningSectionGuides = false
    p18.assigningTaskGuides = false
    p18.tutorialType = p19
end
function v17.KnitStart(u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u4
        [4] = u16
    --]]
    u12.KnitStart(u20)
    u15.Client:OnEvent("TutorialStart", function(p21) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p21.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onTutorialStart()
    end)
    u15.Client:OnEvent("TutorialEnd", function(p22) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p22.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onTutorialEnd()
    end)
    u15.Client:OnEvent("TutorialSectionStart", function(p23) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p23.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onSectionStart(p23.sectionId)
        u20.assigningSectionGuides = true
        u20.sectionMaids[p23.sectionId] = u20:assignSectionGuides(p23.sectionId)
        u20.assigningSectionGuides = false
    end)
    u15.Client:OnEvent("TutorialTasksAssigned", function(p24) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u4
            [3] = u16
        --]]
        if p24.tutorialType ~= u20.tutorialType then
            return nil
        end
        u4:playSound(u16.TASK_START, {
            ["playbackSpeedMultiplier"] = 1.1,
            ["volumeMultiplier"] = 0.8
        })
    end)
    u15.Client:OnEvent("TutorialSectionEnd", function(u25) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if u25.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onSectionEnd(u25.sectionId)
        task.spawn(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u25
            --]]
            while u20.assigningSectionGuides do
                task.wait(0.01)
            end
            local v26 = u20.sectionMaids[u25.sectionId]
            if v26 ~= nil then
                v26:DoCleaning()
            end
        end)
    end)
    u15.Client:OnEvent("TutorialTaskStart", function(p27) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p27.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onTaskStart(p27.taskId)
        u20.assigningTaskGuides = true
        u20.taskMaids[p27.taskId] = u20:assignTaskGuides(p27.taskId)
        u20.assigningTaskGuides = false
    end)
    u15.Client:OnEvent("TutorialTaskEnd", function(u28) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u4
            [3] = u16
        --]]
        if u28.tutorialType ~= u20.tutorialType then
            return nil
        end
        u20:onTaskEnd(u28.taskId)
        u4:playSound(u16.QUEST_COMPLETE, {
            ["volumeMultiplier"] = 0.4
        })
        task.spawn(function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u28
            --]]
            while u20.assigningTaskGuides do
                task.wait(0.01)
            end
            local v29 = u20.taskMaids[u28.taskId]
            if v29 ~= nil then
                v29:DoCleaning()
            end
        end)
    end)
end
function v17.createHighlight(_, p30, p31) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v32 = {}
    local v33
    if p31 == nil then
        v33 = p31
    else
        v33 = p31.name
    end
    v32.Name = v33 == nil and "Highlight" or v33
    v32.Parent = p30
    if p31 ~= nil then
        p31 = p31.color
    end
    if p31 == nil then
        p31 = Color3.fromRGB(0, 237, 255)
    end
    v32.OutlineColor = p31
    v32.FillTransparency = 1
    v32.OutlineTransparency = 0
    v32.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    return u7("Highlight", v32)
end
function v17.createArrowBeam(_, p34) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u9
    --]]
    local v35 = u10.Assets.Effects.QueueTutorialBeam:Clone()
    v35.Parent = u11
    v35.Attachment1 = p34
    v35.Color = ColorSequence.new(Color3.fromRGB(0, 166, 204))
    v35.Transparency = NumberSequence.new(0.2)
    v35.LightEmission = 0.4
    v35.ZOffset = 0
    v35.FaceCamera = true
    v35.TextureSpeed = 1.5
    local v36 = u9.LocalPlayer
    if v36 ~= nil then
        v36 = v36.Character
        if v36 ~= nil then
            v36 = v36:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment")
        end
    end
    if v36 then
        v35.Attachment0 = v36
        return v35
    else
        warn("Player has no UpperTorso or BodyFrontAttachment")
        return v35
    end
end
function v17.setupArrowBeam(u37, u38) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
    --]]
    local v39 = u6.new()
    local u40 = u37:createArrowBeam(u38)
    v39:GiveTask(u5(u9.LocalPlayer, function(_, _) --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u37
            [3] = u38
        --]]
        u40:Destroy()
        u40 = u37:createArrowBeam(u38)
    end))
    v39:GiveTask(function() --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:Destroy()
    end)
    return v39
end
function v17.highlightSlotWithItem(_, p41) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u9
    --]]
    local v42 = u6.new()
    local v43 = u13:getState().Inventory.observedInventory.hotbar
    local v44 = nil
    for v45, v46 in v43 do
        local _ = v45 - 1
        local v47 = v46.item
        if v47 ~= nil then
            v47 = v47.itemType
        end
        if v47 == p41 == true then
            v44 = v46
            break
        end
    end
    if not v44 then
        warn("No item slot found: " .. p41)
        return nil
    end
    local v48 = (table.find(v43, v44) or 0) - 1
    u9.LocalPlayer:SetAttribute("TutorialHighlightedSlot", v48)
    v42:GiveTask(function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil)
    end)
    return v42
end
function v17.highlightTeamUpgradeButton(_) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
    --]]
    local v49 = u6.new()
    u9.LocalPlayer:SetAttribute("TutorialHighlightedUpgrade", true)
    v49:GiveTask(function() --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.LocalPlayer:SetAttribute("TutorialHighlightedUpgrade", false)
    end)
    return v49
end
function v17.highlightBlockPosition(p50, p51, p52) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u11
        [4] = u14
        [5] = u2
    --]]
    local v53 = u6.new()
    local v54 = u7
    local v55 = {
        ["Name"] = "TutorialSpacePart",
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Transparency"] = 1,
        ["Parent"] = u11
    }
    local v56 = u14
    local v57 = u14
    local v58 = u14
    v55.Size = Vector3.new(v56, v57, v58)
    v55.Position = u2:getWorldPosition(u2:snapPosition(p51))
    v55.Material = Enum.Material.Glass
    local u59 = v54("Part", v55)
    local u60 = p50:createHighlight(u59, {
        ["name"] = "SpaceHighlight"
    })
    if p52 then
        local u61 = p50:setupArrowBeam((u7("Attachment", {
            ["Parent"] = u59
        })))
        v53:GiveTask(function() --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u61
            --]]
            u61:DoCleaning()
        end)
    end
    v53:GiveTask(function() --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u60
        --]]
        u59:Destroy()
        u60:Destroy()
    end)
    return v53
end
return {
    ["BaseTutorialController"] = v17
}