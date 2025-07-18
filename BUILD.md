# Build Configuration

## Environment Variables

Ви можете налаштувати збірку через environment variables в GitHub Actions:

- `BUILD_TYPE`: Тип збірки (debug/release) - за замовчуванням release
- `TARGET_PLATFORM`: Цільова платформа - автоматично визначається
- `ENABLE_DEBUG`: Увімкнути debug інформацію (true/false)
- `CUSTOM_CONFIG`: Шлях до кастомного конфігураційного файлу

## Приклад використання

Додайте в workflow файл:

```yaml
env:
  BUILD_TYPE: release
  ENABLE_DEBUG: false
```

## Підтримувані платформи

- ARM Linux (основна)
- Інші платформи можуть потребувати додаткових налаштувань

## Кастомізація збірки

1. Створіть файл `build-config.sh` у корені проекту
2. Додайте необхідні параметри збірки
3. Workflow автоматично використає цей файл, якщо він існує
