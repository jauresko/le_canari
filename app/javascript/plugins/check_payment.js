const paydunya = require('paydunya');

const setup = new paydunya.Setup({
  masterKey: `${process.env.PAYDUNYA_MASTER_KEY}`,
  privateKey: `${process.env.PAYDUNYA_PRIVATE_KEY}`,
  publicKey: `${process.env.PAYDUNYA_PUBLIC_KEY}`,
  token: `${process.env.PAYDUNYA_TOKEN}`,
  mode: 'test' // Optionnel. Utilisez cette option pour les paiements tests.
});

const store = new paydunya.Store({
  name: 'Le Canari', // Seul le nom est requis
  tagline: "Retrouvez vos BDs préférées ici",
  phoneNumber: '336530583',
  postalAddress: 'C/1143 Agontikon, Cotonou, Bénin',
  websiteURL: 'http://www.lecanari.com',
  logoURL: 'https://res.cloudinary.com/dwustkks4/image/upload/v1589021413/FK/logo_final_png_n3dlcq.png',
  returnURL: 'http://localhost:3000/account_credit'
});

if(document.getElementById('token-paydunya')) {

const token = document.getElementById('token-paydunya').innerText;
const id = document.getElementById('user-id').innerText;
console.log(id);
const auth_token = document.getElementById('user-token').innerText;
const mail = document.getElementById('user-email').innerText;
let old_coins = 0;
const invoice = new paydunya.CheckoutInvoice(setup, store);
invoice.confirm(token)
  .then(function () {
    // Récupérer le statut du paiement
    // Le statut du paiement peut être soit completed, pending, cancelled
    console.log(invoice.status);

    console.log(invoice.responseText);  // Réponse du serveur

    // Les champs qui suivent seront disponibles si et
    // seulement si le statut du paiement est égal à "completed".
    fetch(`http://localhost:3000/api/v1/users/${id}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      console.log(data.coins);
      if (invoice.status === "completed") {
        fetch(`http://localhost:3000/api/v1/users/${id}`, {
          method: 'PATCH',
          body: JSON.stringify({
            'coins': data.coins + 200
          }),
          headers: {
            'Content-Type': 'application/json',
            'X-User-Email': `${mail}`,
            'X-User-Token': `${auth_token}`,
          }
        })
        .then(response => response.json())
        .then(json => console.log(json))

      }
    });
    console.log(old_coins);
    // Vous pouvez récupérer le nom, l'adresse email et le
    // numéro de téléphone du client en utilisant l'objet suivant
    console.log(invoice.customer); // {name: 'Alioune', phone: '773830274', email: 'aliounebadara@gmail.com'}

    window.location.replace('http://localhost:3000/');
    // URL du reçu PDF électronique pour téléchargement
    console.log(invoice.receiptURL); // 'https://app.paydunya.com/sandbox-checkout/receipt/pdf/test_VPGPZNnHOC.pdf'
  })
  .catch(function (e) {
    console.log(e);
  });
}

