local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Price = require 'valueobjects.Price'

describe('Price', function ()
    it('instantiate', function ()
        expect(Price()).to.be.a('table')
    end)

    local data = {
        buy = 123456,
        --sell = 61728,
        --identify = 61728,
        --uncurse = 61728,
    }
    local instance

    it('instantiate from number', function ()
        instance = Price(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == Price { buy = 123456 }).to.be.truthy()
        expect(instance == Price { buy = 1234567 }).to_not.be.truthy()
    end)

    it('buyprice', function ()
        expect(instance:buyprice()).to.be(123456)
    end)

    it('sellprice', function ()
        expect(instance:sellprice()).to.be(61728)
    end)

    it('identifyprice', function ()
        expect(instance:identifyprice()).to.be(61728)
    end)

    it('uncurseprice', function ()
        expect(instance:uncurseprice()).to.be(61728)
    end)
end)
