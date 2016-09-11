
// PUT YOUR UNIQUE ID HERE
//  (from the devadmin page, the one with '-edgware' appended)
var dappId = 'pubcrawl-edgware';

// PUT YOUR CALLBACK URL HERE
var callbackUrl = 'http://localhost:8080';

var web3, walletBar, pubCrawl, contractId;
// the callback must EXACTLY match the string configured in the devadmin web UI.
// e.g. be careful of trailing slashes

// PUT YOUR CONTRACT ADDRESS HERE
var contractAddress = '0xc35dd2855714db4b366cba9d4eee0eee101895fd';

var isReadyDeffered = jQuery.Deferred();
var isReadyPromise = isReadyDeffered.promise();

window.onload = function() {
  walletBar = new WalletBar({
    dappNamespace: dappId,
    authServiceCallbackUrl: callbackUrl,
    containerName:'#signInId'
  });

  web3 = new Web3();
  web3.setProvider(walletBar.getHook('edgware'));
  pubCrawl = web3.eth.contract(Pubcrawl.all_networks.default.abi).at(contractAddress);
  isReadyDeffered.resolve('');
}


function loadContracts() {
	var result = pubCrawl.getNumberContracts.call();
	var nbContracts = result.c[0];
	var contracts = [];

	//delete rows
	var table = document.getElementById("resulttable");
	while(table.rows.length > 1) {
  		table.deleteRow(1);
	}

	for(var i = 0; i < nbContracts ; i++) {
		var name = pubCrawl.getContractName.call(i);
		var hash = pubCrawl.getContractHash.call(i);
		var url = "vote.html?id=" + i;
		var thisContract = {cname: name, chash: hash};
		contracts[i] = thisContract;
		
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

function loadMilestone() {
	var url = document.URL;
	var vars = url.split("=");
	var id = vars[1];

	var result = pubCrawl.getNumberMilestones.call(parseInt(id));
	var nbMilestones = result.c[0];
	console.log(nbMilestones);
	var milestones = [];

	//delete rows
	var table = document.getElementById("milestonetable");
	while(table.rows.length > 1) {
  		table.deleteRow(1);
	}

	for(var i = 0; i < nbMilestones ; i++) {
		var budget = pubCrawl.getTargetBudget.call(id, i);
		var duration = pubCrawl.getDuration.call(id, i);
		
		
		var row = table.insertRow(i+1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		cell1.innerHTML = i;
		cell2.innerHTML = budget;
		cell3.innerHTML = duration;
		cell4.innerHTML = "<div class=\"btn btn-danger\" data-toggle=\"modal\" data-target=\"#voteredmodal\">Red</div><div class=\"btn btn-success\" data-toggle=\"modal\" data-target=\"#votegreenmodal\">Green</div>"
		cell5.innerHTML = "<a href=\"voteresults.html\">Go to Results</a>"
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

function createMilestone() {
	var duration = parseInt(document.getElementById("duration").value);
	var budget = parseInt(document.getElementById("budget").value);
	var url = document.URL;
	var vars = url.split("=");
	var contractId = parseInt(vars[1]);

	console.log(duration);
	console.log(budget);
	console.log(contractId);
	walletBar.createSecureSigner();
	var currentAccount = walletBar.getCurrentAccount();
	pubCrawl.buildMilestone.sendTransaction(contractId, duration, budget, { gas: 1e6, from: currentAccount },function(err,result){
	  	//don't do much, it's a demo
	  	console.log(err);
	  	console.log(result);
	});
}

function getContractNameFromURL() {
	var url = document.URL;
	var vars = url.split("=");
	contractId = vars[1];
	document.getElementById("projectname").innerHTML = pubCrawl.getContractName.call(contractId);
}