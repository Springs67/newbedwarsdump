local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "TeleportBlockController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p16)
    p16.Name = "TeleportBlockController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u3
        [3] = u8
        [4] = u12
        [5] = u4
        [6] = u6
        [7] = u10
        [8] = u9
    --]]
    u11.KnitStart(p17)
    u3("teleport_block", function(u18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u12
            [3] = u4
            [4] = u6
            [5] = u10
            [6] = u9
        --]]
        u18.Touched:Connect(function(p19) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u12
                [3] = u18
            --]]
            if u8.LocalPlayer.Character and p19.Parent == u8.LocalPlayer.Character then
                local v20 = {
                    ["teleportBlock"] = u18
                }
                u12.Client:Get("StepOnTeleportBlock"):SendToServer(v20)
            end
        end)
        u4("teleport_block", function(u21) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u10
                [3] = u9
            --]]
            local u22 = u21:WaitForChild("TeamIndicator")
            local u23 = u22.Position
            local u24 = u6.new()
            local u25 = u10:GetServerTimeNow()
            u24:GiveTask(u9.Heartbeat:Connect(function(p26) --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u21
                    [3] = u22
                    [4] = u23
                --]]
                u25 = u25 + p26
                if u21:GetAttribute("spouseIndex") ~= nil and u22.Transparency > 0 then
                    local v27 = u22
                    v27.Transparency = v27.Transparency - 0.002
                end
                local v28 = u25 * 1.2
                local v29 = math.sin(v28) + 0.2
                local v30 = Vector3.new(0, v29, 0)
                u22.CFrame = CFrame.new(u23 + v30)
            end))
            u22.AncestryChanged:Connect(function(_, p31) --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                if p31 == nil then
                    u24:DoCleaning()
                end
            end)
        end)
    end)
end
v5.CreateController(u13.new())
return nil