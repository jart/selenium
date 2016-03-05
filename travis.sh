#/bin/sh

set -e
set -x

sh -e /etc/init.d/xvfb start

export CHROME_BIN=chrome-linux
export CHROME_REVISION=354250
export CHROMEDRIVER_VERSION=`curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE`

curl -L -O "http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/354250/chrome-linux.zip"
unzip chrome-linux.zip

curl -L -O "http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip

mv chromedriver chrome-linux/chromedriver
chmod +x chrome-linux/chromedriver

which chromedriver
chromedriver --version
which chrome
chrome --version
