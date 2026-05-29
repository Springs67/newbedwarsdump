local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v2 = {}
local u3 = setmetatable({}, {
    ["__index"] = v2
})
u3.LIGHT = "Light"
v2.Light = "LIGHT"
u3.VOID = "Void"
v2.Void = "VOID"
local v4 = {
    ["ANGEL_TIERS"] = {
        {
            ["level"] = 0,
            ["damageToLevelUp"] = 100,
            ["lightShieldAmount"] = 0,
            ["voidDecayMaxValue"] = 0,
            ["voidDecayMaxStacks"] = 0
        },
        {
            ["level"] = 1,
            ["damageToLevelUp"] = 150,
            ["lightShieldAmount"] = 2,
            ["voidDecayMaxValue"] = 0.25,
            ["voidDecayMaxStacks"] = 6
        },
        {
            ["level"] = 2,
            ["damageToLevelUp"] = 200,
            ["lightShieldAmount"] = 3,
            ["voidDecayMaxValue"] = 0.35,
            ["voidDecayMaxStacks"] = 6
        },
        {
            ["level"] = 3,
            ["damageToLevelUp"] = 250,
            ["lightShieldAmount"] = 4,
            ["voidDecayMaxValue"] = 0.45,
            ["voidDecayMaxStacks"] = 6
        },
        {
            ["level"] = 4,
            ["damageToLevelUp"] = 500,
            ["lightShieldAmount"] = 6,
            ["voidDecayMaxValue"] = 0.6,
            ["voidDecayMaxStacks"] = 6
        }
    }
}
local u5 = {
    ["Base"] = {
        ["texture"] = "rbxassetid://7539909078"
    }
}
local v6 = u3.LIGHT
local v7 = {
    ["texture"] = "rbxassetid://7478451250",
    ["neon"] = {
        ["color"] = Color3.fromRGB(117, 161, 255)
    },
    ["beams"] = {
        ["colorSequence"] = ColorSequence.new(Color3.fromRGB(90, 170, 255), Color3.fromRGB(56, 186, 255))
    },
    ["halos"] = {
        ["color"] = Color3.fromRGB(255, 126, 75)
    }
}
u5[v6] = v7
local v8 = u3.VOID
local v9 = {
    ["texture"] = "rbxassetid://7478260534",
    ["neon"] = {
        ["color"] = Color3.fromRGB(255, 94, 89)
    },
    ["beams"] = {
        ["colorSequence"] = ColorSequence.new(Color3.fromRGB(255, 62, 62), Color3.fromRGB(255, 80, 80))
    }
}
u5[v8] = v9
local function u13(p10, p11) --[[ Line: 78 ]]
    for _, v12 in p10:GetDescendants() do
        if v12:IsA("MeshPart") then
            v12.Transparency = p11 and 0 or 1
        elseif v12:IsA("Beam") then
            v12.Enabled = p11
            v12:SetAttribute("FirstPersonVisible_UpdateDisabled", not p11)
        elseif v12:IsA("ParticleEmitter") then
            v12.Enabled = p11
            v12:SetAttribute("FirstPersonVisible_UpdateDisabled", not p11)
        elseif v12:IsA("Decal") then
            v12.Transparency = p11 and 0.35 or 1
        end
    end
end
function v4.changeAngelAppearance(p14, p15) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u13
        [4] = u5
    --]]
    if p14:GetAttribute("KitSkin") == u1.TRINITY_FALLEN then
        local v16 = p14:FindFirstChild("3DClothing")
        local v17 = p14:FindFirstChild("3DClothing_Light")
        local v18 = p14:FindFirstChild("3DClothing_Dark")
        if v16 == nil or (v17 == nil or v18 == nil) then
            return nil
        elseif p15 == u3.LIGHT then
            u13(v16, false)
            u13(v17, true)
            u13(v18, false)
            return
        elseif p15 == u3.VOID then
            u13(v16, false)
            u13(v17, false)
            u13(v18, true)
        else
            u13(v16, true)
            u13(v17, false)
            u13(v18, false)
        end
    else
        local v19 = u5[p15]
        for _, v20 in p14:GetDescendants() do
            if v20:IsA("MeshPart") then
                if v20.Name == "Mesh/Neon" then
                    if v19.neon then
                        v20.TextureID = ""
                        v20.Color = v19.neon.color
                    else
                        v20.TextureID = v19.texture
                    end
                elseif v20.Name == "Mesh/NeonException" then
                    if v19.neon then
                        v20.Transparency = 0
                        v20.Color = v19.neon.color
                    else
                        v20.Transparency = 1
                    end
                elseif v20.Name == "Mesh/Halo" then
                    if v19.halos then
                        v20.Transparency = 0
                        v20.Color = v19.halos.color
                    else
                        v20.Transparency = 1
                    end
                else
                    local v21 = v20.TextureID
                    if v21 ~= "" and v21 then
                        v20.TextureID = v19.texture
                    end
                end
            elseif v20:IsA("Beam") then
                if v19.beams then
                    v20:SetAttribute("FirstPersonVisible", false)
                    v20.Enabled = true
                    v20.Color = v19.beams.colorSequence
                else
                    v20:SetAttribute("FirstPersonVisible", nil)
                    v20.Enabled = false
                end
            end
        end
        return
    end
end
return {
    ["AngelType"] = u3,
    ["AngelKitUtil"] = v4
}