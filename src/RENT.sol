// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RENT is ERC20 {
    address private owner; 


    constructor() ERC20("RENT", "RNT") {
        owner = msg.sender; 
        _mint(msg.sender, 50000 * 10 ** 18); 
    }
    
    // Modificador para permitir que apenas o proprietário execute certas funções
    modifier onlyOwner () {
        require(msg.sender == owner, "RENT: Only owner");
        _;
    }
    
    // Função para aprovar que um endereço gaste tokens em nome do usuário
    function approve(address spender, uint256 amount) public override returns (bool) {
        super.approve(spender, amount); // Chama a função approve da biblioteca ERC20
        return true;
    }

    // Função para transferir tokens de um endereço para outro, se aprovado
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        super.transferFrom(sender, recipient, amount); // Chama a função transferFrom da biblioteca ERC20
        return true;
    }

    // Função para verificar o saldo de tokens de um determinado endereço
    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account); // Retorna o saldo de tokens do endereço especificado
    }
}
