local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ScriptInputController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.constructor(p10)
    p10.Name = "ScriptInputController"
    p10.trackedKeyCodeSet = {}
    p10.inputBeganConnectionMap = {}
    p10.inputEndedConnectionMap = {}
    p10.lastKeyCodeBeganMap = {}
    p10.lastKeyCodeEndedMap = {}
    p10.inputEvent = u6.Client:Get("ScriptTrackedInputEvent")
end
function u7.KnitStart(u11) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u3
        [4] = u4
    --]]
    u5.KnitStart(u11)
    u6.Client:OnEvent("ScriptStartTrackingInput", function(p12) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
            [3] = u4
        --]]
        u11.trackedKeyCodeSet[p12.keyCode] = true
        local v13 = u3.new()
        v13:GiveTask((u4.InputBegan:Connect(function(p14) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            local v15 = os.clock()
            local v16 = u11.lastKeyCodeBeganMap[p14.KeyCode]
            if v15 - (v16 == nil and -1 or v16) < 0.005 then
                return nil
            end
            u11.lastKeyCodeBeganMap[p14.KeyCode] = os.clock()
            if u11.trackedKeyCodeSet[p14.KeyCode] ~= nil then
                u11.inputEvent:SendToServer({
                    ["activationTime"] = "began",
                    ["keyCode"] = p14.KeyCode
                })
            end
        end)))
        u11.inputBeganConnectionMap[p12.keyCode] = v13
        local v17 = u3.new()
        v17:GiveTask((u4.InputEnded:Connect(function(p18) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            local v19 = os.clock()
            local v20 = u11.lastKeyCodeEndedMap[p18.KeyCode]
            if v19 - (v20 == nil and -1 or v20) < 0.005 then
                return nil
            end
            u11.lastKeyCodeEndedMap[p18.KeyCode] = os.clock()
            if u11.trackedKeyCodeSet[p18.KeyCode] ~= nil then
                u11.inputEvent:SendToServer({
                    ["activationTime"] = "ended",
                    ["keyCode"] = p18.KeyCode
                })
            end
        end)))
        u11.inputEndedConnectionMap[p12.keyCode] = v17
    end)
    u6.Client:OnEvent("ScriptEndTrackingInput", function(p21) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11.trackedKeyCodeSet[p21.keyCode] = nil
        local v22 = u11.inputBeganConnectionMap[p21.keyCode]
        if v22 then
            v22:DoCleaning()
            u11.inputBeganConnectionMap[p21.keyCode] = nil
            u11.lastKeyCodeBeganMap[p21.keyCode] = nil
        end
        local v23 = u11.inputEndedConnectionMap[p21.keyCode]
        if v23 then
            v23:DoCleaning()
            u11.inputEndedConnectionMap[p21.keyCode] = nil
            u11.lastKeyCodeEndedMap[p21.keyCode] = nil
        end
    end)
end
v2.CreateController(u7.new())
return nil