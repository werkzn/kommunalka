CREATE OR REPLACE FUNCTION f_validate_payment(
    p_month INTEGER,
    p_year INTEGER,
    p_utilities NUMERIC
)
RETURNS VOID AS
$$
DECLARE
    v_exists BOOLEAN;
BEGIN
    -- Проверка месяца
    IF p_month < 1 OR p_month > 12 THEN
        RAISE EXCEPTION 'Месяц % недопустим. Месяц должен быть от 1 до 12', p_month;
    END IF;
    
    -- Проверка года
    IF p_year < 2025 OR p_year > 2050 THEN
        RAISE EXCEPTION 'Год % недопустим. Год должен быть от 2025 до 2050', p_year;
    END IF;
    
    -- Проверка суммы
    IF p_utilities < 0 THEN
        RAISE EXCEPTION 'Сумма коммуналки не может быть отрицательной: %', p_utilities;
    END IF;
      
    -- Проверка на дубликат
    SELECT EXISTS(
        SELECT 1 FROM t_payments 
        WHERE payment_year = p_year AND payment_month = p_month
    ) INTO v_exists;
    
    IF v_exists THEN
        RAISE EXCEPTION 'Запись за % месяц % года уже существует', p_month, p_year;
    END IF;
END;
$$
LANGUAGE plpgsql;