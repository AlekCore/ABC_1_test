#!/bin/bash

# =========================================================================
# АВТОМАТИЧЕСКАЯ КОРРЕКЦИЯ ПУТИ (для предотвращения "No such file or directory")
# Скрипт определяет, где он находится, и гарантирует запуск из корня проекта.
# =========================================================================
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ "$SCRIPT_DIR" == *"/lab0"* ]]; then
    # Если скрипт лежит внутри lab0 или глубже, поднимаемся в корень репозитория
    cd "${SCRIPT_DIR%%/lab0*}"
else
    cd "$SCRIPT_DIR"
fi

# Если папка lab0 уже была частично создана с ошибками, очистим её для чистого перезапуска
rm -rf lab0 2>/dev/null || true

# =========================================================================
# ОРИГИНАЛЬНЫЕ КОМАНДЫ ИЗ ЛАБОРАТОРНОЙ РАБОТЫ (сохранены на 100%)
# =========================================================================

# === Настройка окружения (Скриншот 2-3) ===
apt-get update && apt-get install -y less
sudo apt-get update && sudo apt-get install -y less

# === Создание древа каталогов и файлов (Скриншот 4-6) ===
git init

mkdir lab0
cd lab0
mkdir claude_monet
cd claude_monet
mkdir warehouse
mkdir meat_delivery
mkdir fish_delivery
mkdir kitchen
mkdir office
cd ..
touch delivery_call

# Имитация ошибочной команды со скриншота 5 (воспроизводится без падения скрипта)
cd warehouse 2>/dev/null || true 

cd claude_monet
cd warehouse
touch stock_list
touch rejection_log
cd ..
cd meat_delivery
touch senya_invoice
touch supplier_note
cd ..
cd fish_delivery
touch fedya_invoice
touch freshness_report
cd ..
cd kitchen
mkdir hot_station
cd hot_station
touch barinov_claim
cd ..
mkdir cold_station
cd cold_station
touch fish_order
cd ..
cd ..
cd office
touch vika_payment
cd ..

# === Заполнение файлов (Скриншот 7-9) ===
echo 'На складе осталось десять упаковок мяса
Свежая рыба размещена в холодильнике
Поставщик зелени ожидается вечером' > claude_monet/warehouse/stock_list
echo 'Поставщик забрал коробку испорченных овощей
Две упаковки мяса отправлены на возврат
Баринов потребовал заменить продукты сегодня' > claude_monet/warehouse/rejection_log
echo 'Говядина двадцать килограммов
Телятина десять килограммов
Поставщик мяса подтвердил вес заказа' > claude_monet/meat_delivery/senya_invoice
echo 'Доставка мяса задержалась на сорок минут
Сеня принял продукты на складе
Следующий заказ привезут утром' > claude_monet/meat_delivery/supplier_note
echo 'Сибас двенадцать штук
Дорадо восемь штук
Поставщик рыбы добавил коробку льда' > claude_monet/fish_delivery/fedya_invoice
echo 'Рыба имеет свежий запах
Температура при доставке не нарушена
Федя разрешил использовать весь заказ' > claude_monet/fish_delivery/freshness_report
echo 'Баринов недоволен опозданием машины
Шеф требует проверять каждого поставщика
Качество продуктов важнее скидки' > claude_monet/kitchen/hot_station/barinov_claim
echo 'Для банкета требуется свежая рыба
Федя выбрал сибаса и дорадо
Заказ нужно передать Вике' > claude_monet/kitchen/cold_station/fish_order
echo 'Вика получила накладные от Сени и Феди
Оплата поставщикам назначена на вечер
Возврат продуктов вычитается из суммы' > claude_monet/office/vika_payment
echo 'Поставщик позвонил перед открытием ресторана
Машина с продуктами стоит у входа
Лёва должен открыть склад' > delivery_call

# === Настройка доступа (Скриншот 10-12) ===
chmod 755 claude_monet/
# Ошибочная команда со скриншота 10 (пропущены запятые)
chmod u=rwx g=rx o= claude_monet/warehouse/ 2>/dev/null || true 
chmod u=rwx,g=rx,o= claude_monet/warehouse/
chmod 640 claude_monet/warehouse/stock_list
chmod u=rw,g=r,o= claude_monet/warehouse/rejection_log
chmod 750 claude_monet/meat_delivery/
chmod u=rw,g=r,o= claude_monet/meat_delivery/senya_invoice
chmod 644 claude_monet/meat_delivery/supplier_note
chmod u=rwx,g=rx,o= claude_monet/fish_delivery/
chmod 640 claude_monet/fish_delivery/fedya_invoice
chmod u=rw,g=r,o=r claude_monet/fish_delivery/freshness_report
chmod 750 claude_monet/kitchen/
chmod u=rwx,g=rx,o= claude_monet/kitchen/hot_station/
chmod 640 claude_monet/kitchen/hot_station/barinov_claim
chmod u=rwx,g=rx,o= claude_monet/kitchen/cold_station/
chmod u=rw,g=r,o= claude_monet/kitchen/cold_station/fish_order
chmod 750 claude_monet/office/
chmod 640 claude_monet/office/vika_payment
chmod u=rw,g=r,o= delivery_call

# === Первый commit и push (Скриншот 13) ===
git add .
git status
git commit -m 'lab0_part1'
git push --set-upstream https://github.com/AlekCore/ABC_1 master || true

# === Ссылки, копирование, перемещение (Скриншот 14) ===
cp delivery_call claude_monet/office/call_copy
cp -r claude_monet/fish_delivery claude_monet/warehouse/fish_backup
ln -s claude_monet/warehouse/stock_list stock_link
cd claude_monet/kitchen/
ln -s ../warehouse warehouse_access
cd ../..
ln claude_monet/meat_delivery/senya_invoice claude_monet/meat_delivery/invoice_duplicate
cat claude_monet/meat_delivery/senya_invoice claude_monet/fish_delivery/fedya_invoice > claude_monet/warehouse/all_invoices
cat claude_monet/warehouse/rejection_log >> claude_monet/kitchen/hot_station/barinov_claim
mv claude_monet/kitchen/cold_station/fish_order claude_monet/office/urgent_fish_order

# === Второй commit и push (Скриншот 15-16) ===
git status
git add .
git status
git commit -m 'lab0_part2_links_copy_move'
git push || true

# === Поиск, фильтрация, обработка данных (Скриншот 17-18) ===
ls -lR | grep "^-" | grep -v "copy" | sort -n -k 5 | tail -n 5
grep -rhi -E "поставщик|продукт" claude_monet/ | grep -v "утром" | sort | head -n 6
grep -rl "рыб" claude_monet/fish_delivery claude_monet/warehouse/fish_backup | wc -l
tail -q -n 2 claude_monet/meat_delivery/*_invoice claude_monet/fish_delivery/*_invoice | grep -i -E "поставщик|килограмм|штук" | sort -r
grep -v "поставщик" claude_monet/warehouse/all_invoices | sort -r | head -n 3 | wc -w
ls -lR | grep "^-" | awk '$2 == 2' | sort -n -k 1
ls -lR | grep "^l" | sort -k 9 | tail -n 1

# === Удаление файлов, ссылок, каталогов (Скриншот 19) ===
rm claude_monet/office/call_copy
rm stock_link
rm claude_monet/kitchen/warehouse_access
rm claude_monet/meat_delivery/invoice_duplicate
rm claude_monet/office/urgent_fish_order
rmdir claude_monet/kitchen/cold_station
rm claude_monet/warehouse/rejection_log
rm -r claude_monet/warehouse/fish_backup

# === Последний commit и push (Скриншот 20) ===
git status
git add .
git commit -m 'lab0_part3_after_deleting'
git push || true
