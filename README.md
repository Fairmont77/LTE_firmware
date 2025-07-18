# OpenIPC Firmware з Masina Client

Цей проект автоматично збирає OpenIPC прошивку з інтегрованим Masina клієнтом за допомогою GitHub Actions.

## Особливості

- Автоматична збірка при push/pull request
- Інтеграція QuadroFleet-Masina клієнта (opt branch)
- Збереження артефактів збірки
- Автоматичне створення релізів при тегуванні

## Як використовувати

### 1. Налаштування репозиторія

1. Створіть новий репозиторій на GitHub
2. Клонуйте цей проект або скопіюйте файли
3. Запушіть код у ваш репозиторій

### 2. Запуск збірки

Збірка запускається автоматично при:
- Push у головну гілку (main/master)
- Створенні Pull Request
- Ручному запуску через вкладку Actions

### 3. Ручний запуск

1. Перейдіть у вкладку "Actions" вашого GitHub репозиторія
2. Виберіть workflow "Build OpenIPC Firmware with Masina"
3. Натисніть "Run workflow"

### 4. Завантаження прошивки

Після успішної збірки:
1. Перейдіть у вкладку "Actions"
2. Виберіть останній запуск workflow
3. Завантажте артефакт "openipc-firmware-masina"

### 5. Створення релізу

Для створення релізу:
```bash
git tag v1.0.0
git push origin v1.0.0
```

Прошивка автоматично буде додана до релізу.

## Структура проекту

```
.
├── .github/
│   └── workflows/
│       └── build-firmware.yml  # GitHub Actions workflow
└── README.md                   # Цей файл
```

## Що відбувається під час збірки

1. **Встановлення залежностей**: g++-arm-linux-gnueabihf, build-essential та інші
2. **Клонування репозиторіїв**:
   - OpenIPC firmware: `https://github.com/OpenIPC/firmware.git`
   - QuadroFleet-Masina (opt branch): `https://github.com/beep-systems/quadrofleet-masina.git`
3. **Збірка Masina клієнта**:
   ```bash
   cd quadrofleet-masina/client
   make clean
   make
   ```
4. **Копіювання файлів**:
   ```bash
   cp -r quadrofleet-masina/client/drop/* firmware/
   ```
5. **Збірка прошивки**:
   ```bash
   cd firmware
   make
   ```

## Вихідні файли

Після збірки створюються файли прошивки (*.bin, *.img, *.fw), які зберігаються як артефакти GitHub Actions.

## Налагодження

Якщо збірка не вдається:

1. Перевірте логи у вкладці Actions
2. Переконайтеся, що репозиторії OpenIPC та QuadroFleet-Masina доступні
3. Перевірте, чи є всі необхідні файли в quadrofleet-masina/client/drop/

## Підтримка

Для вирішення проблем:
- Перевірте Issues у відповідних репозиторіях
- Переконайтеся, що використовуються актуальні версії
- Звертайтеся до документації OpenIPC та QuadroFleet-Masina
