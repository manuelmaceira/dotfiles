import csv

rang = ""
zsh = ""

with open("/home/micah/.config/ranger/rc.conf.base") as rg:
    rang+=rg.read()

with open("/home/micah/.config/Scripts/folders") as fold:
    for line in csv.reader(fold, dialect="excel-tab"):
        #Adds the ranger go, tab, move and yank commands:
        rang+=("map g"+line[0]+" cd "+line[1]+"\n")
        rang+=("map t"+line[0]+" tab_new "+line[1]+"\n")
        rang+=("map m"+line[0]+" shell mv %s "+line[1]+"\n")
        rang+=("map Y"+line[0]+" shell cp -r %s "+line[1]+"\n")
        #Adds the zsh shortcuts:
        zsh+=("alias "+line[0]+"=\"cd "+line[1]+"; echo \$PWD\"\n")

#Goes thru the config file file and adds the shortcuts to both zsh and ranger.

with open("/home/micah/.config/Scripts/configs") as conf:
    for line in csv.reader(conf, dialect="excel-tab"):
        zsh+=("alias "+line[0]+"=\"vim "+line[1]+"\"\n")
        rang+=("map "+line[0]+" shell vim "+line[1]+"\n")


with open("/home/micah/.config/ranger/rc.conf", "w") as outrang:
    outrang.write(rang)
with open("/home/micah/.zsh_shortcuts","w") as outbash:
    outbash.write(zsh)
