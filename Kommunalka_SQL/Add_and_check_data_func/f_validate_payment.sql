CREATE OR REPLACE FUNCTION f_validate_payment(
    p_month INTEGER,
    p_year INTEGER,
    p_utilities NUMERIC
)
RETURNS VOID AS
$$
BEGIN
    -- Проверка месяца
    IF p_month < 1 OR p_month > 12 THEN
        RAISE EXCEPTION 'Месяц % недопустим. Месяц должен быть от 1 до 12', p_month;
    END IF;
    
    -- Проверка года
    IF p_year < 2000 OR p_year > 2100 THEN
        RAISE EXCEPTION 'Год % недопустим. Год должен быть от 2000 до 2100', p_year;
    END IF;
    
    -- Проверка суммы
    IF p_utilities < 0 THEN
        RAISE EXCEPTION 'Сумма коммуналки не может быть отрицательной: %', p_utilities;
    END IF;
    
    -- Если все проверки пройдены, функция просто завершается
END;
$$
LANGUAGE plpgsql;