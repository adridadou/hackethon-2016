
      // PUT YOUR UNIQUE ID HERE
//  (from the devadmin page, the one with '-edgware' appended)
var dappId = 'pubcrawl';

// PUT YOUR CALLBACK URL HERE
var callbackUrl = 'http://localhost:8080';
// the callback must EXACTLY match the string configured in the devadmin web UI.
// e.g. be careful of trailing slashes

// PUT YOUR CONTRACT ADDRESS HERE
var contractAddress = '0x5480389cbd36a9babac289ce9ee482129acf9d7b';

window.onload = function() {
  var walletBar = new WalletBar({
    dappNamespace: dappId,
    authServiceCallbackUrl: callbackUrl
  });

  var web3 = new Web3();
  web3.setProvider(walletBar.getHook('edgware'));
  var myContract = web3.eth.contract(abi).at(contractAddress);
}
