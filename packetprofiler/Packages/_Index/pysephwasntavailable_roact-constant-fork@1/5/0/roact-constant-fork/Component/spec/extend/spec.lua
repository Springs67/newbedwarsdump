-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type);
    local Component = require(script.Parent.Parent.Component);
    it("should be extendable", function() -- Line: 6
        -- upvalues: Component (copy), Type (copy)
        local v1 = Component:extend("The Senate");
        expect(v1).to.be.ok();
        expect(Type.of(v1)).to.equal(Type.StatefulComponentClass);
    end);
    it("should prevent extending a user component", function() -- Line: 13
        -- upvalues: Component (copy)
        local u2 = Component:extend("Sheev");
        expect(function() -- Line: 16
            -- upvalues: u2 (copy)
            u2:extend("Frank");
        end).to.throw();
    end);
    it("should use a given name", function() -- Line: 21
        -- upvalues: Component (copy)
        local v3 = Component:extend("FooBar");
        local v4 = tostring(v3);
        expect(v4).to.be.a("string");
        expect(v4:find("FooBar")).to.be.ok();
    end);
end;