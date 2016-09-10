
      // PUT YOUR UNIQUE ID HERE
//  (from the devadmin page, the one with '-edgware' appended)
var dappId = 'pubcrawl-edgware';

// PUT YOUR CALLBACK URL HERE
var callbackUrl = 'http://localhost:8080';

var web3, walletBar, govContracts;
// the callback must EXACTLY match the string configured in the devadmin web UI.
// e.g. be careful of trailing slashes

// PUT YOUR CONTRACT ADDRESS HERE
var contractAddress = '0x3aba39d9844a936b91289d633a68b5a7f2503e72';

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


function loadContracts() {
	var result = govContracts.getNumberContracts.call();
	var nbContracts = result.c[0];
	var contracts = [];
	for(var i = 0; i < nbContracts ; i++) {
		var result = govContracts.getContractName.call(i);
		var result = govContracts.getContractHash.call(i);
		console.log(result);
	}
}


function createGovContract() {
	console.log('creating gov contract!');
	walletBar.createSecureSigner();
	var currentAccount = walletBar.getCurrentAccount();
	console.log(currentAccount);

	  govContracts.buildContract.sendTransaction('helloworld','helloworld', { gas: 1e6, from: currentAccount },function(err,result){
	  	console.log(result);
	  });
}



