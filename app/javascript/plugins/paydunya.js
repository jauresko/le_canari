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


const paymentButton = document.getElementById('payment-trigger')

if (paymentButton) {
  paymentButton.addEventListener('click', () =>{
    const invoice = new paydunya.CheckoutInvoice(setup, store);
    invoice.description = 'Achats BD';
    invoice.totalAmount = 200;

    invoice.create()
      .then(function () {
        invoice.status;
        invoice.token; // invoice token
        invoice.responseText;
        invoice.url; // PAYDUNYA redirect checkout url
        window.location.replace(invoice.url);
      })
      .catch(function (e) {
        console.log(e);
      });
  })

  console.log(window.location.href);
}


