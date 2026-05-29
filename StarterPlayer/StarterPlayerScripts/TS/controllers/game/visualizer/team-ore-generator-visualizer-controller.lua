local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Workspace
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TeamOreGeneratorVisualizerController"
    end,
    ["__index"] = u9
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p14)
    p14.Name = "TeamOreGeneratorVisualizerController"
end
function u11.KnitStart(_) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u10
        [3] = u5
        [4] = u8
        [5] = u7
        [6] = u4
        [7] = u3
    --]]
    u1.Promise.retryWithDelay(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u8
            [4] = u7
            [5] = u4
            [6] = u3
        --]]
        return u10.Client:Get("GetAllTeamGenerators"):CallServerAsync():andThen(function(p15) --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u7
            --]]
            local function v18(p16) --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u8
                    [3] = u7
                --]]
                local v17 = u5("CFrameValue", {
                    ["Name"] = "cframe-" .. p16.id,
                    ["Parent"] = u8,
                    ["Value"] = CFrame.new(p16.position)
                })
                v17:SetAttribute("id", p16.id)
                v17:SetAttribute("teamId", p16.teamId)
                v17:SetAttribute("position", v17.Value.Position)
                u7:AddTag(v17, "TeamOreGeneratorVisualizer")
            end
            for v19, v20 in p15 do
                v18(v20, v19 - 1, p15)
            end
        end):catch(function(p21) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
            --]]
            return u4.Warn("Failed to setup generator visuals with error reason: " .. u3(p21))
        end)
    end, 3, 10)
end
v2.CreateController(u11.new())
return nil