local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.WatchCharacter
local u5 = v2.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = v7.Assets.Misc.AnniversaryHat2025
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "AnniversaryHatController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "AnniversaryHatController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u4
        [4] = u11
        [5] = u3
        [6] = u10
        [7] = u5
    --]]
    u8.KnitStart(p16)
    if u9.isLobbyServer() then
        u4(function(_, p17) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u3
                [3] = u10
            --]]
            local v18 = u11:GetChildren()
            u3.fromList(unpack(v18)):Clone().Parent = p17
            u10:weldCharacterAccessories(p17)
        end)
        u5("NpcModel", function(u19) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u3
                [3] = u10
            --]]
            task.spawn(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u11
                    [3] = u3
                    [4] = u10
                --]]
                for v20, v21 in u19:GetDescendants() do
                    local _ = v20 - 1
                    local v22 = v21:IsA("MeshPart")
                    if v22 then
                        v22 = string.find(string.lower(v21.Name), "hat")
                    end
                    if v22 ~= 0 and (v22 == v22 and v22) then
                        v21:Destroy()
                    end
                end
                local v23 = u11:GetChildren()
                u3.fromList(unpack(v23)):Clone().Parent = u19
                u10:weldCharacterAccessories(u19)
            end)
        end)
    end
end
v6.CreateController(u12.new())
return nil