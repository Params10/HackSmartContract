//*** Exercice 15 ***//.
// This is a game where an Owner considered as TRUSTED can set rounds with rewards.
// The Owner allows several users to compete for the rewards. The fastest user gets all the rewards.
// The users can propose new rounds but it's up to the Owner to fund them.
// The Owner can clear the rounds to create fresh new ones.
contract WinnerTakesAll {
    struct Round {
        uint256 rewards;
        mapping(address => bool) isAllowed;
    }
    address[] allowed;
    address owner;
    Round[] rounds;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function createNewRounds(uint256 _numberOfRounds) external {
        for (uint256 i = 0; i < _numberOfRounds; i++) {
            rounds.push();
        }
    }

    function setRewardsAtRound(uint256 _roundIndex) external payable onlyOwner {
        require(rounds[_roundIndex].rewards == 0);
        rounds[_roundIndex].rewards = msg.value;
    }

    function setRewardsAtRoundfor(
        uint256 _roundIndex,
        address[] calldata _recipients
    ) external onlyOwner {
        for (uint256 i; i < _recipients.length; i++) {
            rounds[_roundIndex].isAllowed[_recipients[i]] = true;
            allowed.push(_recipients[i]);
        }
    }

    function isAllowedAt(uint256 _roundIndex, address _recipient)
        external
        view
        returns (bool)
    {
        return rounds[_roundIndex].isAllowed[_recipient];
    }

    function withdrawRewards(uint256 _roundIndex) external {
        require(checkIfallowed(msg.sender));
        uint256 amount = rounds[_roundIndex].rewards;
        rounds[_roundIndex].rewards = 0;
        payable(msg.sender).transfer(amount);
    }

    function clearRounds() external onlyOwner {
        delete allowed;
        delete rounds;
    }

    function withrawETH() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function checkIfallowed(address _addr) internal returns (bool) {
        for (uint256 i; i < allowed.length; ++i) {
            if (_addr == allowed[i]) return true;
        }
        return false;
    }
}
