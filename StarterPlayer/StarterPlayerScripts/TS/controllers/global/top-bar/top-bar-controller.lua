local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ContentProvider
local u7 = v5.Players
local u8 = v5.StarterGui
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = u1.import(script, script.Parent, "ui", "top-bar-app").TopBarApp
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "TopBarController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "TopBarController"
    p16.preloadedBedsTopBar = false
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    u9.KnitStart(p17)
    p17:mountHud()
    u8:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
end
function u13.mountHud(p18) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u7
    --]]
    p18:unmountHud()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "TopBarApp",
        ["app"] = u12
    }, {
        ["LocalPlayerId"] = u7.LocalPlayer.UserId
    })
end
function u13.unmountHud(_) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("TopBarApp") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TopBarApp")
    end
end
function u13.preloadBedsTopbarHud(p19) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u1
        [3] = u10
        [4] = u4
        [5] = u6
    --]]
    if not u11.isGameServer() then
        return nil
    end
    if p19.preloadedBedsTopBar then
        return nil
    end
    p19.preloadedBedsTopBar = true
    u1.Promise.defer(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u6
        --]]
        local v20 = { u10.HUD_BED_DESTROYED }
        local v21 = table.create(#v20)
        for v22, v23 in v20 do
            local _ = v22 - 1
            v21[v22] = u4("ImageLabel", {
                ["Image"] = v23
            })
        end
        u6:PreloadAsync(v21)
    end)
end
v3.CreateController(u13.new())
return nil