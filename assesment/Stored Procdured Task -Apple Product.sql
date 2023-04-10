create database Apple_Product

CREATE TABLE Products (
  product_code INT PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10,2),
  quantity_remaining INT,
  quantity_sold INT
);

CREATE TABLE Sales (
  order_id INT PRIMARY KEY,
  order_date DATE,
  product_code INT,
  quantity_ordered INT,
  sale_price DECIMAL(10,2),
  FOREIGN KEY (product_code) REFERENCES Products(product_code)
);


INSERT INTO Products (product_code, product_name, price, quantity_remaining, quantity_sold)
VALUES (101, 'iPhone X', 999.99, 100, 20),
       (102, 'iPad Air', 699.99, 50, 10),
       (103, 'MacBook Pro', 1499.99, 25, 5),
       (104, 'AirPods', 199.99, 75, 15);

INSERT INTO Sales (order_id, order_date, product_code, quantity_ordered, sale_price)
VALUES (1001, '2022-03-15', 101, 2, 949.99),
       (1002, '2022-03-20', 102, 1, 649.99),
       (1003, '2022-03-25', 101, 3, 999.99),
       (1004, '2022-04-01', 104, 2, 199.99);


select * from Products;
select * from Sales;


CREATE or alter PROCEDURE updatesales @product_code INT,  @quantity_ordered INT,  @sale_price DECIMAL(10,2)
AS
BEGIN

  DECLARE @quantity_remaining INT;

  -- select the quantity remainaing
  SELECT @quantity_remaining = quantity_remaining
  FROM Products
  WHERE product_code = @product_code;

    IF @quantity_remaining >= @quantity_ordered
	BEGIN
	  -- Decrement the quantity
	  UPDATE Products
	  SET quantity_remaining = quantity_remaining - @quantity_ordered,
		  quantity_sold = quantity_sold + @quantity_ordered
	  WHERE product_code = @product_code;

	  -- Add a new sale record
	  INSERT INTO Sales (order_id, order_date, product_code, quantity_ordered, sale_price)
	  VALUES (((SELECT MAX(order_id) FROM Sales)+1),GETDATE(), @product_code, @quantity_ordered, @sale_price);
	END
	ELSE
		BEGIN
		 PRINT 'Product ' + CAST(@product_code AS VARCHAR) + ' is not available.';
	END
END

EXEC updatesales 101 , 100 , 949.99;
