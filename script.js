</> javaScript


const connectButton = document.getElementById("connectButton");
const walletAddress = document.getElementById("walletAddress");

async function connectWallet() {

    if (typeof window.ethereum !== "undefined") {

        try {

            const accounts = await ethereum.request({
                method: "eth_requestAccounts"
            });

            walletAddress.innerHTML =
                "Connected Wallet:<br>" + accounts[0];

        }

        catch (error) {

            console.log(error);

        }

    }

    else {

        alert("MetaMask is not installed.");

    }

}

connectButton.addEventListener("click", connectWallet);
