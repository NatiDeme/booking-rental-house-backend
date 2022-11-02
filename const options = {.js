const options = {
  method: 'POST',
  headers: {
    Authorization: 'bearer  eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Njc4Mjg0NzJ9.-KlD0fkyjFptRVkwrrKSB1-yeKGynM42EcA-IhW9IVc'
  },
  body: '{}'
};

fetch('http://localhost:3000/tours', options)
  .then(response => response.json())
  .then(response => console.log(response))
  .catch(err => console.error(err));