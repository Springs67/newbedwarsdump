local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent, "ui", "tutorial-dialogue").TutorialDialogue
local u16 = v1.import(script, script.Parent, "ui", "tutorial-task-tracker").TutorialTaskTracker
local u17 = v14.DIALOGUE
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "TutorialController"
    end,
    ["__index"] = u11
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    u11.constructor(p21)
    p21.Name = "TutorialController"
    p21.mountingUi = false
    p21.tasksMaid = u6.new()
    p21.dialogueMaid = u6.new()
end
function u18.KnitStart(u22) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u12
        [4] = u4
        [5] = u17
        [6] = u13
        [7] = u9
        [8] = u10
        [9] = u7
        [10] = u16
        [11] = u15
    --]]
    u11.KnitStart(u22)
    local v23, v24 = u5.Controllers.MatchController:getQueueTypeAsync():await()
    if v23 and v24 == u12.BEGINNER_TUTORIAL then
        local v25 = {
            ["sounds"] = { u17 }
        }
        u4.Controllers.PreloadController:runPreload(v25)
    end
    u13.Client:OnEvent("TutorialTasksAssigned", function(p26) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u9
            [3] = u10
            [4] = u7
            [5] = u16
        --]]
        u22.mountingUi = true
        local v27 = u9.LocalPlayer
        local v28 = u10.CurrentCamera
        if v28 ~= nil then
            v28 = v28.ViewportSize.Y
        end
        local v29 = v28 == nil and 374 or v28
        local u30 = u7.mount(u7.createElement(u16, {
            ["CurrentTasks"] = p26.tutorialData.currentTasks,
            ["ScreenSizeY"] = v29
        }), v27:WaitForChild("PlayerGui"))
        u22.tasksMaid:GiveTask(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u30
            --]]
            u7.unmount(u30)
        end)
        u22.mountingUi = false
    end)
    u13.Client:OnEvent("TutorialDialogueBegin", function(p31) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u15
            [4] = u22
            [5] = u17
        --]]
        local v32 = u9.LocalPlayer
        local u33 = u7.mount(u7.createElement(u15, {
            ["TutorialType"] = p31.tutorialType,
            ["Dialogue"] = u22:getStringsFromDialogue(p31.dialogue),
            ["TalkSound"] = u17
        }), v32:WaitForChild("PlayerGui"))
        u22.dialogueMaid:GiveTask(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u33
            --]]
            u7.unmount(u33)
        end)
    end)
    u13.Client:OnEvent("TutorialTasksComplete", function(_) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        task.spawn(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            while u22.mountingUi == true do
                task.wait(0.01)
            end
            u22.tasksMaid:DoCleaning()
        end)
    end)
end
function u18.closeDialogue(p34) --[[ Line: 92 ]]
    p34.dialogueMaid:DoCleaning()
end
function u18.getStringsFromDialogue(_, p35) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v36 = {}
    for _, v37 in p35 do
        if typeof(v37) == "string" then
            table.insert(v36, v37)
        else
            local v38 = u2.isMobileControls()
            if v38 then
                v38 = v37.mobileText
            end
            if v38 == "" or not v38 then
                local v39 = u2.isGamepadControls()
                if v39 then
                    v39 = v37.gamepadText
                end
                if v39 == "" or not v39 then
                    local v40 = v37.text
                    table.insert(v36, v40)
                else
                    local v41 = v37.gamepadText
                    table.insert(v36, v41)
                end
            else
                local v42 = v37.mobileText
                table.insert(v36, v42)
            end
        end
    end
    return v36
end
u4.CreateController(u18.new())
return nil