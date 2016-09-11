
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

}


function loadContracts() {
	var result = pubCrawl.getNumberContracts.call();
	var nbContracts = result.c[0];
	var contracts = [];

	//delete rows
	for(var i = 1; i <document.getElementById("resulttable").rows.length; i++) {
		document.getElementById("resulttable").deleteRow(i -1);
	}

	for(var i = 0; i < nbContracts ; i++) {
		var name = pubCrawl.getContractName.call(i);
		var hash = pubCrawl.getContractHash.call(i);
		var url = "vote.html?name=" + name;
		var thisContract = {cname: name, chash: hash};
		contracts[i] = thisContract;
		var table = document.getElementById("resulttable");
		var row = table.insertRow(i+1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		cell1.innerHTML = i;
		cell2.innerHTML = name;
		cell3.innerHTML = hash;
		cell4.innerHTML = "<a href=\"" + url + "\">Go to details</a>"
	}
}


function createGovContract() {
	walletBar.createSecureSigner();
	var currentAccount = walletBar.getCurrentAccount();
	var name = document.getElementById("name").value;
	var hash = document.getElementById("hash").value;
	  pubCrawl.buildContract.sendTransaction(hash, name, { gas: 1e6, from: currentAccount },function(err,result){
	  	//don't do much, it's a demo
	  });
}

function createMilestone(contractId, duration, budget) {
	walletBar.createSecureSigner();
	var currentAccount = walletBar.getCurrentAccount();
	pubCrawl.buildMilestone.sendTransaction(contractId, duration, budget, { gas: 1e6, from: currentAccount },function(err,result){
	  	//don't do much, it's a demo
	});
}

function getContractNameFromURL() {
	var url = document.URL;
	var vars = url.split("=");
	var name = vars[1];
	document.getElementById("projectname").innerHTML = name;
}