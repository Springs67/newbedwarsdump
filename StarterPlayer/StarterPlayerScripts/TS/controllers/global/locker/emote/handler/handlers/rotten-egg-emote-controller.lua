local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.ReplicatedStorage
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil
local u11 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "RottenEggEmoteController"
    end,
    ["__index"] = u6
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "RottenEggEmoteController"
end
function u12.KnitStart(p16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u8
        [4] = u11
        [5] = u4
        [6] = u7
        [7] = u5
        [8] = u10
        [9] = u9
    --]]
    u6.KnitStart(p16)
    local v17 = u2.Controllers.EmoteHandlerController
    local v18 = u8.ROTTEN_EGG
    local u19 = u11
    local u20 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
            return "Anonymous"
        end,
        ["__index"] = u19
    })
    u20.__index = u20
    function u20.new(...) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        local v22 = setmetatable({}, v21)
        return v22:constructor(...) or v22
    end
    function u20.constructor(p23, ...) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19.constructor(p23, ...)
    end
    function u20.onEnable(u24, u25, u26, _, p27) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u5
            [4] = u10
            [5] = u9
        --]]
        local v28 = u26.LeftHand
        if not v28 then
            return nil
        end
        local v29 = u4:GetPlayerByUserId(u25)
        if not v29 then
            return nil
        end
        local v30 = u7:getEntity(v29)
        if not v30 then
            return nil
        end
        local u31 = v30:hideHandItem()
        local u32 = u5.Assets.Misc.RottenEgg:Clone()
        u32.Parent = v28
        u32:PivotTo(v28.CFrame * CFrame.new(Vector3.new(0, 0, -0.75)))
        local u33 = u10.startFollowing(u32.PrimaryPart, v28, Vector3.new(0, 0, -0.75), true, false, Vector3.new(90, 0, 0))
        task.delay(0.3, function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u9
                [3] = u25
                [4] = u26
            --]]
            u24:playSound(u9.ROTTEN_EGG_EMOTE_SOUND, u25, {
                ["rollOffMaxDistance"] = 55,
                ["playbackSpeedMultiplier"] = 0.7,
                ["position"] = u26:GetPivot().Position
            })
        end)
        task.delay(3, function() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u31
            --]]
            if u32 and u32.Parent ~= nil then
                u32:Destroy()
            end
            if u33 then
                u33:Destroy()
            end
            u31:DoCleaning()
        end)
        p27:GiveTask(function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u31
            --]]
            if u32 and u32.Parent ~= nil then
                u32:Destroy()
            end
            if u33 then
                u33:Destroy()
            end
            u31:DoCleaning()
        end)
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 104 ]] end
    v17:registerHandler(v18, u20)
end
u2.CreateController(u12.new())
return nil