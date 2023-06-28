//CALLING OTHER CONTRACTS
 contract SecretVault {
    string private secret;

    constructor ( string memory _secret) {
        secret = _secret;
      }
      function setSecret( string memory _secret ) external {
        return _secret;

      } 
      function getSecret() external view returns ( string memory ) {
        return secret;
      }
   }

   contract MyContract {
    SecretVault public secretVault;

    constructor( SecretVault _secretVault) {
        secretVault = _secretVault;
    }
    function setSecret( string memory _secret) public {
        secretVault.setSecret(_secret);
    }
    function getSecret() public view returns ( string memory ) {
        return secretVault.getSecret();
      }
   }