local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.TweenService
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = {
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(255, 0, 255)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(3, 77, 253)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(41, 246, 255)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(43, 255, 14)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(249, 243, 28)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(250, 105, 9)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(254, 41, 174)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(112, 0, 255)
    },
    {
        ["time"] = 0.4,
        ["color"] = Color3.fromRGB(140, 255, 0)
    }
}
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "RaveKillEffect"
    end,
    ["__index"] = u15
})
u17.__index = u17
function u17.new(...) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p20, p21)
    u15.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, p24) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u14
        [4] = u6
        [5] = u10
        [6] = u15
        [7] = u4
        [8] = u13
        [9] = u3
        [10] = u12
        [11] = u11
        [12] = u16
        [13] = u9
    --]]
    local u25 = u5.new()
    p23.Archivable = true
    local v26 = p23:Clone()
    v26:PivotTo(p24)
    local u27 = {}
    for _, v28 in v26:GetDescendants() do
        if v28:IsA("BasePart") then
            v28.Material = Enum.Material.ForceField
            v28.Color = Color3.fromRGB(0, 0, 0)
            if v28:IsA("MeshPart") then
                v28.TextureID = ""
            end
            table.insert(u27, v28)
        elseif v28:IsA("Texture") then
            v28:Destroy()
        elseif v28:IsA("Shirt") then
            v28:Destroy()
        end
    end
    local u29 = u8.Assets.Effects.RaveHelmet:Clone()
    u29.Parent = v26
    v26:WaitForChild("Humanoid"):AddAccessory(u29)
    u14:weldCharacterAccessories(v26)
    local u30 = u6("Highlight", {
        ["FillTransparency"] = 1,
        ["OutlineTransparency"] = 0,
        ["Parent"] = v26,
        ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
        ["FillColor"] = Color3.fromRGB(255, 255, 255),
        ["DepthMode"] = Enum.HighlightDepthMode.Occluded
    })
    v26.Parent = u10
    u15.hideCharacter(p22, p23)
    local u31 = u4:playSound(u13.RAVE_MUSIC, {
        ["position"] = v26:GetPivot().Position
    })
    local u32 = u3:playAnimation(v26:WaitForChild("Humanoid"):WaitForChild("Animator"), u12:getAssetId(u11.WIGGLE), {
        ["looped"] = true
    })
    if u32 ~= nil then
        u32:AdjustSpeed(2)
    end
    u25:GiveTask(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        if u31 then
            u31:Destroy()
        end
    end)
    u25:GiveTask(function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32 then
            u32:Destroy()
        end
    end)
    u25:GiveTask(v26)
    task.spawn(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u9
            [3] = u30
            [4] = u27
            [5] = u29
        --]]
        local v33 = false
        local v34 = 0
        while true do
            if v33 then
                v34 = v34 + 1
            else
                v33 = true
            end
            if v34 >= #u16 then
                return
            end
            u9:Create(u30, TweenInfo.new(u16[v34 + 1].time), {
                ["OutlineColor"] = u16[v34 + 1].color
            }):Play()
            for _, v35 in u27 do
                u9:Create(v35, TweenInfo.new(u16[v34 + 1].time), {
                    ["Color"] = u16[v34 + 1].color
                }):Play()
            end
            for _, v36 in u29:GetDescendants() do
                if v36:IsA("BasePart") and v36.Name ~= "Handle" then
                    u9:Create(v36, TweenInfo.new(u16[v34 + 1].time), {
                        ["Color"] = u16[v34 + 1].color
                    }):Play()
                end
            end
            task.wait(u16[v34 + 1].time)
        end
    end)
    task.delay(2.7, function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u29
        --]]
        for _, v37 in u27 do
            u9:Create(v37, TweenInfo.new(0.5), {
                ["Transparency"] = 1
            }):Play()
        end
        for _, v38 in u29:GetDescendants() do
            if v38:IsA("BasePart") then
                u9:Create(v38, TweenInfo.new(0.5), {
                    ["Transparency"] = 1
                }):Play()
            end
        end
    end)
    task.delay(#u16 * 0.4, function() --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:DoCleaning()
    end)
    return u25
end
return u17