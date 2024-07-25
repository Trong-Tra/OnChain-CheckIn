// SPDX-License-Identifier: MIT
//pragma
pragma solidity ^0.8.18;

contract DailyLogin {
    struct User {
        uint256 lastLogin;
        uint256 checkinCount;
    }

    mapping(address => User) public users;

    event Login(address indexed user, uint256 timestamp);

    /**
     * @notice this function check if the user log in on a new day
     */
    function login() public {
        User storage user = users[msg.sender];
        uint256 currentTime = block.timestamp;

        // offset for UTC+7, you can adjust to fit your project timezone
        uint256 offset = 7 * 60 * 60;

        uint256 currentDay = (currentTime + offset) / 1 days;
        uint256 lastLoginDay = (user.lastLogin + offset) / 1 days;

        if (currentDay > lastLoginDay) {
            user.checkinCount++;
            user.lastLogin = currentTime;
            emit Login(msg.sender, currentTime);
        }
    }

    // getter
    function getCheckinCount(
        address userAddress
    ) public view returns (uint256) {
        return users[userAddress].checkinCount;
    }

    function getLastLoginTime(
        address userAddress
    ) public view returns (uint256) {
        return users[userAddress].lastLogin;
    }
}
