
      // PUT YOUR UNIQUE ID HERE
//  (from the devadmin page, the one with '-edgware' appended)
var dappId = 'pubcrawl-edgware';

// PUT YOUR CALLBACK URL HERE
var callbackUrl = 'http://localhost:8080';

var web3, walletBar, govContracts;
// the callback must EXACTLY match the string configured in the devadmin web UI.
// e.g. be careful of trailing slashes

// PUT YOUR CONTRACT ADDRESS HERE
var contractAddress = '0x9d1f5b5de6b245dda69b3446e5b8462be1053907';

window.onload = function() {
  walletBar = new WalletBar({
    dappNamespace: dappId,
    authServiceCallbackUrl: callbackUrl,
    containerName:'#signInId'
  });

  web3 = new Web3();
  web3.setProvider(walletBar.getHook('edgware'));
  govContracts = web3.eth.contract(GovContracts.all_networks.default.abi).at(contractAddress);
}
