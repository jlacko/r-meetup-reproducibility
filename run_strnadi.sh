# Spustit připravený kontejner strnadi
# + přeskočit uživatelskou autentikaci (jsme na lokálu)
# + připojit aktuální adresář jako home usera rstudio (defaultní user RStudia)
# + všechno se odehrává na portu 8787 (= default pro RStudio server version)
docker run \
 -e DISABLE_AUTH=true \
 -v $(pwd)/:/home/rstudio/ \
 --rm \
 -p 8787:8787 \
 strnadi

# clean up detritus...
rm -rf .config
rm -rf .local