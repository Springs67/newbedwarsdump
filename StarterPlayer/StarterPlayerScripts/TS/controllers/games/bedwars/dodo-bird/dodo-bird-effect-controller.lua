local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "DodoBirdEffectController"
    end,
    ["__index"] = u8
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
function u11.constructor(p14, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p14, ...)
    p14.Name = "DodoBirdEffectController"
    p14.dodoBirdMountMaids = {}
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u7
        [4] = u4
        [5] = u2
        [6] = u10
        [7] = u6
    --]]
    u8.KnitStart(u15)
    u9("dodo-bird-mount", function(u16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u15
            [4] = u2
            [5] = u10
        --]]
        local v17 = u16.Parent
        u16.RootPart.ParticleAttachment.FeatherParticles.Enabled = false
        if v17 ~= nil and u7:GetPlayerFromCharacter(v17) ~= nil then
            local v18 = u4.new()
            u15.dodoBirdMountMaids[u16] = v18
            local u19 = 0
            v18:GiveTask(v17.Humanoid.StateChanged:Connect(function(p20, p21) --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u16
                    [3] = u2
                    [4] = u10
                --]]
                if p20 == Enum.HumanoidStateType.Freefall and (p21 == Enum.HumanoidStateType.Jumping and time() - u19 > 0.2) then
                    u19 = time()
                    u16.RootPart.ParticleAttachment.FeatherParticles:Emit(8)
                    if math.random(0, 1) == 1 then
                        u2:playSound(u10.DODO_BIRD_DOUBLE_JUMP, {
                            ["position"] = u16:GetPrimaryPartCFrame().Position
                        })
                        return
                    end
                    u2:playSound(u10.DODO_BIRD_JUMP, {
                        ["position"] = u16:GetPrimaryPartCFrame().Position
                    })
                end
            end))
        end
    end)
    u6:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p22) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        local v23 = u15.dodoBirdMountMaids[p22]
        if v23 ~= nil then
            v23:DoCleaning()
        end
        u15.dodoBirdMountMaids[p22] = nil
    end)
end
function u11.playSquawkSound(_, p24) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    local v25
    if math.random(0, 1) == 1 then
        v25 = u10.DODO_BIRD_SQUAWK_2
    else
        v25 = u10.DODO_BIRD_SQUAWK_1
    end
    u2:playSound(v25, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p24:GetPrimaryPartCFrame().Position
    })
end
v3.CreateController(u11.new())
return nil