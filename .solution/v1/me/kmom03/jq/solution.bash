#!/bin/bash

# 1. Hitta de 'keys' som finns. Lägg svaret i filen `a.txt`.
jq 'keys' tag-dbwebb.json | tee a.txt

# 2. Vilket värde har `meta.code` som är statuskoden för HTTP requesten (b.txt)?
jq '.meta.code' tag-dbwebb.json | tee b.txt

# 3. Filen innehåller en länk till nästa resultat i flödet, en så kallad pagination. Visa länken till nästa länk (next_url) (c.txt).
jq '.pagination.next_url' tag-dbwebb.json | tee c.txt

# 4. Hur många 'likes' har den tionde bilden (d.txt).
jq '.data[9].likes.count' tag-dbwebb.json | tee d.txt

# 5. Vilka taggar (tags) har den första bilden (e.txt).
jq '.data[0].tags' tag-dbwebb.json | tee e.txt

# 6. Visa detaljer om den användare (user) som lagt upp den första bilden (f.txt).
jq '.data[0].user' tag-dbwebb.json | tee f.txt

# 7. Den första bilden är tagen på en viss plats (location) som har ett visst namn (name), vilket (g.txt)?
jq '.data[0].location.name' tag-dbwebb.json | tee g.txt

# 8. Den första bilden har en kommentar (comments), visa texten (text) för kommentaren (h.txt).
jq '.data[0].comments.data[0].text' tag-dbwebb.json | tee h.txt

# 9. Den första bilden har flera likes. Visa namnet på den andra personen som gjorde like på bilden (i.txt).
jq '.data[0].likes.data[1].full_name' tag-dbwebb.json | tee i.txt

# 10. Visa länken till den första bilden som är av standard_resolution (j.txt).
jq '.data[0].images.standard_resolution.url' tag-dbwebb.json | tee j.txt

# 11. Användaren alkifaey har gjort en kommentar. Använd användarnamnet och visa själva kommentare (text) (k.txt).
jq '.data[].comments.data[] | select(.from.username == "alkifaey") | .text' tag-dbwebb.json | tee k.txt

# 12. Lista länkarna (link) till bilderna som användaren 'tobhed' har kommenterat (l.txt).
jq '.data[] | select(.comments.data[].from.username == "tobhed") | .link' tag-dbwebb.json | tee l.txt

# 13. Lista länkarna till de bilder med fler 'likes' än 3 (m.txt).
jq '.data[] | select(.likes.count > 7) | .link' tag-dbwebb.json | tee m.txt 

# 14. Lista länkarna till de bilder som har fler än 5 'likes' och minst 1 'comment' (n.txt).
jq '.data[] | select(.likes.count > 5 and .comments.count > 0) | .link' tag-dbwebb.json | tee n.txt

# 15. Hitta användarnamnet (username) på användare som likeat bilden som är tagen på 'Studentviken' (location "Studentviken") (o.txt).
jq '.data[] | select(.location.name=="Studentviken") | .likes.data[].username' tag-dbwebb.json | tee o.txt
