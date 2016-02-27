0 CLS : A% = 15: P = 10: ER% = 7: EC% = 16: SHOT1% = 6: SHOT2% = EC%: B% = 25: L = 1
1 REM INPUT "Input drive and path you are running this from: ", DRIVE$
2 FILE1$ = ".\HISCORES.DAT"
4 CLS
 PRINT
 PRINT
 PRINT " "
 PRINT " _____ the    _   __  _    _____      ___  _"
 PRINT "|_____  |  | |_| |_  |_|  |_____  |_|  |  |_|"
 PRINT " _____| |__| |   |__ | \   _____| | | _|_ | "
 PRINT "D E F E N D E R   O F   T H E   M I L K Y   W A Y  "
 PRINT "           __________________________"
 PRINT "         | Super Ship Model HI-TEC1 |"
 PRINT " <X>      | Blueprints               |"
 PRINT " / \      |      |/\| <-HSM Ports    |"
 PRINT "          |   =  /  \  =             |"
 PRINT "          |    ==| H|==  <-Weapons1  |"
 PRINT "          |      | I|                |"
 PRINT "          |  \ / |  | \ / <-BLASTER  |"
 PRINT "          |   *  | T|  *             |"
 PRINT "          |  \*  | E|  */ <-Weapons2 |"
 PRINT "          |    * | C| *              |"
 PRINT "          |  (((*| 1|*))) <-Weapons3 |"
 PRINT "          |     ///\\\               |"
 PRINT "          |__________________________|"
 PRINT "HIT ENTER"
 INPUT "", ENTER$
 CLS
5 PRINT "     ___   ___   ___   ___        ___"
6 PRINT "|   |   | |___|  |  |   |  |\  | |  _"
7 PRINT "|__ |___| |   |  |__|  _|_ |  \| |___|"
8 PRINT "* H I G H    S C O R E    L I S T *"
9 OPEN FILE1$ FOR INPUT AS #1: INPUT #1, A$, A, B$, B, C$, C: SLEEP 5: CLS
10 PRINT "*Super Ship HIGH SCORE LIST*"
11 PRINT A$; " -"; A
12 PRINT B$; " :"; B
13 PRINT C$; " :"; C
14 SLEEP 5
15 CLS
16 PRINT "ENTER YOUR FIRST NAME:"
17 INPUT "", ONAME$
IF ONAME$ = "xxx" THEN GOSUB CHEATMODE
18 PRINT "ENTER YOUR LAST NAME:"
19 INPUT "", LNAME$
20 CLS
21 PRINT "READY TO BEGIN GAME"
22 PRINT "MAKE SURE NUM LOCK IS ON & PRESS ENTER..."; : INPUT "", ENTER$
23 CLS
24 DO: SLEEP 1: CLS : EC2% = EC% + 1: ER2% = ER%
 IF A% < 1 THEN A% = 1
 IF A% > 70 THEN A% = 70
 IF B% < 1 THEN B% = 1
 IF B% > 25 THEN B% = 25
27 LOCATE (B%), (A%)
28 COLOR (9): PRINT ""
29 IF SHOOT1 = 1 THEN
30 LOCATE (MA%), (MB%)
31 COLOR (14): PRINT J$
32 IF MA% > 1 THEN MA% = MA% - 1
33 IF MA% = 1 THEN
   SHOOT1 = 0
   HRD = 0
END IF
34 IF SHOOT1 = 1 AND MA% = ER% AND MB% = EC% THEN GOSUB BLOWUP
35 IF MA% = 1 THEN MA% = 30
36 END IF
37 LOCATE (ER%), (EC%)
38 COLOR (2): PRINT "ù"
39 LOCATE (SHOT1%), (SHOT2%)
40 COLOR (14): PRINT "≠"
41 LOCATE 1, 1: PRINT ONAME$; " "; LNAME$; "  POWER:"; P; " LEVEL:"; L;
42 LOCATE 2, 1: PRINT "SCORE:"; SC; "   HEAT-SEEKERS:"; HSM
43 LOCATE 3, 1: PRINT HRD1$; HRD1; " "; HRD2$; HRD2; " "; HRD3$; HRD3
        IF SHOT2 = 0 THEN SHOT1% = ER% + 1
        IF SHOT2 = 0 THEN SHOT2% = EC%
        IF SHOT2 = 0 THEN X = X + 1
        IF X = 1 OR X = 2 THEN EC% = EC% + 1
        IF X = 3 OR X = 4 THEN EC% = EC% - 1
        IF X = 5 THEN GOSUB COMSHOT
        IF SHOT2 = 1 THEN SHOT1% = SHOT1% + 1
        IF SHOT1% = B% AND SHOT2% = A% THEN GOSUB OUCH
        IF SHOT1% = 25 THEN SHOT2 = 0
        IF A% = EC% AND B% = ER% + 1 OR B% = ER% + 2 OR B% = ER% + 3 THEN GOSUB LASER
        IF B% = ER% AND A% = EC% THEN
        P = P - 1
        SC = SC + 25
        EB = EB + 1
        END IF
49 kbd$ = INKEY$
50 kbd$ = UCASE$(kbd$)
51 SELECT CASE kbd$
  CASE "A": A% = A% - 1
  CASE "D": A% = A% + 1
  CASE "W": B% = B% - 1
  CASE "S": B% = B% + 1
  CASE " ": GOSUB SHOOTING
  CASE "X": GOSUB HARD1
  CASE "C": GOSUB HARD2
  CASE "V": GOSUB HARD3
  CASE "": GOSUB ENDIT
  CASE "P": GOSUB PAUSE
  CASE "Z": GOSUB HSMFIRE
  CASE "Q": IF Y = 1 THEN GOSUB BLOWUP
57 END SELECT
   IF SC < 0 THEN GOSUB GAMEOVER
58 LOOP
59 OUCH:
60 P = P - 1
61 IF P = 0 THEN GOSUB GAMEOVER
62 RETURN
63 BLOWUP:
64 EB = EB + 1
65 SC = SC + 25
   IF HRD = 3 THEN SC = SC + 25
   IF HRD = 2 THEN SC = SC + 50
66 IF EB = 10 THEN GOSUB NEWLEVEL
67 SHOT1% = 2: SHOT2% = EC%
68 EC% = 17: ER% = 7
69 RETURN
70 COMSHOT:
71 X = 0
72 SHOT2 = 1
73 RETURN
74 SHOOTING:
75 SHOOT1 = 1
   MA% = B%
   MB% = A%
   J$ = "!"
76 RETURN
77 ENDIT:
78 CLS
79 END
80 PAUSE:
81 PRINT "PRESS ENTER TO CONTINUE...."
82 INPUT "", ENTER$
83 CLS
84 RETURN
85 GAMEOVER:
86 GOSUB CHECKSC: CLS
 LOCATE (B%), (A%)
 COLOR (9): PRINT ""
 IF SHOOT1 = 1 THEN
 LOCATE (MA%), (MB%)
 COLOR (14): PRINT J$
 IF MA% > 1 THEN MA% = MA% - 1
 IF MA% = 1 THEN
   SHOOT1 = 0
   HRD = 0
END IF
 IF MA% = 1 THEN MA% = 30
 END IF
 LOCATE (ER%), (EC%)
 COLOR (2): PRINT "ù"
 LOCATE (SHOT1%), (SHOT2%)
 COLOR (14): PRINT "≠"
 LOCATE 1, 1: PRINT ONAME$; " "; LNAME$; "  POWER:"; P; " LEVEL:"; L;
 LOCATE 2, 1: PRINT "SCORE:"; SC; "   HEAT-SEEKERS:"; HSM
 LOCATE 3, 1: PRINT HRD1$; HRD1; " "; HRD2$; HRD2; " "; HRD3$; HRD3

LOCATE (5), (5): PRINT "      ___   ___        ___      ___            ___    ___"
LOCATE (6), (5): PRINT "     |  _  |___| |\/| |__      |   |  \   /   |__    |___|"
LOCATE (7), (5): PRINT "     |___| |   | |  | |___     |___|   \_/    |___   |  \"
90 P = 10: A% = 15: SC = 0: HSM = 0
91 SLEEP 5: GOTO 0
92 NEWLEVEL:
93 CLS
94 PRINT "Congratulations, Pilot "; LNAME$
95 PRINT "you have completed your mission!"
96 PRINT "PRESS ENTER TO GO TO SHOP."
97 PRINT "  \/"
98 PRINT "   X"
99 PRINT "  / \"
100 PRINT "BONUS: 500 POINTS!": PRINT "BONUS: 2 SUPER MISSILES "
101 SC = SC + 500: HSM = HSM + 2: L = L + 1
102 X = 0
103 EB = 0
104 INPUT "", ENTER$: GOSUB SHOP: RETURN
IF L = 25 THEN GOSUB RANKS
105 CHECKSC:
106 CLS
107 PRINT "SCORE:"; SC
108 CLOSE #1
109 OPEN FILE1$ FOR OUTPUT AS #1
110 IF SC > A THEN
111 W$ = "Pilot " + ONAME$ + " " + LNAME$
IF Y = 1 THEN W$ = W$ + "   (CHEAT MODE)"
112 WRITE #1, W$, SC, A$, A, B$, B
113 CLOSE #1
114 RETURN
115 END IF
116 IF SC > B AND SC < A THEN
117 W$ = "Pilot " + ONAME$ + " " + LNAME$
IF Y = 1 THEN W$ = W$ + "   (CHEAT MODE)"
118 WRITE #1, A$, A, W$, SC, B$, B
119 CLOSE #1
120 RETURN
121 END IF
122 IF SC > C AND SC < B THEN
123 W$ = "Pilot " + ONAME$ + " " + LNAME$
IF Y = 1 THEN W$ = W$ + "   (CHEAT MODE)"
124 WRITE #1, A$, A, B$, B, W$, SC
125 CLOSE #1
126 RETURN
127 END IF
128 IF SC < C THEN
129 PRINT "SORRY, YOU DID NOT MAKE THE HIGH SCORE LIST."
130 WRITE #1, A$, A, B$, B, C$, C
131 CLOSE #1
132 RETURN
133 END IF
134 HSMFIRE:
    IF HSM = 0 THEN RETURN
135 HSM = HSM - 1
136 GOSUB BLOWUP
137 RETURN
138 CHEATMODE:
139 CLS
140 PRINT "SECRET MODE"
141 PRINT "ENTER YOUR FIRST NAME:"
142 INPUT "", ONAME$
143 CLS
144 PRINT "SECRET MODE"
145 PRINT
146 PRINT
147 PRINT "Added to your stock:"
148 PRINT "20 HEAT-SEEKING MISSILES"
149 PRINT "5 POWER POINTS"
150 PRINT "1000 BONUS POINTS"
151 PRINT "POWER BOMBS (A BUTTON)": PRINT : PRINT
152 HSM = HSM + 20: P = P + 5: SC = SC + 1000
153 Y = 1
154 RETURN
155 LASER:
156 L1% = ER% + 1
157 L2% = ER% + 2
158 L3% = ER% + 3
159 LC% = EC%
160 LOCATE (L1%), (LC%)
161 COLOR (4): PRINT "∫"
162 LOCATE (L2%), (LC%)
163 COLOR (4): PRINT "∫"
164 LOCATE (L3%), (LC%)
165 COLOR (4): PRINT "∫"
166 P = P - 2
167 B% = B% + 5
168 IF P <= 0 THEN GOSUB GAMEOVER
169 SLEEP 1: RETURN
170 SHOP:
171 CLS
172 PRINT "POINTS:"; SC
173 PRINT "[Bob's Super Ship Parts]"
174 PRINT "  "
175 PRINT "<X> "; ONAME$
176 PRINT "/ \ "; LNAME$
177 PRINT "1 - Weapons1:"; HRD1$; HRD1
178 PRINT "2 - Weapons2:"; HRD2$; HRD2
179 PRINT "3 - Weapons3:"; HRD3$; HRD3
180 PRINT "SELL (1-3) OR BUY"
181 PRINT "4 - HEAT-SEEKING MISSILE @ 30pts"
182 PRINT "5 - 3 SUPER BOMBS @ 100pts"
183 PRINT "6 - 5 POWER PTS @ 500pts"
184 PRINT "7 - SEMI-AUTO GUN @ 600pts"
185 PRINT "8 - 50 BULLETS FOR SEMI-AUTO GUN @ 500pts"
186 PRINT "9 - SURPRISE PACKAGE 1 @ 1000pts"
187 PRINT "10 - SURPRISE PACKAGE 2 @ 1500pts"
189 INPUT "", STORE
 IF STORE = 0 OR STORE > 10 THEN GOTO 24
 IF STORE = 1 THEN GOSUB SELL1
 IF STORE = 2 THEN GOSUB SELL2
 IF STORE = 3 THEN GOSUB SELL3
 IF STORE = 4 THEN GOSUB BUY1
 IF STORE = 5 THEN GOSUB BUY2
 IF STORE = 6 THEN GOSUB BUY3
 IF STORE = 7 THEN GOSUB BUY4
 IF STORE = 8 THEN GOSUB BUY5
 IF STORE = 9 THEN GOSUB BUY6
 IF STORE = 10 THEN GOSUB BUY7
 IF STORE >= 1 AND STORE < 11 THEN GOSUB SHOP
SELL1:
CLS
IF HRD1$ <> "" THEN GUN1 = 500
AMMO1 = HRD1 * 50
PRINT " "
PRINT "<X\"
PRINT "/ \ I'LL GIVE YOU"; GUN1 + AMMO1; " POINTS FOR THAT"
SLEEP 1
SC = SC + GUN1 + AMMO1
HRD1$ = ""
HRD1 = 0
RETURN
SELL2:
CLS
IF HRD2$ <> "" THEN GUN2 = 500
AMMO2 = HRD2 * 50
PRINT " "
PRINT "<X\"
PRINT "/ \ I'LL GIVE YOU"; AMMO2 + GUN2; "POINTS FOR THAT"
SLEEP 1
SC = SC + GUN2 + AMMO2
HRD2$ = ""
HRD2 = 0
RETURN
SELL3:
CLS
IF HRD3$ <> "" THEN GUN3 = 500
AMMO3 = HRD3 * 50
PRINT " "
PRINT "<X\"
PRINT "/ \ I'LL GIVE YOU"; GUN3 + AMMO3; "POINTS FOR THAT"
SLEEP 1
SC = SC + GUN3 + AMMO3
HRD3$ = ""
HRD3 = 0
RETURN
BUY1:
CLS
PRINT " "
PRINT "<X\ "
PRINT "/ \ ONE HEAT SEEKING MISSILE"
SLEEP 1
HSM = HSM + 1
SC = SC - 30
RETURN
BUY2:
CLS
PRINT "    "
PRINT "<X\ >--"
PRINT "/ \ INSTALLED ON Weapons1"
SLEEP 1
HRD1$ = "SUPER BOMB"
HRD1 = HRD1 + 3
SC = SC - 100
RETURN
BUY3:
CLS
SLEEP 3
PRINT " "
PRINT "<X\     "
PRINT "/ \ THE REPAIRS ARE FINISHED"
SLEEP 1
P = P + 5
SC = SC - 500
RETURN
BUY4:
CLS
PRINT " "
PRINT "<X\ =======( "
PRINT "/ \ THE GUN CAN ONLY FIT INTO Weapons3"
SLEEP 1
HRD3$ = "SEMI-AUTO GUN"
H3$ = "|"
SC = SC - 600
RETURN
BUY5:
CLS
PRINT " "
PRINT "<X\"
PRINT "/ \ 50 BULLETS. YOU OWE 500pts"
SLEEP 1
SC = SC - 500
IF HRD3$ = "SEMI-AUTO GUN" THEN HRD3 = HRD3 + 50
RETURN
BUY6:
CLS
PRINT "   INCLUDES:"
PRINT "<X\  15 AMMO FOR HARDPOINTS 1, 2, & 3"
PRINT "/ \  LASER GUN FOR HARDPOINT 2 & 10 LASERS"
PRINT "     POWER WILL BE SET TO 10"
HRD1 = HRD1 + 15
HRD2 = HRD2 + 15
HRD3 = HRD3 + 15
HRD2$ = "LASER"
HRD2 = HRD2 + 10
H2$ = "*"
P = 10
SC = SC - 1000
SLEEP 3
RETURN
BUY7:
CLS
PRINT "   INCLUDES"
PRINT "<X\  POWER SET TO 20"
PRINT "/ \  HARDPOINT AMMO SET TO 50"
PRINT "     20 HEAT SEEKING MISSILES"
SLEEP 3
P = 20
HRD1 = 50
HRD2 = 50
HRD3 = 50
HSM = HSM + 20
SC = SC - 1500
RETURN
HARD1:
IF HRD1 = 0 THEN RETURN
GOSUB BLOWUP
HRD1 = HRD1 - 1
RETURN
HARD2:
IF HRD2 = 0 THEN RETURN
SHOOT1 = 1
MA% = B%
MB% = A%
J$ = H2$
HRD2 = HRD2 - 1
HRD = 2
RETURN
HARD3:
IF HRD3 = 0 THEN RETURN
SHOOT1 = 1
MA% = B%
MB% = A%
J$ = H3$
HRD3 = HRD3 - 1
HRD = 3
RETURN

RANKS:
CLS
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT " > Sir, I've completed Mission 25"
PRINT "/X"
PRINT "/ \"
PRINT "   Great job, Pilot."
PRINT "/X\ You can rest for a while."
PRINT "/ \ Take the weekend off"
SLEEP 3
CLS
PRINT "THE END"
SLEEP 1
CLS
GOSUB GAMEOVER
RETURN

