-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local getDefaultInstanceProperty = require(script.Parent.getDefaultInstanceProperty);
    it("should get default name string values", function() -- Line: 4
        -- upvalues: getDefaultInstanceProperty (copy)
        local _, v1 = getDefaultInstanceProperty("StringValue", "Name");
        expect(v1).to.equal("Value");
    end);
    it("should get default empty string values", function() -- Line: 10
        -- upvalues: getDefaultInstanceProperty (copy)
        local _, v2 = getDefaultInstanceProperty("StringValue", "Value");
        expect(v2).to.equal("");
    end);
    it("should get default number values", function() -- Line: 16
        -- upvalues: getDefaultInstanceProperty (copy)
        local _, v3 = getDefaultInstanceProperty("IntValue", "Value");
        expect(v3).to.equal(0);
    end);
    it("should get nil default values", function() -- Line: 22
        -- upvalues: getDefaultInstanceProperty (copy)
        local _, v4 = getDefaultInstanceProperty("ObjectValue", "Value");
        expect(v4).to.equal(nil);
    end);
    it("should get bool default values", function() -- Line: 28
        -- upvalues: getDefaultInstanceProperty (copy)
        local _, v5 = getDefaultInstanceProperty("BoolValue", "Value");
        expect(v5).to.equal(false);
    end);
end;