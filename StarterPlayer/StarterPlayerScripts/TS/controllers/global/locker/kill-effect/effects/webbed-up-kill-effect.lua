local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.TweenService
local u8 = v5.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u12 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "WebbedUpKillEffect"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, p17)
    u12.setPlayDefaultKillEffect(p16, false)
end
function u13.onKill(p18, _, p19, u20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u12
        [4] = u6
        [5] = u4
        [6] = u9
        [7] = u7
        [8] = u1
        [9] = u2
        [10] = u10
        [11] = u11
    --]]
    local u21 = u3.new()
    p19.Archivable = true
    local u22 = p19:Clone()
    u22.HumanoidRootPart.Anchored = true
    u22.HumanoidRootPart.CanTouch = false
    u22.HumanoidRootPart.CFrame = u20
    u22.Parent = u8
    u21:GiveTask(u22)
    u12.hideCharacter(p18, p19)
    local v23 = u22:GetDescendants()
    local function v25(p24) --[[ Line: 46 ]]
        if p24:IsA("GuiObject") then
            p24.Transparency = 1
            return
        elseif p24:IsA("UIStroke") then
            p24.Transparency = 1
            return
        elseif p24:IsA("Decal") then
            p24.Transparency = 1
        elseif p24.Name == "_DamageHighlight_" then
            p24:Destroy()
        end
    end
    for v26, v27 in v23 do
        v25(v27, v26 - 1, v23)
    end
    local u28 = u6.Assets.Effects.WebEffectFolder:Clone()
    u21:GiveTask(u28)
    local v29 = u4("Attachment", {
        ["Name"] = "WebRootAttachment",
        ["Parent"] = u22.HumanoidRootPart,
        ["CFrame"] = CFrame.new(Vector3.new(0, 30, 0))
    })
    local v30 = u4("Attachment", {
        ["Parent"] = u22.HumanoidRootPart,
        ["CFrame"] = CFrame.new(Vector3.new(0, 30, 0))
    })
    u21:GiveTask((u4("Beam", {
        ["FaceCamera"] = true,
        ["TextureSpeed"] = 0.5,
        ["Parent"] = u22.HumanoidRootPart,
        ["Attachment0"] = v29,
        ["Attachment1"] = v30,
        ["Texture"] = u9.WEB_FLAT,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["Transparency"] = NumberSequence.new(0)
    })))
    local v31 = u7:Create(v29, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        ["WorldCFrame"] = u22.HumanoidRootPart.CFrame
    })
    local u32 = u7:Create(u22.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
        ["Transparency"] = 1,
        ["CFrame"] = v30.WorldCFrame
    })
    u21:GiveTask(v31)
    u21:GiveTask(u32)
    local u33 = u1.Promise.delay(0.5):andThen(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u2
            [3] = u10
            [4] = u20
        --]]
        u21:GiveTask(u2:playSound(u10.SPIDER_WEB, {
            ["position"] = u20.Position
        }))
    end)
    u21:GiveTask(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        return u33:cancel()
    end)
    v31:Play()
    v31.Completed:Once(function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u22
            [3] = u28
            [4] = u32
        --]]
        u11:weldCharacterAccessories(u22, u28)
        u22.HumanoidRootPart.Anchored = false
        u32:Play()
    end)
    u32.Completed:Once(function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        return u21:DoCleaning()
    end)
    task.delay(1.8, function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        return u21:DoCleaning()
    end)
    return u21
end
return u13