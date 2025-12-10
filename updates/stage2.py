# ПРОГРАММА: Учет расходов за квартиру
# ВЕРСИЯ: 1.1 - Ввод года с улучшениями
# АВТОР: werkzn

# Константы
MIN_YEAR = 2020
MAX_YEAR = 2050

print("=== Учет расходов за квартиру ===")

# Основной цикл ввода года
while True:
    # Запрос ввода
    year_input = input("Введите год: ")

    # 1. Проверка: не пустая строка
    year_clean = year_input.strip()
    if not year_clean:
        print("Ошибка: Нужно ввести год")
        print()  # Пустая строка для читаемости
        continue

    # 2. Проверка: только цифры
    if not year_clean.isdigit():
        print(f"Ошибка: '{year_input}' содержит не только цифры")
        print()
        continue

    # 3. Проверка: ровно 4 цифры
    if len(year_clean) != 4:
        print(f"Ошибка: Год должен содержать 4 цифры. Вы ввели: {len(year_clean)}")
        print()
        continue

    # 4. Преобразование в число (теперь безопасно)
    year_num = int(year_clean)

    # 5. Проверка диапазона
    if year_num < MIN_YEAR:
        print(f"Ошибка: Год {year_num} меньше минимального ({MIN_YEAR})")
        print()
        continue
    
    if year_num > MAX_YEAR:
        print(f"Ошибка: Год {year_num} больше максимального ({MAX_YEAR})")
        print()
        continue

    # Все проверки пройдены!
    print(f"\n✓ Успешно! Вы выбрали: {year_num} год")
    break

# Выводим финальный результат
print("\n" + "="*30)  # Разделитель
print(f"Год для учета расходов: {year_num}")
print("="*30)

# Ожидаем нажатия Enter перед завершением
input("\nНажмите Enter для выхода...")