local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_getClawData
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "SummonerClawController"
    end,
    ["__index"] = u16
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p26)
    p26.Name = "SummonerClawController"
    p26.clawColors = {
        Color3.fromRGB(75, 75, 75),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(43, 229, 229),
        Color3.fromRGB(49, 229, 94)
    }
    p26.debugging = false
end
function u23.KnitStart(u27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u21
        [3] = u12
    --]]
    u16.KnitStart(u27)
    u21.Client:Get("SummonerClawAttackFromServer"):Connect(function(p28, p29, p30, p31) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u27
        --]]
        if p28 ~= u12.LocalPlayer then
            u27:clawAttack(p28, p29, p30, p31)
        end
    end)
end
function u23.clawAttack(p32, p33, _, p34, p35) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u19
        [4] = u13
        [5] = u8
        [6] = u15
        [7] = u12
        [8] = u20
        [9] = u22
        [10] = u5
        [11] = u4
        [12] = u3
        [13] = u18
        [14] = u17
        [15] = u14
        [16] = u10
    --]]
    local v36 = p33.Character
    if not v36 then
        return nil
    end
    local v37 = v36.PrimaryPart
    if not v37 then
        return nil
    end
    local u38 = u9.new()
    local v39 = u19[u7.Controllers.KitSkinController:getKitSkin(v36)]
    local v40 = u13.Assets.Misc.Kaida.Summoner_DragonClaw
    local v41 = v39.kaida
    if v41 ~= nil then
        v41 = v41.dragon_claw
    end
    if v41 then
        v40 = v39.kaida.dragon_claw
    end
    local u42 = v40:Clone()
    if u8.Controllers.SummonerKitSkinController:isPrismaticSkin(p33) then
        u8.Controllers.SummonerKitSkinController:applyClawRGB(u42)
    end
    u42.Parent = u15
    local v43 = 0
    local u44 = {}
    for v45, v46 in u42:GetChildren() do
        local _ = v45 - 1
        if v46:IsA("MeshPart") == true then
            v43 = v43 + 1
            u44[v43] = v46
        end
    end
    local v47 = u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
    if p33 == u12.LocalPlayer and v47 then
        for v48, v49 in u44 do
            local _ = v48 - 1
            v49.Transparency = 0.6
        end
    end
    local v50 = p32.clawColors[u20(p35).level - 1 + 1]
    u42.dragon_claw_nail_mesh.Color = v50
    local v51
    if v39 == nil then
        v51 = v39
    else
        v51 = v39.kaida
        if v51 ~= nil then
            v51 = v51.clawAttackSounds
        end
    end
    local v52
    if v51 then
        v52 = v39.kaida.clawAttackSounds
    else
        v52 = {
            u22.SUMMONER_CLAW_ATTACK_1,
            u22.SUMMONER_CLAW_ATTACK_2,
            u22.SUMMONER_CLAW_ATTACK_3,
            u22.SUMMONER_CLAW_ATTACK_4
        }
    end
    u5:playSound(u4.fromList(unpack(v52)), {
        ["position"] = v37.Position
    })
    if p33 == u12.LocalPlayer then
        u3:playAnimation(p33, u18:getAssetId(u17.SUMMONER_CHARACTER_SWIPE), {
            ["looped"] = false
        })
    end
    local v53 = p34.X
    local v54 = p34.Z
    local v55 = Vector3.new(v53, 0, v54).Unit
    local v56 = v55:Cross(Vector3.new(0, 1, 0)).Unit * -1
    local v57 = v37.Position + v56 * 5 + v55 * 6
    local v58 = (v57 + p34 * 13 - v57).Unit
    local v59 = CFrame.new(v57, v57 + v58)
    u42:PivotTo(v59)
    u42.PrimaryPart.Anchored = true
    if u14:IsStudio() and p32.debugging then
        u10("Part", {
            ["Size"] = Vector3.new(0.1, 0.1, 4),
            ["Parent"] = u15,
            ["Position"] = v57 + v58 * 2,
            ["Anchored"] = true,
            ["BrickColor"] = BrickColor.new("Bright red"),
            ["CanCollide"] = false
        }):PivotTo(v59)
    end
    local u60
    if u42:FindFirstChild("Portal1") then
        u60 = u14.Heartbeat:Connect(function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v61 = u42.RootPart.root.fore_arm.TransformedWorldCFrame
            local v62 = u42.Portal1
            if v62 ~= nil then
                v62:PivotTo(v61)
            end
            local v63 = v61 * CFrame.Angles(3.141592653589793, 0, 0)
            local v64 = u42.Portal2
            if v64 ~= nil then
                v64:PivotTo(v63)
            end
        end)
    else
        u60 = nil
    end
    u3:playAnimation(u42.AnimationController.Animator, u18:getAssetId(u17.SUMMONER_CLAW_ATTACK), {
        ["looped"] = false,
        ["speed"] = 1
    })
    task.wait(0.5)
    local u65 = 0
    local u66 = v47 and 0.6 or 0
    local u73 = u14.Heartbeat:Connect(function(p67) --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u66
            [3] = u44
        --]]
        u65 = u65 + p67
        local v68 = u65 / 0.25
        local v69 = u66
        local v70 = math.clamp(v68, v69, 1)
        for v71, v72 in u44 do
            local _ = v71 - 1
            v72.Transparency = v70
        end
    end)
    task.delay(0.25, function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u73
            [3] = u60
            [4] = u42
        --]]
        u38:DoCleaning()
        u73:Disconnect()
        local v74 = u60
        if v74 ~= nil then
            v74:Disconnect()
        end
        u42:Destroy()
    end)
end
u7.CreateController(u23.new())
return nil