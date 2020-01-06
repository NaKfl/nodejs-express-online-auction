const db = require("../utils/db");
const config = require("../config/default.json");

module.exports = {
  getProductByID: id =>
    db.load(
      `select p.name as name ,p.category,i.src,p.id, p.startDate ,p.bidStep, p.endDate , p.currentPrice , u.fullname , p.buynowPrice, p.details from product as p,user as u , image i where u.id = p.id_seller and p.id = i.id_product and p.id ='${id}'`
    ),
  getSellerProductByID: id =>
    db.load(
      `select  u.fullname from product as p,user as u , image i where u.id = p.id_seller and p.id = i.id_product and p.id = '${id}'`
    ),
    getBidderProductByID: id =>
    db.load(
      `select  u.fullname from product as p,user as u , image i where u.id = p.id_bidder and p.id = i.id_product and p.id = '${id}'`
    ),
  add: entity => db.add("product", entity),
  getCurrentProductId: async () => {
    const rows = await db.load(`select max(id) from product`);
    if (rows.length === 0) return null;
    return rows[0]["max(id)"];
  },
  getListHistoryProduct: id => db.load(`select * from biddinglist as b , user as u where b.id_user= u.id and b.id_product=${id}`),
  getAuctioningProductsBySellerID: idSeller =>
    db.load(
      `select * from product where id_seller = ${idSeller} and auctioned = 0;`
    ),
  getRelatedProduct : idcate => db.load(`SELECT p.id as idproduct,p.name,p.currentPrice , p.startDate, p.endDate, u.fullname ,count(b.id_product) as count from product as p LEFT JOIN user as u ON p.id_bidder = u.id LEFT JOIN biddinglist as b ON p.id = b.id_product where p.auctioned = 0 and p.category = ${idcate} GROUP BY p.id ORDER BY p.currentPrice DESC LIMIT 4`),
  checkIsSeller : idUser => db.load(`select permission from user where id=${idUser}`),
  checkIsMyProduct: (idUser,idProduct) => db.load(`select * from product where id = ${idProduct} and id_seller =${idUser}`)
};
