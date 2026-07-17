-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Type = require(script.Parent.Type);
    describe("of", function() -- Line: 4
        -- upvalues: Type (copy)
        it("should return nil if the value is not a table", function() -- Line: 5
            -- upvalues: Type (ref)
            expect(Type.of(1)).to.equal(nil);
            expect(Type.of(true)).to.equal(nil);
            expect(Type.of("test")).to.equal(nil);
            expect(Type.of(print)).to.equal(nil);
        end);
        it("should return nil if the table has no type", function() -- Line: 12
            -- upvalues: Type (ref)
            expect(Type.of({})).to.equal(nil);
        end);
        it("should return the assigned type", function() -- Line: 16
            -- upvalues: Type (ref)
            expect(Type.of({
                [Type] = Type.Element
            })).to.equal(Type.Element);
        end);
    end);
end;