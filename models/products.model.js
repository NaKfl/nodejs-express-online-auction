const db = require('../utils/db');
const config = require('../config/default.json');

module.exports = {
  getProductByID: id => db.load(`select p.name as name , p.startDate ,p.endDate , p.currentPrice , u.fullname , p.buynowPrice, p.details from product as p,user as u , image i where u.id = p.id_bidder and p.id = i.id_product and p.id ='${id}'`),
  getSellerProductByID: id => db.load(`select  u.fullname from product as p,user as u , image i where u.id = p.id_seller and p.id = i.id_product and p.id = '${id}'`),
  add: entity => db.add('product', entity),
  getCurrentProductId:()=>db.load('select max(id) from product'),
};
