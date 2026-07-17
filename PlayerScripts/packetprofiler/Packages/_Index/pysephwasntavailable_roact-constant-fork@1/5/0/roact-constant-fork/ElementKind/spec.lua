-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Portal = require(script.Parent.Portal);
    local Component = require(script.Parent.Component);
    local ElementKind = require(script.Parent.ElementKind);
    describe("of", function() -- Line: 7
        -- upvalues: ElementKind (copy)
        it("should return nil for non-table values", function() -- Line: 8
            -- upvalues: ElementKind (ref)
            expect(ElementKind.of(nil)).to.equal(nil);
            expect(ElementKind.of(5)).to.equal(nil);
            expect(ElementKind.of(newproxy(true))).to.equal(nil);
        end);
        it("should return nil for table values without an ElementKind key", function() -- Line: 14
            -- upvalues: ElementKind (ref)
            expect(ElementKind.of({})).to.equal(nil);
        end);
        it("should return the ElementKind from a table", function() -- Line: 18
            -- upvalues: ElementKind (ref)
            expect(ElementKind.of({
                [ElementKind] = ElementKind.Stateful
            })).to.equal(ElementKind.Stateful);
        end);
    end);
    describe("fromComponent", function() -- Line: 27
        -- upvalues: ElementKind (copy), Component (copy), Portal (copy)
        it("should handle host components", function() -- Line: 28
            -- upvalues: ElementKind (ref)
            expect(ElementKind.fromComponent("foo")).to.equal(ElementKind.Host);
        end);
        it("should handle function components", function() -- Line: 32
            -- upvalues: ElementKind (ref)
            expect(ElementKind.fromComponent(function() -- Line: 33, Name: foo
            end)).to.equal(ElementKind.Function);
        end);
        it("should handle stateful components", function() -- Line: 38
            -- upvalues: Component (ref), ElementKind (ref)
            local v1 = Component:extend("Foo");
            expect(ElementKind.fromComponent(v1)).to.equal(ElementKind.Stateful);
        end);
        it("should handle portals", function() -- Line: 44
            -- upvalues: ElementKind (ref), Portal (ref)
            expect(ElementKind.fromComponent(Portal)).to.equal(ElementKind.Portal);
        end);
        it("should return nil for invalid inputs", function() -- Line: 48
            -- upvalues: ElementKind (ref)
            expect(ElementKind.fromComponent(5)).to.equal(nil);
            expect(ElementKind.fromComponent(newproxy(true))).to.equal(nil);
        end);
    end);
end;