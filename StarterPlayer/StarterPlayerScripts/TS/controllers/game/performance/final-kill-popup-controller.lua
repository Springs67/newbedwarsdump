local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "final-kill-popup").FinalKillPopup
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "FinalKillPopupController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "FinalKillPopupController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u4
    --]]
    u5.KnitStart(u12)
    u6.Client:OnEvent("PlayerEliminated", function(p13, p14) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u12
        --]]
        if u2.Controllers.MatchController:getCustomMatchConfig() ~= nil then
            return nil
        end
        if p13 ~= u4.LocalPlayer.UserId then
            return nil
        end
        if p14 == false then
            u12:showPopup()
            task.delay(20, function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12:hidePopup()
            end)
        end
    end)
    u6.Client:OnEvent("PerformanceFinalized", function(p15) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
        --]]
        if p15 ~= u4.LocalPlayer.UserId then
            return nil
        end
        u12:hidePopup()
    end)
end
function u8.showPopup(p16) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u7
    --]]
    print("SHOWING FINAL KILL POPUP FOR PLAYER", u4.LocalPlayer.Name)
    p16.menuTree = u3.mount(u3.createElement(u7), u4.LocalPlayer:WaitForChild("PlayerGui"), "FinalKillPopup")
end
function u8.hidePopup(p17) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p17.menuTree then
        u3.unmount(p17.menuTree)
    end
end
u2.CreateController(u8.new())
return nil