local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.HttpService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v6.RunService
local u11 = v6.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u17 = v1.import(script, script.Parent, "ui", "aery-stack-ui").AeryStacksUi
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "AeryKitController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u13
    --]]
    u16.constructor(p21, u13.AERY)
    p21.Name = "AeryKitController"
end
function u18.onKitLocalActivated(u22, u23) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u2
        [4] = u15
        [5] = u9
        [6] = u11
        [7] = u4
        [8] = u7
        [9] = u10
    --]]
    u22:setUpTree()
    u14.Client:OnEvent("AeryGiveButterfly", function(p24) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u22
            [3] = u2
            [4] = u15
            [5] = u9
            [6] = u11
            [7] = u4
            [8] = u7
            [9] = u10
        --]]
        if not u8.LocalPlayer.Character then
            return nil
        end
        local u25 = u22:getKitSkinData(u8.LocalPlayer.Character)
        local v26 = u2
        local v27
        if u25 == nil then
            v27 = u25
        else
            v27 = u25.butterflySpawnSound
        end
        if v27 == nil then
            v27 = u15.AERY_BUTTERFLY_SPAWN
        end
        v26:playSound(v27)
        local v28 = false
        local v29 = 0
        while true do
            if v28 then
                v29 = v29 + 1
            else
                v28 = true
            end
            if v29 >= p24.amount then
                return
            end
            local v30
            if u25 == nil then
                v30 = u25
            else
                v30 = u25.butterflyEffect
            end
            local u31
            if v30 then
                u31 = u25.butterflyEffect:Clone()
            else
                u31 = u9.Assets.Effects.AeryButterfly:Clone()
            end
            u31.Parent = u11
            u31:PivotTo(CFrame.new(p24.position))
            local u32 = u4.new()
            u32:GiveTask(function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31:Destroy()
            end)
            local u33 = 0
            local u34 = v29 * 0.2 + 1.2
            local u35 = p24.givenToEntity:FindFirstChild("UpperTorso")
            if u35 == nil then
                return nil
            end
            local v36 = math.random(-2, 2)
            local v37 = math.random(3, 4)
            local v38 = math.random
            local u39 = Vector3.new(v36, v37, v38(-2, 2))
            local u40 = u7:GenerateGUID(false)
            u10:BindToRenderStep(u40, Enum.RenderPriority.Last.Value, function(p41) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u31
                    [3] = u33
                    [4] = u34
                    [5] = u39
                --]]
                if u35.Parent == nil then
                    return nil
                end
                if u31.PrimaryPart == nil then
                    return nil
                end
                u33 = u33 + p41
                local v42 = u33 / u34
                local v43 = math.clamp(v42, 0, 1)
                local v44 = u31.PrimaryPart.Position:Lerp(u35.Position, (math.sqrt(v43)))
                local v45 = v43 * 3.141592653589793
                local v46 = math.sin(v45)
                local v47 = v44 + u39 * Vector3.new(v46, v46, v46)
                u31:PivotTo(CFrame.new(v47))
            end)
            u32:GiveTask(function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u40
                --]]
                u10:UnbindFromRenderStep(u40)
            end)
            task.delay(u34, function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u25
                    [3] = u15
                    [4] = u32
                --]]
                local v48 = u2
                local v49 = u25
                if v49 ~= nil then
                    v49 = v49.butterflyConsumeSound
                end
                if v49 == nil then
                    v49 = u15.AERY_BUTTERFLY_CONSUME
                end
                v48:playSound(v49)
                u32:DoCleaning()
            end)
        end
    end):andThen(function(p50) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:GiveTask(p50)
    end)
end
function u18.onKitLocalDeactivated(p51) --[[ Line: 129 ]]
    p51:unmountTree()
end
function u18.onKitReplicationActivated(_, _) --[[ Line: 132 ]] end
function u18.onKitReplicationDeactivated(_) --[[ Line: 134 ]] end
function u18.onInnateAbilityEnabled(_, _, _) --[[ Line: 136 ]] end
function u18.onAbilityUsed(_, _, _) --[[ Line: 138 ]] end
function u18.setUpTree(u52) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u5
        [4] = u17
    --]]
    u52:unmountTree()
    if not u52.aeryStackTree then
        local v53 = {
            ["aeryStacks"] = u8.LocalPlayer:GetAttribute("AeryStacks")
        }
        u52.aeryStackTree = u3.Controllers.StatusInfoListController:waitForSetupAddElement(u5.createElement(u17, v53))
    end
    u8.LocalPlayer:GetAttributeChangedSignal("AeryStacks"):Connect(function(_) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52:updateTree()
    end)
end
function u18.updateTree(p54) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u17
    --]]
    if p54.aeryStackTree then
        local v55 = {
            ["aeryStacks"] = u8.LocalPlayer:GetAttribute("AeryStacks")
        }
        u5.update(p54.aeryStackTree, u5.createElement(u17, v55))
    end
end
function u18.unmountTree(p56) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p56.aeryStackTree then
        u5.unmount(p56.aeryStackTree)
        p56.aeryStackTree = nil
    end
end
function u18.getKitSkinData(_, p57) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
    --]]
    if p57 then
        return u12[u3.Controllers.KitSkinController:getKitSkin(p57)].aery
    else
        return nil
    end
end
u3.CreateController(u18.new())
return nil