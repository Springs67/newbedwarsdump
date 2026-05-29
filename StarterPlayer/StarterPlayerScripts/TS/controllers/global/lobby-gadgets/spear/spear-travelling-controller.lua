local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.RunService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "SpearTravellingController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, ...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p16, ...)
    p16.Name = "SpearTravellingController"
    p16.maids = {}
    p16.random = Random.new()
end
function u13.KnitStart(u17) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u2
        [4] = u12
        [5] = u5
        [6] = u6
        [7] = u4
        [8] = u9
        [9] = u10
    --]]
    u11.KnitStart(u17)
    u8:GetInstanceAddedSignal("spear-projectile"):Connect(function(u18) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u5
            [4] = u17
            [5] = u6
            [6] = u4
            [7] = u9
        --]]
        u2:playSound(u12.WIZARD_ORB_TRAVEL_LOOP, {
            ["rollOffMaxDistance"] = 100,
            ["parent"] = u18.PrimaryPart,
            ["position"] = u18:GetPrimaryPartCFrame().Position
        })
        local v19 = u5.new()
        u17.maids[u18] = v19
        local v20 = u17.random:NextInteger(3, 6)
        local u21 = table.create(v20)
        local v22 = false
        local v23 = 0
        while true do
            if v22 then
                v23 = v23 + 1
            else
                v22 = true
            end
            if v23 >= v20 then
                v19:GiveTask(function() --[[ Line: 82 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    for _, v24 in u21 do
                        v24.arc:Destroy()
                        v24.goalAttachment:Destroy()
                        v24.sourceAttachment:Destroy()
                    end
                end)
                v19:GiveTask(u9.Heartbeat:Connect(function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u18
                    --]]
                    for _, v25 in u21 do
                        if u18.PrimaryPart == nil then
                            return nil
                        end
                        local v26 = u18:GetPrimaryPartCFrame().Position
                        local v27 = CFrame
                        local v28 = u18.PrimaryPart.AssemblyLinearVelocity.Unit
                        local v29 = v27.lookAt(v26, v26 + v28) * CFrame.new(0, 0, -5)
                        local v30 = v29 * CFrame.new(math.noise(time() * 5, 0, v25.seed) * 4, math.noise(time() * 5, 0, -v25.seed) * 4, 10 + math.noise(time() * 5, 0, v25.seed + v25.seed) * 2)
                        v25.sourceAttachment.WorldCFrame = v29
                        v25.goalAttachment.WorldCFrame = v30
                    end
                end))
                return
            end
            local v31 = u6("Attachment", {
                ["Parent"] = u18.PrimaryPart
            })
            local v32 = u6("Attachment", {
                ["Parent"] = u18.PrimaryPart
            })
            local v33 = u4.link(v31, v32, Color3.fromRGB(0, 0, 0), nil, 1)
            v33:SetColor(Color3.fromRGB(97, 157, 236):Lerp(Color3.fromRGB(70, 109, 236), u17.random:NextNumber()))
            local v34 = {
                ["goalAttachment"] = v32,
                ["sourceAttachment"] = v31,
                ["seed"] = u17.random:NextNumber(0, 100),
                ["arc"] = v33
            }
            table.insert(u21, v34)
        end
    end)
    u8:GetInstanceRemovedSignal("spear-projectile"):Connect(function(p35) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v36 = u17.maids[p35]
        if v36 ~= nil then
            v36:DoCleaning()
        end
        u17.maids[p35] = nil
    end)
    u10.ProjectileLaunched:connect(function(p37) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if p37.projectileType == "spear" then
            u8:AddTag(p37.projectile, "spear-projectile")
        end
    end)
end
v3.CreateController(u13.new())
return nil