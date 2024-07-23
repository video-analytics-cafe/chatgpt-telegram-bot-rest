# эту команду один раз в терминале запустить
cd chatgpt-telegram-bot-rest
docker-compose up -d --build

PIDS=$(ps aux | grep 'docker-compose logs' | grep -v grep | awk '{print $2}')

if [ ! -z "$PIDS" ]; then
  echo "Killing process(es): $PIDS"
  kill -9 $PIDS
else
  echo "No matching processes found."
fi

nohup docker-compose logs -f > log_compose.log 2>&1&
echo "LOGS IN log_compose.log"
cd ..
tail -f chatgpt-telegram-bot-rest/log_compose.log
