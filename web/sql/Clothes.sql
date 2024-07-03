create database shopping_data

use shopping_data

drop table Shopping_cart_item
drop table Payment
drop table Shopping_cart
drop table Product_category
drop table Order_Product
drop table Orders
drop table Users
drop table Product

CREATE TABLE Users(
	userId int identity(1,1) PRIMARY KEY NOT NULL,
	userName varchar(255) not null,
	name_user nvarchar(255) null,
	pass varchar(255) not null,
	userAddress nvarchar(255) null,
	phone varchar(20) null,
	email varchar(255) null,
	isSell int null,
	isAdmin int null
)

CREATE TABLE Product_category(
	prod_category_id int identity(1,1) PRIMARY KEY NOT NULL,
	prod_category_name nvarchar(255) null
)

CREATE TABLE Product(
	productId int identity(1,1) PRIMARY KEY NOT NULL,
	prod_name nvarchar(255) null,
	prod_image nvarchar(max) null,
	descriptions nvarchar(max) null,
	price money null,
	quantity int null,
	prod_category_id int FOREIGN KEY REFERENCES Product_category(prod_category_id)
)

CREATE TABLE Orders(
	orderId int identity(1,1) PRIMARY KEY NOT NULL,
	order_date Date null,
	total_price money null,
	statuss nvarchar(max) null,
	address_shipping nvarchar(max) null,
	userId int FOREIGN KEY REFERENCES Users(userId)
)

CREATE TABLE Shopping_cart(
	shoppingcartId int identity(1,1) PRIMARY KEY NOT NULL,
	orderId int FOREIGN KEY REFERENCES Orders(orderId),
	userId int FOREIGN KEY REFERENCES Users(userId)
)

CREATE TABLE Payment(
	paymentId int identity(1,1) PRIMARY KEY NOT NULL,
	payment_date Date null,
	method nvarchar(255) null,
	shoppingcartId int FOREIGN KEY REFERENCES Shopping_cart(shoppingcartId),
	userId int FOREIGN KEY REFERENCES Users(userId)
)

CREATE TABLE Shopping_cart_item(
	shoppingcart_itemId int identity(1,1) PRIMARY KEY NOT NULL,
	shoppingcartitem_quantity int null,
	size varchar(20) null,
	productId int FOREIGN KEY REFERENCES Product(productId),
	shoppingcartId int FOREIGN KEY REFERENCES Shopping_cart(shoppingcartId)
)

CREATE TABLE Order_Product (
    orderId INT,
    productId INT,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

INSERT INTO [dbo].[Users]([userName],[name_user],[pass],[userAddress],[phone],[email],[isSell],[isAdmin])
VALUES('letandai',N'Lê Tấn Đại','letandai1304',N'Quảng Nam','0342750625','letandai1304@gmail.com','0','1'), 
	('hoangphuc',N'Nguyễn Văn Hoàng Phúc','hoangphuc456',N'Đà Nẵng','0940123890','hoangphuc2002@gmail.com','1','0'),
	('tancuong',N'Trương Quốc Cường','tancuong1999',N'Đà Nẵng','0867345320','tancuong1999@gmail.com','1','0'),
	('baole',N'Lê Thế Bảo','baole2001',N'Sài Gòn','0567345123','thebao2001@gmail.com','0','1'),
	('baohan',N'Đinh Bảo Hân','baohan2000',N'Hà Nội','0356789123','dinhbaohan2000@gmail.com','0','1')

INSERT INTO [dbo].[Product_category]([prod_category_name])VALUES(N'T-shirt'), (N'Shirt'), (N'Jacket')


INSERT INTO [dbo].[Product]([prod_name],[prod_image],[descriptions],[price],[quantity],[prod_category_id])
VALUES
(N'Mickey Mouse Men T-shirt',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-thun-nam-tsm7037-tra-1.jpg',N'Youthful and dynamic Mickey Mouse motif design. The perfect choice for men who love comfort, style and personality. Diverse colors, easy to coordinate. Size suitable for many body shapes.','269.000','100','1'),
(N'Hand Painted Donald Duck Regular Men T-shirt',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/tsm7187-den-4.jpg',N'Cotton material makes the shirt soft, airy and comfortable to wear. The design with Donald Duck hand drawing makes it stand out and interesting for the wearer. This is a great choice for those who love individual and unique style.','300.000','50','1'),
(N'Men Sports T-shirt with Cross Letter Print',N'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/ao-thun-nam-stm6087-xbd-5.jpg?v=1690163442310',N'Sporty close-fitting T-shirt with a strong new design. The fabric is soft, airy, naturally elastic, and does not fade after many washes and uses. The product has good absorbency and is suitable for wearing to the gym or for daily exercise.','229.000','80','1'),
(N'Yoguu Censored T-shirt',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/gut7056-den-3.jpg',N'Part of the YOGUU product line with the highlight of the Censored star print on the front creating style. Basic design, easy to wear, easy to coordinate, diverse colors. Suitable for both men and women to use. Size 1: Men under 65kg, Women under 60kg. Size 2: Men under 80kg, Women over 60kg.','400.000','150','1')

INSERT INTO [dbo].[Product]([prod_name],[prod_image],[descriptions],[price],[quantity],[prod_category_id])
VALUES
(N'Men Velvet Long Sleeve Shirt with Sleeves',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-so-mi-nam-smm6097-tit-4.jpg',N'Basic long-sleeved design, strong straight fit accentuates masculine physique. The highlight of EVERYDAY embossed lettering on the chest creates a youthful, dynamic style. Easily combined with casual pants, long khaki pants or shorts for many different occasions.','499.000','200','2'),
(N'Men Short Sleeve Patterned Shirt',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-so-mi-nam-yody-scm7073-tit-4.jpg',N'Bamboo fabric men shirts have become a trend in recent years. The product has the ability to regulate body temperature and naturally prevent wrinkles, so it is extremely popular with men. Textured design creates a distinct highlight.','459.000','80','2'),
(N'Bamboo Men Patterned Short Sleeve Shirt',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-so-mi-nam-coc-tay-scm7009-den-6.jpg',N'Own a bamboo fabric men shirt that is cool and wrinkle-resistant. Make your summer comfortable but still extremely neat. The product has an extremely luxurious and elegant pattern, attracting all eyes.','399.000','60','2'),
('Men Short Sleeve Cafe Shirt with Chest Pocket',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-so-mi-nam-CM7015-GHD%20(4).jpg',N'The fabric is light and slightly elastic, creating a comfortable feeling when moving. Dry and airy, absorbs sweat quickly, does not stick to odors. Anti-UV up to 98% helps protect skin from harmful effects of sunlight. Elegant design with sleeveless design and chest pocket, suitable for many situations: work, going out, walking around town.','469.000','180','2')

INSERT INTO [dbo].[Product]([prod_name],[prod_image],[descriptions],[price],[quantity],[prod_category_id])
VALUES
(N'Double Face Smart Men Sports Fleece Jacket',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-khoac-nam-swm6005-bee-2.jpg',N'Felt jacket with turned up collar, zipped pockets on both sides, back with rubber logo printed high up in the same color as the main fabric. The basic shape hugs and flatters the figure, bringing a neat feeling to the wearer. Simple solid color design.','599.000','250','3'),
(N'Men sport jacket with cuffed hem',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/skm5035-ddo-12.jpg',N'Thick felt fabric suitable for cold weather. The 1-layer stretch material makes the product extremely comfortable to use. The big, strong elastic band with the prominent logo is the highlight of the product, making it more eye-catching.','649.000','180','3'),
(N'3c Pro Family Men Jacket',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-khoac-nam-akm6017-dod-1.jpg',N'Basic 2-layer jacket with closed cuffs to keep you warmer when moving to avoid drafts. Detachable hood design, customizable hem. The shirt pocket has a convenient lock for storing personal items. Combine a variety of outfits with t-shirts, wool, jeans/khaki pants.','499.000','150','3'),
(N'Men 3C 2-Layer Sports Windbreaker with Back Coat',N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/AKM4027-XDM,%20QJM3077-XDE%20(5).jpg',N'The jacket has a simple design, a strong cut, and elastic cuffs at the wrists to help the wearer look neater and fit better. The hat is detachable and the mouth of the hat has an elastic thread, very youthful and delicate','280.000','120','3')

INSERT INTO [dbo].[Orders]([order_date], [total_price], [statuss], [address_shipping], [userId])
VALUES
('2024-06-15', '2500000', 'Shipped', N'123 Example St, Da Nang', '1'),
('2024-06-16', '1200000', 'Pending', N'456 Sample Rd, Hanoi', '2'),
('2024-06-17', '1500000', 'Delivered', N'789 Test Ave, HCMC', '3'),
('2024-06-18', '2000000', 'Processing', N'321 Dummy Blvd, Da Nang', '4'),
('2024-06-19', '1800000', 'Cancelled', N'654 Placeholder Ln, Hanoi', '5');

INSERT INTO [dbo].[Shopping_cart]([orderId], [userId])
VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5');

INSERT INTO [dbo].[Payment]([payment_date], [method], [shoppingcartId], [userId])
VALUES
('2024-06-15', N'Bank Transfer', '1', '1'),
('2024-06-16', N'Cash on Delivery', '2', '2'),
('2024-06-17', N'Bank Transfer', '3', '3'),
('2024-06-18', N'Cash on Delivery', '4', '4'),
('2024-06-19', N'Cash on Delivery', '5', '5');

INSERT INTO [dbo].[Shopping_cart_item]([shoppingcartitem_quantity], [size], [productId], [shoppingcartId])
VALUES
('2', 'L', '1', '1'),
('1', 'M', '2', '2'),
('3', 'S', '3', '3'),
('4', 'S', '4', '4'),
('2', 'L', '5', '5');

INSERT INTO [dbo].[Order_Product]([orderId], [productId])
VALUES 
('1', '1'),
('2', '3'),
('3', '2'),
('4', '4'),
('5', '1');

select * from [dbo].[Users]
select * from [dbo].[Shopping_cart_item]
select * from [dbo].[Shopping_cart]

select * from [dbo].[Product_category]
select * from [dbo].[Product]
select * from [dbo].[Payment]
select * from [dbo].[Orders]
select * from [dbo].[Order_Product]

UPDATE Product
SET prod_name = 'Hand Painted Donald Duck Regular Men'
WHERE productId = 2;

UPDATE Product
SET prod_name = 'Men Short Sleeve Cafe Shirt with Pocket'
WHERE productId = 8;

UPDATE Product
SET prod_name = 'Men 3C 2-Layer Sports Windbreaker'
WHERE productId = 12;

SELECT *
FROM Shopping_cart sc
JOIN Shopping_cart_item sci ON sc.shoppingcartId = sci.shoppingcartId
JOIN Product p on sci.productId = p.productId
WHERE sc.userId = 1;