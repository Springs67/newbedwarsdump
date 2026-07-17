-- Decompiled with Potassium's decompiler.

return {
    new = function(u1, u2) -- Line: 9, Name: new
        local u3 = table.create(3);
        local u4 = u1:GetAttribute("WindPower");
        local u5 = u1:GetAttribute("WindSpeed");
        local u6 = u1:GetAttribute("WindDirection");
        u3.WindPower = typeof(u4) == "number" and u4 or u2.WindPower;
        u3.WindSpeed = typeof(u5) == "number" and u5 or u2.WindSpeed;
        u3.WindDirection = typeof(u6) == "Vector3" and u6 or u2.WindDirection;
        local u7 = u1:GetAttributeChangedSignal("WindPower"):Connect(function() -- Line: 24
            -- upvalues: u4 (ref), u1 (copy), u3 (copy), u2 (copy)
            u4 = u1:GetAttribute("WindPower");
            u3.WindPower = typeof(u4) == "number" and u4 or u2.WindPower;
        end);
        local u8 = u1:GetAttributeChangedSignal("WindSpeed"):Connect(function() -- Line: 29
            -- upvalues: u5 (ref), u1 (copy), u3 (copy), u2 (copy)
            u5 = u1:GetAttribute("WindSpeed");
            u3.WindSpeed = typeof(u5) == "number" and u5 or u2.WindSpeed;
        end);
        local u9 = u1:GetAttributeChangedSignal("WindDirection"):Connect(function() -- Line: 34
            -- upvalues: u6 (ref), u1 (copy), u3 (copy), u2 (copy)
            u6 = u1:GetAttribute("WindDirection");
            u3.WindDirection = typeof(u6) == "Vector3" and u6 or u2.WindDirection;
        end);

        function u3.Destroy(p10) -- Line: 41
            -- upvalues: u7 (copy), u8 (copy), u9 (copy), u3 (copy)
            u7:Disconnect();
            u8:Disconnect();
            u9:Disconnect();
            table.clear(u3);
        end;

        return u3;
    end
};