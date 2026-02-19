1.Создадим таблицу для хранения данных
CREATE TABLE t_payments (
    id SERIAL PRIMARY KEY,
    payment_date DATE NOT NULL,
    fixed_rent NUMERIC(10,2) NOT NULL,
    utilities NUMERIC(10,2) NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);