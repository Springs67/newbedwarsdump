return {
    ["patchKnitClient"] = function(p1) --[[ Name: patchKnitClient, Line 9 ]]
        local u2 = p1.CreateController
        function p1.CreateController(p3) --[[ Line: 2 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            local v4 = getmetatable(p3)
            local v5 = u2(p3)
            return setmetatable(v5, v4)
        end
    end,
    ["patchKnitServer"] = function(p6) --[[ Name: patchKnitServer, Line 13 ]]
        local u7 = p6.CreateService
        function p6.CreateService(p8) --[[ Line: 2 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v9 = getmetatable(p8)
            local v10 = u7(p8)
            return setmetatable(v10, v9)
        end
    end
}