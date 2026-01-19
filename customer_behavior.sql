USE customer_behavior;

-- Verify table
DESCRIBE customer;

-- Analysis query
SELECT
    category,
    SUM(`purchase_amount_(usd)`) AS total_sales
FROM customer
GROUP BY category
ORDER BY total_sales DESC;

-- Stored Procedure
DROP PROCEDURE IF EXISTS get_total_sales_by_category;

DELIMITER //

CREATE PROCEDURE get_total_sales_by_category()
BEGIN
    SELECT
        category,
        SUM(`purchase_amount_(usd)`) AS total_sales
    FROM customer
    GROUP BY category
    ORDER BY total_sales DESC;
END //

DELIMITER ;

-- Execute procedure
CALL get_total_sales_by_category();
