# Exercise 4: Twitch Data
## Task 1: Kappa or Trihard

(1) Finding Twitch Emoticons

**Per** CSV: 

$ grep -w -E '(kappa|trihard)' 1.csv | wc -l
>Output: 758

$ grep -w -E '(kappa|trihard)' 2.csv | wc -l
> Output: 91

$ grep -w -E '(kappa|trihard)' 3.csv | wc -l
> Output: 318

$ grep -w -E '(kappa|trihard)' 4.csv | wc -l
> Output: 180

$ grep -w -E '(kappa|trihard)' 5.csv | wc -l
> Output: 694

$ grep -w -E '(kappa|trihard)' 6.csv | wc -l
> Output: 622

$ grep -w -E '(kappa|trihard)' 7.csv | wc -l
>Output: 349

$ grep -w -E '(kappa|trihard)' 8.csv | wc -l
> Output: 674

$ grep -w -E '(kappa|trihard)' 9.csv | wc -l
> Output: 904

$ grep -w -E '(kappa|trihard)' 10.csv | wc -l
> Output: 223

$ grep -w -E '(kappa|trihard)' 11.csv | wc -l
> Output: 1389

$ grep -w -E '(kappa|trihard)' 12.csv | wc -l
> Output: 249

$ grep -w -E '(kappa|trihard)' 13.csv | wc -l
> Output: 172

**Erklärung**:
"Grep" ist der Befehl, um Dateien zu durchsuchen. -w sorgt dafür, dass das genaue Wort gefunden wird und nicht etwa Teilentsprechungen wie bei Kappa und Kappapride.
-E sorgt dafür, dass regular Expressions bei der Suche verwendet werden können. Es hat ewig gedauert, bis ich das herausgefunden habe und ist mir auch durch die Vorlesungen nicht 
klar geworden, dass wir dies der Shell sagen müssen. Danach folgen die jeweiligen CSV-Dateien 1-13 bzw. in der knappen Lösung \*.csv als wildcard, so dass alle CSV-Dateien im
entsprechenden Verzeichnis angesprochen und durchsucht werden.

**In allen CSV-Dateien**:

$ grep -w -E '(kappa|trihard)' \*.csv | wc -l

> Output: 6622

## Task 2: 911 or 110

Mit ***cut*** können Spalten aus Zeilen extrahiert werden. Wir wollen alle Zeilen haben, in denen in den Benutzernamen die Zahlenkombinationen ```911``` oder ```110``` vorkommen. 
Deswegen schneiden wir diese Spalte aus, damit es nicht zu falschen Daten kommt, da die erste Spalte (Datum) sehr wahrscheinlich auch diese Zahlenkombination erhalten 
kann. -d, zeigt an, dass wir die Spalten beim Zeichen Komma trennen wollen. ```-f2``` verweist auf das zweite Field, also das zweite nach Komma getrennte Feld, dass ausgeschnitten werden soll (das mit dem Benutzernamen).
Zur einfacheren Handhabung, schreibe ich alle Usernamen erst in eine neue Datei und durchsuche sie dann mit grep nach den Zahlenkombinationen.

**Dazu nutze ich die Befehle:**

$ cut -d, -f2 \*.csv > user_list.txt

Und:
$ grep -E '(911|110)' user_list.txt | wc -l

Diesmal ohne das -w, da es zu einem falschen Ergebnis führt, denn die Benutzernamen stehen in einem zusammenhängenden String innerhalb derer sich die Zahlenkombinationen befinden.

> Output: 8899

## Task 3: Chat-Messages

Ich gehe wieder den einfacheren Weg über eine neue Datei, die ich "chatmessages.txt" nenne und in der ich mittels $ cut -d, -f3 alle Chatmessages, bzw. das dritte Feld 
separiert durch Komma, einfüge.

$ cut -d, -f3 \*.csv > chatmessages.txt

Und danach suche ich alle Chatmessages mit mindestens 20 Zeichen (wobei ich nicht sicher bin, ob ich "charakter" hier richtig übersetze mit Zeichen, oder ob wirklich nur
Messages mit mindestens 20 Buchstaben gemeint sind. Ich habe meinen Befehl so aufgebaut, dass alle Messages mit mindestens 20 Zeichen erfasst werden und zwar so:

$ grep -E '(\w|\W){20}?\*' chatmessages.txt | wc -l

Erklärung: Suche any alphanumeric OR Non-alphanumeric char, repeat that 20 times, gefolgt von einem optionalen weiteren Charakter, der null mal oder öfter vorkommen darf.

> Output: 471617   FALSCH --> gleiche Anzahl wie alle Usernamen. Erfasst also alle chatmessages

(Kann man prüfen mit: 

$ wc -l chatmessages.txt

> Output 471617 chatmessages.txt


**Verwendung von . statt \w / \W:**


$ grep -E '(.){20}' chatmessages.txt | wc -l

$ grep -E '.{20}' chatmessages.txt | wc -l

$ grep -E '(....................).\*' chatmessages.txt | wc -l

Alle drei Befehle führen zum gleichen Ergebnis (```164834```) und sagen meiner Meinung nach: Suche irgendein Zeichen, dass sich 20 Mal wiederholt. Meiner Meinung müsste aber noch sowas wie: ```?*``` was ich übersetzte mit: Und einen optionalen Charakter, der sich beliebig oft wiederholen kann. Denn wir wollen ja die Messages mit mindestens 20 Zeichen, also auch die mit mehr als 20 Zeichen.

Das funktioniert aber nicht. Siehe:
$ grep -E '.{20}?\*' chatmessages.txt | wc -l
> Output: 471617 

**Note** Beide Lösungen sind - glaube ich - nicht richtig, aber ich finde die richtige Lösung nicht.

## Task 4: Nutzernamen in Datei schreiben

$ cut -d, -f2 \*.csv > user_list.txt

## Task 5: Unique Usernames

Nutzernamen sortieren und nur unique Nutzernamen ausspielen:

$ sort user_list.txt | uniq

> Output: Zu groß, um ihn hier einzufügen. 
 
**Note:** Bin nicht sicher, was mit "overview" gemeint ist, ein tatsächlicher Überblick über alle Nutzernamen, oder nur die Anzahl der uniquen Namen.
Falls nur die Anzahl gewünscht ist geht das mit:

sort user_list.txt | uniq | wc -l 

>Output: 73386

## Task 6

Alle einmaligen Chatmessages alphabetisch sortiert in neue Datei unique_comments.txt schreiben:

$ sort chatmessages.txt | uniq > unique_comments.txt
