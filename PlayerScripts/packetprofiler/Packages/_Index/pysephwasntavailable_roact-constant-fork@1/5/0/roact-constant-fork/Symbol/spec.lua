-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Symbol = require(script.Parent.Symbol);
    describe("named", function() -- Line: 4
        -- upvalues: Symbol (copy)
        it("should give an opaque object", function() -- Line: 5
            -- upvalues: Symbol (ref)
            local v1 = Symbol.named("foo");
            expect(v1).to.be.a("userdata");
        end);
        it("should coerce to the given name", function() -- Line: 11
            -- upvalues: Symbol (ref)
            local v2 = Symbol.named("foo");
            local v3 = tostring(v2):find("foo");
            expect(v3).to.be.ok();
        end);
        it("should be unique when constructed", function() -- Line: 18
            -- upvalues: Symbol (ref)
            local v4 = Symbol.named("abc");
            local v5 = Symbol.named("abc");
            expect(v4).never.to.equal(v5);
        end);
    end);
end;