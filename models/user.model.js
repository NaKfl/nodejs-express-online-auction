const db = require("./../utils/db");

module.exports = {
  all: () => db.load("select * from user where status = 1"),
  // single: id => db.load(`select * from users where f_ID = ${}`),
  // single: id => db.load(`select * from users where id = ${id}`),
  singleByUsername: async username => {
    const rows = await db.load(
      `select * from user where status = 1 and username = '${username}'`
    );
    if (rows.length === 0) return null;
    return rows[0];
  },
  singleByEmailUsername: async (username, email) => {
    const rows = await db.load(
      `select * from user where username = '${username}' or email = '${email}'`
    );
    if (rows.length === 0) return null;
    return rows[0];
  },

  add: entity => db.add("user", entity),
  del: id => db.del("user", { f_ID: id }),

  update: (entity, userId) =>
    db.load(
      `update user  set fullname = '${entity.fullName}', email = '${entity.email}', phone = '${entity.phone}'  where id = ${userId}`
    ),

  changePass: (hashedPassword, userId) =>
    db.load(
      `update user  set password = '${hashedPassword}' where id = ${userId}`
    ),

  checkWishList: (idUser, idProduct) =>
    db.load(
      `select * from watchlist where id_user=${idUser} and id_product=${idProduct}`
    ),
  addWishList: (idUser, idProduct) =>
    db.load(`insert into watchlist values(${idUser},${idProduct})`),
  deleteWishList: (idUser, idProduct) =>
    db.load(
      `delete from watchlist where id_user=${idUser} and id_product=${idProduct}`
    ),
  getWishListbyID: idUser =>
    db.load(
      `select * from watchlist as w ,product as p where w.id_user = ${idUser} and w.id_product=p.id `
    ),
  getWishListbyID_Name: (idUser, name) =>
    db.load(
      `select * from watchlist as w ,product as p where w.id_user = ${idUser} and w.id_product=p.id and name like '%${name}%'`
    ),
  getListProductOfSeller: idSeller =>
    db.load(
      `select * from product where id_seller= ${idSeller} and auctioned=0`
    ),
  getListProductOfBidding: idBidder =>
    db.load(
      `select * from product where id_bidder= ${idBidder} and auctioned=0`
    ),

  singleByID: id => db.load(`select * from user where id = ${id}`), //////// làm sao thay thế cho #each trong profile và edit và changePassword
  singleRowByID: async id => {
    const rows = await db.load(`select * from user where id = '${id}'`);
    if (rows.length === 0) return null;

    return rows[0];
  },

  checkWishList: (idUser, idProduct) =>
    db.load(
      `select * from watchlist where id_user=${idUser} and id_product=${idProduct}`
    ),
  addWishList: (idUser, idProduct) =>
    db.load(`insert into watchlist values(${idUser},${idProduct})`),
  deleteWishList: (idUser, idProduct) =>
    db.load(
      `delete from watchlist where id_user=${idUser} and id_product=${idProduct}`
    ),

  getNumberOfReviews: async idUser => {
    const rows = await db.load(
      `select count(*) as "number_of_reviews" from review where id_user=${idUser};`
    );
    if (rows.length === 0) return null;
    return rows[0];
  },

  getNumberOfPositiveReviews: async idUser => {
    const rows = await db.load(
      `select count(*) as "positive_reviews" from review where id_user=${idUser} and marks = 1;`
    );
    if (rows.length === 0) return null;
    return rows[0];
  },

  // add: entity => db.add("users", entity),
  // del: id => db.del("users", { f_ID: id })

  getListProductOfWon: idBidder =>
    db.load(`select product.*, user.username as winner, user2.username as seller
  from product, user, user as user2
  WHERE product.id_bidder = user.id and product.id_seller = user2.id
  and user.id = ${idBidder}
  and auctioned=1;`),
  getListProductAuctioned: idSeller =>
    db.load(`select product.*, user.username as winner, user2.username as seller
  from product, user, user as user2
  WHERE product.id_bidder = user.id and product.id_seller = user2.id
  and user2.id = ${idSeller}
  and auctioned=1;`),

  getListProductOfWonFromYou: (userId, yourID) =>
    db.load(`select product.*, user.username as winner, user2.username as seller
  from product, user, user as user2
  WHERE product.id_bidder = user.id and product.id_seller = user2.id
  and user.id = ${userId}
  and user2.id = ${yourID}
  and auctioned=1;`),
  getListProductAuctionedForYou: (userId, yourID) =>
    db.load(`select product.*, user.username as winner, user2.username as seller
  from product, user, user as user2
  WHERE product.id_bidder = user.id and product.id_seller = user2.id
  and user.id = ${yourID}
  and user2.id = ${userId}
  and auctioned=1;`),

  del: id => db.load(`update user set status = 0 where id = ${id}`),
  cancelRequest: id => db.load(`update user set request = 0 where id = ${id}`),
  confirmRequest: id =>
    db.load(`update user set request = 0 , permission = 1 where id = ${id}`)
};
