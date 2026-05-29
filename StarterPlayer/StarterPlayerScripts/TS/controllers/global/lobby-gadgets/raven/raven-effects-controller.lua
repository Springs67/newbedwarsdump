local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v2.WatchCharacter
local u8 = v2.WatchCollectionTag
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "RavenEffectsController"
    end,
    ["__index"] = u17
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25, ...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u12
        [3] = u16
    --]]
    u17.constructor(p25, ...)
    p25.Name = "RavenEffectsController"
    p25.ravenEffectsFolder = u12("Folder", {
        ["Name"] = "RavenEffects",
        ["Parent"] = u16
    })
end
function u22.KnitStart(u26) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
        [3] = u18
        [4] = u7
        [5] = u14
        [6] = u15
        [7] = u1
        [8] = u20
        [9] = u6
        [10] = u21
        [11] = u4
        [12] = u8
        [13] = u3
        [14] = u19
        [15] = u5
        [16] = u12
    --]]
    u17.KnitStart(u26)
    u11.Controllers.PreloadController:runPreload({
        ["animations"] = { u18.RAVEN_SPAWN, u18.RAVEN_LOOP }
    })
    u7(function(u27, u28, u29) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u1
        --]]
        if u27 == u14.LocalPlayer then
            return nil
        end
        local u30 = nil
        local u31 = nil
        local function u39(p32) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u28
                [3] = u15
                [4] = u30
                [5] = u1
                [6] = u29
            --]]
            if p32 == 0 or (p32 ~= p32 or (not p32 or p32 < os.time())) then
                local v33 = u31
                if v33 ~= nil then
                    v33 = v33.Parent
                end
                if v33 then
                    u31:Destroy()
                end
                return nil
            end
            local v34 = u28:FindFirstChild("Head")
            if not v34 then
                return nil
            end
            local v35 = u31
            if v35 ~= nil then
                v35 = v35.Parent
            end
            if not v35 then
                u31 = u15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("PoisonParticle"):FindFirstChildWhichIsA("Attachment"):Clone()
                u31.Parent = v34
            end
            if u30 then
                u30:cancel()
            end
            u30 = u1.Promise.delay(p32 - os.time()):andThen(function() --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                local v36 = u31
                if v36 ~= nil then
                    v36:Destroy()
                end
            end)
            u29:GiveTask(function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u31
                --]]
                local v37 = u30
                if v37 ~= nil then
                    v37:cancel()
                end
                local v38 = u31
                if v38 ~= nil then
                    v38:Destroy()
                end
            end)
        end
        u39(u27:GetAttribute("RavenPoisonEndTime"))
        u29:GiveTask(u27:GetAttributeChangedSignal("RavenPoisonEndTime"):Connect(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u27
            --]]
            u39(u27:GetAttribute("RavenPoisonEndTime"))
        end))
    end)
    u20.Client:WaitFor("DetonateRaven"):andThen(function(p40) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u15
            [4] = u4
            [5] = u26
            [6] = u1
        --]]
        return p40:Connect(function(p41) --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u21
                [3] = u15
                [4] = u4
                [5] = u26
                [6] = u1
            --]]
            local v42 = p41.position
            u6:playSound(u21.TNT_EXPLODE_1, {
                ["position"] = v42
            })
            local u43 = u15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Explosion"):Clone()
            u4:setQueryIgnored(u43, true)
            u43.Position = v42
            u43.Parent = u26.ravenEffectsFolder
            for _, v44 in u43:GetDescendants() do
                if v44:IsA("ParticleEmitter") then
                    v44:Emit(v44.Rate)
                end
            end
            u1.Promise.delay(5):andThen(function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                u43:Destroy()
            end)
        end)
    end)
    u8("raven", function(u45) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u14
            [4] = u3
            [5] = u19
            [6] = u18
            [7] = u5
            [8] = u12
        --]]
        local v46 = u45:WaitForChild("AnimationController"):WaitForChild("Animator")
        local v47 = u6
        local v48 = u21.RAVEN_CAW
        local v49 = {}
        local v50
        if u45:GetAttribute("PlayerUserId") == u14.LocalPlayer.UserId then
            v50 = nil
        else
            v50 = u45:GetPrimaryPartCFrame().Position
        end
        v49.position = v50
        v47:playSound(v48, v49)
        local v51 = (u45:GetAttribute("FromKillEffect") == false or u45:GetAttribute("FromKillEffect") == nil) and u3:playAnimation(v46, u19:getAssetId(u18.RAVEN_SPAWN))
        if v51 then
            v51.Stopped:Wait()
        end
        if v46.Parent and u45.Parent then
            local v52 = u3:playAnimation(v46, u19:getAssetId(u18.RAVEN_LOOP), {
                ["fadeInTime"] = 0.01
            })
            if v52 ~= nil then
                v52:GetMarkerReachedSignal("flap"):Connect(function() --[[ Line: 148 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u5
                        [3] = u21
                        [4] = u45
                        [5] = u14
                    --]]
                    local v53 = u6
                    local v54 = u5.fromList(u21.RAVEN_WING_FLAP_1, u21.RAVEN_WING_FLAP_2, u21.RAVEN_WING_FLAP_3)
                    local v55 = {}
                    local v56
                    if u45:GetAttribute("PlayerUserId") == u14.LocalPlayer.UserId then
                        v56 = nil
                    else
                        v56 = u45:GetPivot().Position
                    end
                    v55.position = v56
                    v53:playSound(v54, v55)
                end)
            end
            u45:PivotTo(u45:GetPivot() * CFrame.new(Vector3.new(-0.33429432, 7.173812, -2.5612288)))
            u12("BoolValue", {
                ["Name"] = "Flying",
                ["Value"] = true,
                ["Parent"] = u45
            })
        end
    end)
end
v10.CreateController(u22.new())
return nil