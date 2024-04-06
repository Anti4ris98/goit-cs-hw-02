# Список вебсайтів
websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

# Назва файлу логів
logfile="website_availability.log"

# Ініціалізація файлу логів
> "$logfile"

# Перевірка доступності сайтів
for website in "${websites[@]}"; do
  # Виконання curl з опцією --silent та --fail для правильної обробки HTTP помилок
  if status_code=$(curl --silent --fail --output /dev/null --write-out "%{http_code}" "$website"); then
    # Запис результату "UP"
    echo "[${website}] is UP" >> "$logfile"
  else
    # Запис результату "DOWN" з урахуванням можливих помилок
    echo "[${website}] is DOWN (HTTP Status: $status_code)" >> "$logfile"
  fi
done

# Повідомлення про завершення
echo "Результати записано у файл логів: $logfile"