-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local None = require(script.Parent.None);
    local assign = require(script.Parent.assign);
    it("should accept zero additional tables", function() -- Line: 6
        -- upvalues: assign (copy)
        local v1 = {};
        local v2 = assign(v1);
        expect(v1).to.equal(v2);
    end);
    it("should merge multiple tables onto the given target table", function() -- Line: 13
        -- upvalues: assign (copy)
        local v3 = {
            a = 5,
            b = 6
        };
        local v4 = {
            b = 7,
            c = 8
        };
        local v5 = {
            b = 8
        };
        assign(v3, v4, v5);
        expect(v3.a).to.equal(5);
        expect(v3.b).to.equal(v5.b);
        expect(v3.c).to.equal(v4.c);
    end);
    it("should remove keys if specified as None", function() -- Line: 35
        -- upvalues: None (copy), assign (copy)
        local v6 = {
            foo = 2,
            bar = 3
        };
        assign(v6, {
            foo = None
        });
        expect(v6.foo).to.equal(nil);
        expect(v6.bar).to.equal(3);
    end);
    it("should re-add keys if specified after None", function() -- Line: 51
        -- upvalues: None (copy), assign (copy)
        local v7 = {
            foo = 2
        };
        local v8 = {
            foo = 3
        };
        assign(v7, {
            foo = None
        }, v8);
        expect(v7.foo).to.equal(v8.foo);
    end);
end;