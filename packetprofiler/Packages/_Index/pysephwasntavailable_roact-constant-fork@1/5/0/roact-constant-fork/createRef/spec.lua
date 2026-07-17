-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Binding = require(script.Parent.Binding);
    local Type = require(script.Parent.Type);
    local createRef = require(script.Parent.createRef);
    it("should create refs, which are specialized bindings", function() -- Line: 7
        -- upvalues: createRef (copy), Type (copy)
        local v1 = createRef();
        expect(Type.of(v1)).to.equal(Type.Binding);
        expect(v1.current).to.equal(nil);
    end);
    it("should have a \'current\' field that is the same as the internal binding\'s value", function() -- Line: 14
        -- upvalues: createRef (copy), Binding (copy)
        local v2 = createRef();
        expect(v2.current).to.equal(nil);
        Binding.update(v2, 10);
        expect(v2.current).to.equal(10);
    end);
    it("should support tostring on refs", function() -- Line: 23
        -- upvalues: createRef (copy), Binding (copy)
        local v3 = createRef();
        expect(v3.current).to.equal(nil);
        expect((tostring(v3))).to.equal("RoactRef(nil)");
        Binding.update(v3, 10);
        expect((tostring(v3))).to.equal("RoactRef(10)");
    end);
    it("should not allow assignments to the \'current\' field", function() -- Line: 33
        -- upvalues: createRef (copy), Binding (copy)
        local u4 = createRef();
        expect(u4.current).to.equal(nil);
        Binding.update(u4, 99);
        expect(u4.current).to.equal(99);
        expect(function() -- Line: 41
            -- upvalues: u4 (copy)
            u4.current = 77;
        end).to.throw();
        expect(u4.current).to.equal(99);
    end);
    it("should return the same thing from getValue as its current field", function() -- Line: 48
        -- upvalues: createRef (copy), Binding (copy)
        local v5 = createRef();
        Binding.update(v5, 10);
        expect(v5:getValue()).to.equal(10);
        expect(v5:getValue()).to.equal(v5.current);
    end);
end;