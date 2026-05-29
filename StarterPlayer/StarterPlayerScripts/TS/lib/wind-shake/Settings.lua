return {
    ["new"] = function(u1, u2) --[[ Name: new, Line 9 ]]
        local u3 = table.create(3)
        local u4 = u1:GetAttribute("WindPower")
        local u5 = u1:GetAttribute("WindSpeed")
        local u6 = u1:GetAttribute("WindDirection")
        u3.WindPower = typeof(u4) == "number" and u4 or u2.WindPower
        u3.WindSpeed = typeof(u5) == "number" and u5 or u2.WindSpeed
        u3.WindDirection = typeof(u6) == "Vector3" and u6 or u2.WindDirection
        local u8 = u1:GetAttributeChangedSignal("WindPower"):Connect(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u1
                [3] = u3
                [4] = u2
            --]]
            u4 = u1:GetAttribute("WindPower")
            local v7 = u4
            u3.WindPower = typeof(v7) == "number" and u4 or u2.WindPower
        end)
        local u10 = u1:GetAttributeChangedSignal("WindSpeed"):Connect(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u1
                [3] = u3
                [4] = u2
            --]]
            u5 = u1:GetAttribute("WindSpeed")
            local v9 = u5
            u3.WindSpeed = typeof(v9) == "number" and u5 or u2.WindSpeed
        end)
        local u12 = u1:GetAttributeChangedSignal("WindDirection"):Connect(function() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u1
                [3] = u3
                [4] = u2
            --]]
            u6 = u1:GetAttribute("WindDirection")
            local v11 = u6
            u3.WindDirection = typeof(v11) == "Vector3" and u6 or u2.WindDirection
        end)
        function u3.Destroy(_) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
                [3] = u12
                [4] = u3
            --]]
            u8:Disconnect()
            u10:Disconnect()
            u12:Disconnect()
            table.clear(u3)
        end
        return u3
    end
}