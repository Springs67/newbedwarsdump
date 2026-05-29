local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCharacterAnimation
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u15 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "PushUpGlassesEmoteController"
    end,
    ["__index"] = u8
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p19)
    p19.Name = "PushUpGlassesEmoteController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u11
        [4] = u15
        [5] = u7
        [6] = u3
        [7] = u14
        [8] = u4
        [9] = u10
        [10] = u9
        [11] = u6
        [12] = u13
        [13] = u12
    --]]
    u8.KnitStart(p20)
    local v21 = u5.Controllers.EmoteHandlerController
    local v22 = u11.PUSH_UP_GLASSSES
    local u23 = u15
    local u24 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
            return "Anonymous"
        end,
        ["__index"] = u23
    })
    u24.__index = u24
    function u24.new(...) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        local v25 = u24
        local v26 = setmetatable({}, v25)
        return v26:constructor(...) or v26
    end
    function u24.constructor(p27, ...) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.constructor(p27, ...)
    end
    function u24.onEnable(u28, u29, u30, _, u31) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u14
            [4] = u4
            [5] = u10
            [6] = u9
            [7] = u6
            [8] = u13
            [9] = u12
        --]]
        local v32 = u30:GetChildren()
        local function v39(u33) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            if not u33:IsA("Accessory") then
                return nil
            end
            local v34 = u33:FindFirstChild("Handle")
            if v34 ~= nil then
                v34 = v34:FindFirstChild("FaceFrontAttachment")
            end
            if not v34 then
                return nil
            end
            for v35, v36 in u33:GetDescendants() do
                local _ = v35 - 1
                if v36:IsA("BasePart") then
                    v36.Transparency = 1
                end
            end
            u31:GiveTask(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                for v37, v38 in u33:GetDescendants() do
                    local _ = v37 - 1
                    if v38:IsA("BasePart") then
                        v38.Transparency = 0
                    end
                end
            end)
        end
        for v40, v41 in v32 do
            v39(v41, v40 - 1, v32)
        end
        local u42 = u7.Assets.Misc.AnimeGlasses:Clone()
        u42.Parent = u30
        for v43, v44 in u42:GetDescendants() do
            local _ = v43 - 1
            if v44:IsA("BasePart") then
                u3:setQueryIgnored(v44, true)
            end
        end
        u31:GiveTask(function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v45 = u42
            if v45 ~= nil then
                v45:Destroy()
            end
        end)
        u14:weldCharacterAccessories(u30)
        u31:GiveTask((u4({ u10:getAssetId(u9.PUSH_UP_GLASSES) }, function(p46, p47) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u31
                [3] = u42
                [4] = u6
                [5] = u13
                [6] = u28
                [7] = u12
                [8] = u30
            --]]
            if p46.UserId ~= u29 then
                return nil
            end
            local v48 = u31
            if p47 ~= nil then
                p47 = p47:GetMarkerReachedSignal("PushUp"):Connect(function() --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u6
                        [3] = u31
                        [4] = u13
                        [5] = u28
                        [6] = u12
                        [7] = u29
                        [8] = u30
                    --]]
                    local u49 = u42.Handle.LeftGlass
                    local u50 = u42.Handle.RightGlass
                    local u51 = u49.Color
                    local u52 = u49.Material
                    u49.Color = Color3.fromRGB(255, 255, 255)
                    u49.Material = Enum.Material.Neon
                    u50.Color = Color3.fromRGB(255, 255, 255)
                    u50.Material = Enum.Material.Neon
                    local u53 = u6("PointLight", {
                        ["Brightness"] = 3,
                        ["Range"] = 10,
                        ["Color"] = Color3.fromRGB(255, 255, 255),
                        ["Parent"] = u42
                    })
                    u31:GiveTask(u53)
                    u13:playEffects({ u42.Handle.ShineAttachment }, nil)
                    u31:GiveTask((u28:playSound(u12.EPIC_SHINE, u29, {
                        ["rollOffMaxDistance"] = 55,
                        ["volumeMultiplier"] = 1.1,
                        ["position"] = u30:GetPivot().Position
                    })))
                    task.delay(0.4, function() --[[ Line: 150 ]]
                        --[[
                        Upvalues:
                            [1] = u49
                            [2] = u51
                            [3] = u52
                            [4] = u50
                            [5] = u53
                        --]]
                        u49.Color = u51
                        u49.Material = u52
                        u50.Color = u51
                        u50.Material = u52
                        u53:Destroy()
                    end)
                end)
            end
            v48:GiveTask(p47)
        end)))
    end
    function u24.onDisable(_, _, _, _) --[[ Line: 163 ]] end
    v21:registerHandler(v22, u24)
end
u5.CreateController(u16.new())
return nil