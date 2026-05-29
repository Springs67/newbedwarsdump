local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.TweenService
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "NukeController"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(_) --[[ Line: 24 ]] end
function u11.onStart(_) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u8
        [4] = u3
        [5] = u10
        [6] = u7
    --]]
    u9.Client:OnEvent("Nuke", function(p14) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u3
            [4] = u10
            [5] = u7
        --]]
        local v15 = u5("Part", {
            ["Name"] = "NukePart",
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Transparency"] = 0.6,
            ["Size"] = Vector3.new(30, 30, 30),
            ["Position"] = p14.position,
            ["Color"] = Color3.fromRGB(255, 255, 255),
            ["Material"] = Enum.Material.Neon,
            ["Shape"] = Enum.PartType.Ball,
            ["Parent"] = u8
        })
        task.wait(0.2)
        u5("EqualizerSoundEffect", {
            ["Enabled"] = true,
            ["HighGain"] = 5,
            ["LowGain"] = 6,
            ["MidGain"] = 0,
            ["Parent"] = u3:playModifiableSound(u10.TNT_EXPLODE_1, {
                ["volumeMultiplier"] = 6,
                ["rollOffMaxDistance"] = 10000,
                ["position"] = p14.position
            })
        })
        local v16 = u7:Create(v15, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
            ["Size"] = Vector3.new(100, 100, 100),
            ["Color"] = Color3.fromRGB(250, 148, 28)
        })
        v16:Play()
        v16.Completed:Wait()
        local v17 = u7:Create(v15, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
            ["Size"] = Vector3.new(150, 150, 150),
            ["Transparency"] = 1
        })
        v17:Play()
        v17.Completed:Wait()
        v15:Destroy()
    end)
end
v2.defineMetadata(u11, "identifier", "client/controllers/games/bedwars/lucky-blocks/nuke/nuke-controller@NukeController")
v2.defineMetadata(u11, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u11, "$:flamework@Controller", v4, {
    {}
})
return {
    ["default"] = u11
}