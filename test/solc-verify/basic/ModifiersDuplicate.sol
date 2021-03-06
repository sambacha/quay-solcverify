pragma solidity >=0.5.0;

contract ModifiersDuplicate {
    uint x;

    modifier incr(uint y) {
        x += y;
        _;
        x += y;
    }

    /** @notice postcondition x == 3*__verifier_old_uint(x) + 13 */
    function test() public incr(1) incr(2) incr(x) {
        x++;
    }

    function() external payable {
        x = 0;
        test();
        assert(x == 13);
    }
}