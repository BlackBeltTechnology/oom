
NAME=$(/consul/config/bin/kubectl -n namespace-placeholder get pod | grep -o "aai-sparky-be[^[:space:]]*")

if [ -n "$NAME" ]; then
   if /consul/config/bin/kubectl -n namespace-placeholder exec -it $NAME -- ps -efww | grep 'java' | grep 'sparky' > /dev/null; then

      echo Success. UI Backend Service process is running. 2>&1
      exit 0
   else
      echo Failed. UI Backend Service process is not running. 2>&1
      exit 1
   fi
else
   echo Failed. UI Backend Service container is offline. 2>&1
   exit 1
fi
