// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Guestbook {
    struct Message {
        address sender;
        string text;
        uint256 timestamp;
    }

    Message[] public messages;

    event NewMessage(address indexed sender, string text, uint256 timestamp);

    function leaveMessage(string calldata _text) external {
        require(bytes(_text).length > 0, "Message cannot be empty");

        Message memory newMessage = Message({
            sender: msg.sender,
            text: _text,
            timestamp: block.timestamp
        });

        messages.push(newMessage);
        emit NewMessage(msg.sender, _text, block.timestamp);
    }

    function getAllMessages() external view returns (Message[] memory) {
        return messages;
    }
}
