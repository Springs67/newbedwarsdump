-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local strict = require(script.Parent.strict);
    it("should error when getting a nonexistent key", function() -- Line: 4
        -- upvalues: strict (copy)
        local u1 = strict({
            a = 1,
            b = 2
        });
        expect(function() -- Line: 10
            -- upvalues: u1 (copy)
            return u1.c;
        end).to.throw();
    end);
    it("should error when setting a nonexistent key", function() -- Line: 15
        -- upvalues: strict (copy)
        local u2 = strict({
            a = 1,
            b = 2
        });
        expect(function() -- Line: 21
            -- upvalues: u2 (copy)
            u2.c = 3;
        end).to.throw();
    end);
end;