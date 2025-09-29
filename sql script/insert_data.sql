INSERT INTO customers (customer_id, name, region) VALUES (1001, 'Tonny Claire', 'Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (1002, 'Mbabazi Sandra', 'Huye');
INSERT INTO customers (customer_id, name, region) VALUES (1003, 'Uwera Ange', 'Musanze');
INSERT INTO customers (customer_id, name, region) VALUES (1004, 'Uwase Ritha', 'Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (1005, 'Manzi Chris', 'Huye');


-- Insert sample products
INSERT INTO products (product_id, name, category) VALUES (2001, 'Coffee Beans', 'Beverages');
INSERT INTO products (product_id, name, category) VALUES (2002, 'Tea Pack', 'Beverages');
INSERT INTO products (product_id, name, category) VALUES (2003, 'Bread', 'Bakery');
INSERT INTO products (product_id, name, category) VALUES (2004, 'Sugar', 'Grocery');
INSERT INTO products (product_id, name, category) VALUES (2005, 'Cooking Oil', 'Grocery');

-- Insert sample transactions
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3001, 1001, 2001, DATE '2025-01-15', 25000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3002, 1002, 2003, DATE '2025-01-20', 15000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3003, 1003, 2002, DATE '2025-02-05', 18000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3004, 1004, 2004, DATE '2025-02-15', 22000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3005, 1005, 2005, DATE '2025-03-01', 30000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3006, 1001, 2003, DATE '2025-03-10', 12000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3007, 1002, 2005, DATE '2025-04-05', 28000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3008, 1003, 2001, DATE '2025-04-20', 26000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3009, 1004, 2002, DATE '2025-05-02', 14000);

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) 
VALUES (3010, 1005, 2004, DATE '2025-05-15', 19000);

COMMIT;