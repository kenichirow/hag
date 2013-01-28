(function() {

  describe("A suite", function() {
    return it("contains spec with an expectation", function() {
      expect(true).toBe(true);
      return expect(true).toBe(true);
    });
  });

}).call(this);
