# Labb #2 (Objective-C) – Quizapp (Examinerande!)

Er uppgift är att skapa en Quiz-app för en spelare åt gången.<br>
Gör appens GUI så att det fungerar bra på iPhone 5 / iPhone SE (6-tumsskärm).<br>

<b>G-nivå</b><br>

Appen slumpar mellan ett antal frågor (minst tio)<br>
Spelaren väljer alternativ med hjälp av fyra knappar som presenterar olika möjliga svar<br>
Varje fråga har tre olika felaktiga alternativ (specialskrivna för respektive fråga)<br>
När man svarat får man veta om det var rätt eller fel (genom exempelvis en text-label), spelaren kan sedan trycka på en knapp för att få en ny fråga att svara på<br>
Appen har en separat klass för spellogiken ("model") som view-controllern använder för att generera frågor och veta om man svarat rätt<br>

<b>VG-nivå</b><br>

Samma fråga ska inte kunna återkomma flera gånger<br>
Efter fem frågor får man se en sammanställning med antal rätt och antal fel man hade<br>
En knapp för att spela igen (denna visas bara när man spelat klart)<br>
