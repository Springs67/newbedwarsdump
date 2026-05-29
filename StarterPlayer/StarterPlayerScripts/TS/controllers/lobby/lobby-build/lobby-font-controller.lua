local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "LobbyFontController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p8)
    p8.Name = "LobbyFontController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    u4.KnitStart(p9)
    u2("LobbyFont", function(u10) --[[ Line: 26 ]]
        local _ = Enum.Font.LuckiestGuy
        if u10:IsA("TextLabel") then
            local function u15(p11) --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                local v12 = nil
                for v13, v14 in Enum.Font:GetEnumItems() do
                    local _ = v13 - 1
                    if v14.Name == p11 == true then
                        v12 = v14
                        break
                    end
                end
                if v12 then
                    u10.Font = v12
                end
            end
            u15(u10:GetAttribute("FontName"))
            u10:GetAttributeChangedSignal("FontName"):Connect(function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u10
                --]]
                u15(u10:GetAttribute("FontName"))
            end)
        end
    end)
end
v3.CreateController(u5.new())
return nil