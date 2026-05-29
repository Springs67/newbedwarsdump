local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u13 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "YuziFlipEmoteHandlerController"
    end,
    ["__index"] = u6
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p17)
    p17.Name = "YuziFlipEmoteHandlerController"
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u10
        [4] = u13
        [5] = u5
        [6] = u3
        [7] = u4
        [8] = u11
        [9] = u9
        [10] = u12
        [11] = u8
        [12] = u7
    --]]
    u6.KnitStart(p18)
    local v19 = u2.Controllers.EmoteHandlerController
    local v20 = u10.YUZI_FLIP
    local u21 = u13
    local u22 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
            return "Anonymous"
        end,
        ["__index"] = u21
    })
    u22.__index = u22
    function u22.new(...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v23 = u22
        local v24 = setmetatable({}, v23)
        return v24:constructor(...) or v24
    end
    function u22.constructor(p25, ...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.constructor(p25, ...)
    end
    function u22.onEnable(_, _, u26, _, p27) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
            [4] = u11
            [5] = u9
            [6] = u12
            [7] = u8
            [8] = u7
        --]]
        if not u26.PrimaryPart then
            return nil
        end
        local function u33(p28, p29) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u3
            --]]
            for v30, u31 in p28:GetDescendants() do
                local _ = v30 - 1
                if u31:IsA("BasePart") then
                    u5(0.35, u3, function(p32) --[[ Line: 63 ]]
                        --[[
                        Upvalues:
                            [1] = u31
                        --]]
                        u31.LocalTransparencyModifier = p32
                    end, 1 - p29, p29):Play()
                end
            end
        end
        local u34 = u4.Assets.Misc.emerald_dao_back:Clone()
        u11:addAccessory(u26, u34)
        p27:GiveTask(u34)
        local u35 = u4:WaitForChild("Items"):WaitForChild(u9.EMERALD_DAO):Clone()
        if not u35 then
            return nil
        end
        p27:GiveTask(u35)
        u12:weldCharacterAccessories(u26)
        local u36 = u26:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u8:getAnimation(u7.FRONT_FLIP))
        u36:Play()
        p27:GiveTask(u36:GetMarkerReachedSignal("sword1"):Connect(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
                [3] = u11
                [4] = u26
                [5] = u35
                [6] = u12
            --]]
            u33(u34, 1)
            u11:addAccessory(u26, u35)
            u12:weldCharacterAccessories(u26)
            u33(u35, 0)
        end))
        p27:GiveTask(u36:GetMarkerReachedSignal("sword2"):Connect(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
                [3] = u35
            --]]
            u33(u34, 0)
            u33(u35, 1)
            task.spawn(function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u33
                    [3] = u34
                --]]
                task.wait(0.35)
                u35:Destroy()
                task.wait(1)
                u33(u34, 1)
                task.wait(0.35)
                u34:Destroy()
            end)
        end))
        p27:GiveTask(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36:Stop()
            u36:Destroy()
        end)
    end
    function u22.onDisable(_, _, _, _) --[[ Line: 107 ]] end
    v19:registerHandler(v20, u22)
end
u2.CreateController(u14.new())
return nil