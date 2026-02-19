--1.Создадим таблицу для хранения данных
CREATE TABLE t_payments (
    id SERIAL PRIMARY KEY,
    payment_date DATE NOT NULL,
    fixed_rent NUMERIC(10,2) NOT NULL,
    utilities NUMERIC(10,2) NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_year INTEGER NOT NULL,
    payment_month INTEGER NOT NULL
);

--2. Добавим ограничение, чтобы пользователь не смог вводить один и тот же месяц того же года
ALTER TABLE t_payments 
ADD CONSTRAINT unique_payment UNIQUE (payment_year, payment_month);