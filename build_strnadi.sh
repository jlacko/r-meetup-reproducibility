# vystavět z dockerfilu v aktuálním adresáři (je jediný) image s názvem strnadi
# výstup stavět do logu (kdyby něco spadlo... :)
docker build -t strnadi ./strnadi | tee ../build.log

