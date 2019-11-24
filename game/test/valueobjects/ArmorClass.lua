local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local ArmorClass = require 'valueobjects.ArmorClass'

describe('ArmorClass', function ()
    it('instantiate', function ()
        expect(ArmorClass()).to.be.a('table')
    end)

    local instance

    it('instantiate from number', function ()
        instance = ArmorClass(10)
        expect(instance).to.be.a('table')
    end)

    it('__tostring', function ()
        expect(tostring(ArmorClass(0))).to.be('0')
        expect(tostring(ArmorClass(10))).to.be('10')
        expect(tostring(ArmorClass(-10))).to.be('LO')
    end)
end)
