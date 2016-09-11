
      // PUT YOUR UNIQUE ID HERE
//  (from the devadmin page, the one with '-edgware' appended)
var dappId = 'pubcrawl-edgware';

// PUT YOUR CALLBACK URL HERE
var callbackUrl = 'http://localhost:8080';

var web3, walletBar, pubCrawl;
// the callback must EXACTLY match the string configured in the devadmin web UI.
// e.g. be careful of trailing slashes

// PUT YOUR CONTRACT ADDRESS HERE
var contractAddress = '0x5155b763e961a7bb2621eece8393d225ab208ff7';

window.onload = function() {
  walletBar = new WalletBar({
    dappNamespace: dappId,
    authServiceCallbackUrl: callbackUrl,
    containerName:'#signInId'
  });

  web3 = new Web3();
  web3.setProvider(walletBar.getHook('edgware'));
  pubCrawl = web3.eth.contract(Pubcrawl.all_networks.default.abi).at(contractAddress);

  loadContracts();
}


function loadContracts() {
	var result = pubCrawl.getNumberContracts.call();
	var nbContracts = result.c[0];
	var contracts = [];
	for(var i = 0; i < nbContracts ; i++) {
		var result = pubCrawl.getContractName.call(i);
		var result = pubCrawl.getContractHash.call(i);
		console.log(result);
	}
}


function createGovContract() {
	console.log('creating gov contract!');
	walletBar.createSecureSigner();
	var currentAccount = walletBar.getCurrentAccount();

	  pubCrawl.buildContract.sendTransaction('helloworld','helloworld', { gas: 1e6, from: currentAccount },function(err,result){
	  	console.log(result);
	  });
}



