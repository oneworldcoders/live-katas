const isPrime = (num)=>{
    if(num <= 1 ){
        return false;
    }
    
    for (let i = 2; i < num; i++){
        if(isDivisibleBy(num, i)){
            return false;
        }
    }

    return true;
}

const isDivisibleBy = (i, divisor)=>{
    return i % divisor === 0;
}

describe("Is Prime", ()=>{
    it("should return true for no.2", ()=>{
        expect(isPrime(2)).toBe(true);
    });
    it("should return false for even number", ()=>{
        expect(isPrime(4)).toBe(false);
        expect(isPrime(6)).toBe(false);
        expect(isPrime(8)).toBe(false);
        expect(isPrime(10)).toBe(false);
    });
    it("should return false for numbers divisble by 3 ", ()=>{
        expect(isPrime(9)).toBe(false);
        expect(isPrime(12)).toBe(false);
        expect(isPrime(15)).toBe(false);
    });
    it("should return false for no.14", ()=>{
        expect(isPrime(14)).toBe(false);
    });
    it("should return false for no.25", ()=>{
        expect(isPrime(25)).toBe(false);
    });
    it("should return false for no.35", ()=>{
        expect(isPrime(35)).toBe(false);
    });
    it("should return false for no.49", ()=>{
        expect(isPrime(49)).toBe(false);
    });
    it("should return true for no.3", ()=>{
        expect(isPrime(3)).toBe(true);
    });
    it("should return false for no.1", ()=>{
        expect(isPrime(1)).toBe(false);
    });
    it("should return false for no.0", ()=>{
        expect(isPrime(0)).toBe(false);
    });
    it("should return false for all -ve numbers", ()=>{
        expect(isPrime(-3)).toBe(false);
    });
});