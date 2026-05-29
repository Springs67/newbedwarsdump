local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MarketplaceService
return {
    ["MarketplaceUtil"] = {
        ["getGamePassProductInfoAsync"] = function(u3) --[[ Name: getGamePassProductInfoAsync, Line 7 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u2
            --]]
            return u1.Promise.new(function(p4, p5) --[[ Line: 8 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u3
                --]]
                local v6 = u2:GetProductInfo(u3, Enum.InfoType.GamePass)
                if v6 then
                    p4(v6)
                else
                    p5()
                end
            end)
        end,
        ["getDevProductInfoAsync"] = function(u7) --[[ Name: getDevProductInfoAsync, Line 18 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u2
            --]]
            return u1.Promise.new(function(p8, p9) --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u7
                --]]
                local v10 = u2:GetProductInfo(u7, Enum.InfoType.Product)
                if v10 then
                    p8(v10)
                else
                    p9()
                end
            end)
        end
    }
}